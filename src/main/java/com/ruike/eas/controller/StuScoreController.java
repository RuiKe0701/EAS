package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.*;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.ClassExamService;
import com.ruike.eas.service.ClassScoreService;
import com.ruike.eas.service.ClassteacherService;
import com.ruike.eas.util.ExcelOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/12.
 */
@Controller
public class StuScoreController {

    @Resource
    private ClassteacherService classteacherService;

    @Resource
    private ClassExamService classExamService;

    @Resource
    private ClassScoreService classScoreService;

    @RequestMapping("/tzstuscore.do")
    public String tzStuScore(HttpServletRequest request){
        Classteacher classteacher = new Classteacher();
        //放入老师的id#################################################
        classteacher.setTeacher_id(1);
        Class c = new Class();
        //班级状态(1为结业,0为未结业)
        c.setStatus(0);
        //查询此老师在校的班级
        List<Classteacher> cs = classteacherService.selectClassteacher(classteacher);
        //取出第一个班级id
        Integer class_id = cs.get(0).getClass_id();
        ClassScore classScore = new ClassScore();
        classScore.setClass_id(class_id);
        List<ClassScore> classScores = classScoreService.selectClassScoreByClass(classScore);
        request.setAttribute("cs",cs);
        request.setAttribute("classScores",classScores);
        return "stuscore";
    }

    /**
     * 班级级联查询可以导入的级联班级考试
     * @param classExam 班级考试实体
     * @param printWriter
     */
    @RequestMapping("/ajaxclassexaminfos.do")
    @ResponseBody
    public void ajaxClassExamInfo(ClassExam classExam , PrintWriter printWriter){
        //大于参加日期 即参加完考试
        classExam.setCe_Examday(new Date());
        //查找参见完考试 但是没有录入成绩的班级考试
        List<ClassExam> classExams = classExamService.findClassExamByNull(classExam);
        printWriter.print(classExams!=null && classExams.size()>0?JSON.toJSONString(classExams):0);
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/ajaxaddallstuscore.do")
    @ResponseBody
    public void ajaxAddStuScore(HttpServletRequest req, HttpServletResponse res, PrintWriter printWriter){
        String class_id = req.getParameter("class_Id");
        String ce_id = req.getParameter("ce_id");
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
        //取出选择的文件流
        MultipartFile upload = multipartRequest.getFile("upload");
        ClassScore classScore = new ClassScore();
        classScore.setCs_Createdate(new Date());
        classScore.setCs_State(0);
        classScore.setCe_Id(Integer.parseInt(ce_id));
        if (upload != null){
            //声明学生集合
            List<StuScore> stuScores = null;
            try {
                StuScore stuScore = new StuScore();
                stuScore.setCe_Id(Integer.parseInt(ce_id));
                //把导入的excel转换成学生的对象集合(文件名称,文件的流)
                stuScores = ExcelOperation.readStuScoreExcel(upload.getOriginalFilename(), upload.getInputStream(), stuScore, classScore);
            } catch (IOException e) {
                e.printStackTrace();
            }
            if (stuScores != null && stuScores.size() > 0){
                //批量插入学生成绩及其班级成绩
                Integer count = classExamService.insertBatchClassExam(stuScores, classScore, Integer.parseInt(class_id));
                printWriter.print(count);
            }else {
                printWriter.print(-1);
            }
        }
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/ajaxfindclassscoreinfo.do")
    @ResponseBody
    public void ajaxClassScoreInfo(ClassScore classScore, PrintWriter printWriter){
        //根据班级查询考试
        List<ClassScore> classScores = classScoreService.selectClassScoreByClass(classScore);
        printWriter.print(classScores!=null && classScores.size()>0 ?JSON.toJSONString(classScores):0);
        printWriter.flush();
        printWriter.close();
    }
}
