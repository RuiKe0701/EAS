package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.*;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.*;
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
import java.util.ArrayList;
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

    @Resource
    private StuScoreService stuScoreService;

    @Resource
    private StudentService studentService;

    @Resource
    private ClassService classService;

    @RequestMapping("/tzstuscore.do")
    public String tzStuScore(HttpServletRequest request){
        Classteacher classteacher = new Classteacher();
        //取出老师id#################################################
        Integer th_id = (Integer)request.getSession().getAttribute("th");//登录的老师id
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

    @RequestMapping("/tzstuscoreinfo.do")
    public String tzStuScoreInfo(StuScore stuScore ,HttpServletRequest request){
        //取出权限id
        Integer thtype = (Integer) request.getSession().getAttribute("thtype");
        //0为班级 1为教员 2为一年主任 3为二年主任
        if (thtype >  1) {
            Class c = new Class();
            //查询所有班级
            Integer gread_id = stuScore != null && stuScore.getGread_id() != null ? stuScore.getGread_id() : thtype == 2 ? 1:3; //如果权限为一年主任 则默认查询s1 二年主任默认查询s2
            c.setGrade_id(gread_id);
            stuScore.setGread_id(gread_id);
            List<Class> classes = classService.selectClass(c);
            request.setAttribute("classes", classes);
            ClassExam classExam = new ClassExam();
            //如果第一次进此控制器则用查询出来的第一个班级
            Integer class_id = stuScore != null && stuScore.getClass_id() != null ? stuScore.getClass_id() : classes != null && classes.size() > 0 ?classes.get(0).getClass_id():null;
           if (class_id != null){
               classExam.setClass_Id(class_id);
               //查询此班级参加的考试
               List<ClassExam> classExams = classExamService.selectExamHasBeen(classExam);
               request.setAttribute("classExams", classExams);
               //如果为null则为第一次进入 或者前段改变了选择班级
               stuScore.setCe_Id(stuScore != null && stuScore.getCe_Id() != null ? stuScore.getCe_Id() : classExams != null && classExams.size() > 0 ? classExams.get(0).getCe_Id() : null);
               stuScore.setClass_id(class_id);
               stuScore.setGread_id(gread_id);
               //查询指定班级指定考试的学生成绩
               if (classExams != null && classExams.size() > 0) {
                   List<StuScore> stuScores = stuScoreService.selectStuScore(stuScore);
                   request.setAttribute("stuScores", stuScores);
               }
               Stu stu = new Stu();
               Class cc = new Class();
               cc.setClass_id(class_id);
               stu.setClasses(cc);
               //存入前端判定数据
               if (class_id != null) {
                   List<Stu> stus = studentService.selectStuByClass(stu);
                   request.setAttribute("stus", stus);
               }
           }
        }else {
            Classteacher classteacher = new Classteacher();
            //取出登录的老师id
            Integer th_Id = (Integer)request.getSession().getAttribute("th");
            //放入老师id
            classteacher.setTeacher_id(th_Id);
            classteacher.setStatus(0);
            //声明班级集合
            List<Class> classes = new ArrayList<Class>();
            //查找此老师班级分配并把班级循环添加到此老师的班级集合中
            for (Classteacher classteacher1 : classteacherService.selectClassteacher(classteacher)) {
                classes.add(classteacher1.getClasses());
            }
            request.setAttribute("classes", classes);
            ClassExam classExam = new ClassExam();
            //如果第一次进此控制器则用查询出来的第一个班级
            Integer class_id = stuScore != null && stuScore.getClass_id() != null ? stuScore.getClass_id() : classes != null && classes.size() > 0 ?classes.get(0).getClass_id():null;
            if (class_id != null){
                classExam.setClass_Id(class_id);
                //查询此班级参加的考试
                List<ClassExam> classExams = classExamService.selectExamHasBeen(classExam);
                request.setAttribute("classExams", classExams);
                //如果为null则为第一次进入 或者前端改变了选择班级
                stuScore.setCe_Id(stuScore != null && stuScore.getCe_Id() != null ? stuScore.getCe_Id() : classExams != null && classExams.size() > 0 ? classExams.get(0).getCe_Id() : null);
                stuScore.setClass_id(class_id);
                //查询指定班级指定考试的学生成绩
                if (classExams != null && classExams.size() > 0) {
                    List<StuScore> stuScores = stuScoreService.selectStuScore(stuScore);
                    request.setAttribute("stuScores", stuScores);
                }
                Stu stu = new Stu();
                Class cc = new Class();
                cc.setClass_id(class_id);
                stu.setClasses(cc);
                //存入前端判定数据
                if (class_id != null) {
                    List<Stu> stus = studentService.selectStuByClass(stu);
                    request.setAttribute("stus", stus);
                }
            }
        }
        request.setAttribute("stuScore", stuScore);
        return "stuscoreinfo";
    }

    @RequestMapping("/ajaxstuscoreinfo.do")
    @ResponseBody
    public void ajaxClassExamInfo(StuScore stuScore ,PrintWriter printWriter){
        //查询指定班级指定考试的学生成绩
        List<StuScore> stuScores = stuScoreService.selectStuScore(stuScore);
        printWriter.print(stuScores!=null&&stuScores.size()>0?JSON.toJSONString(stuScores):0);
        printWriter.flush();
        printWriter.close();
    }
}
