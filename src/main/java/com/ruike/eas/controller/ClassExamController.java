package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.*;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.ClassExamService;
import com.ruike.eas.service.ClassteacherService;
import com.ruike.eas.service.SchoolExamService;
import com.ruike.eas.service.StuScoreService;
import com.ruike.eas.util.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/11.
 */
@Controller
public class ClassExamController {

    @Resource
    private ClassteacherService classteacherService;

    @Resource
    private ClassExamService classExamService;

    @Resource
    private SchoolExamService schoolExamService;

    @Resource
    private StuScoreService stuScoreService;

    @RequestMapping("/tzclassexam.do")
    public String tzClassExam(ClassExam classExam , HttpServletRequest request){
        Classteacher classteacher = new Classteacher();
        //放入老师的id
        classteacher.setTeacher_id(1);
        Class c = new Class();
        //班级状态(1为结业,0为未结业)
        c.setStatus(0);
        //查询此老师在校的班级
        List<Classteacher> cs = classteacherService.selectClassteacher(classteacher);
        classExam.setClass_Id(cs.get(0).getClass_id());
        List<ClassExam> classExams = classExamService.selectClassExam(classExam);
        request.setAttribute("classExams",classExams);
        request.setAttribute("cs",cs);
        return "classexam";
    }

    @RequestMapping("/ajaxselectclassexam.do")
    @ResponseBody
    public void ajaxSelectClassExam(ClassExam classExam ,String ce_Examdays ,String stopDates ,PrintWriter printWriter){
        classExam.setCe_Examday(ce_Examdays != null && ce_Examdays.length() > 0 ? DateUtil.dateFormat(ce_Examdays,"yyyy-MM-dd") : null);
        classExam.setStopDate(stopDates != null && stopDates.length() > 0 ? DateUtil.dateFormat(stopDates,"yyyy-MM-dd") : null);
        List<ClassExam> classExams = classExamService.selectClassExam(classExam);
        printWriter.print(JSON.toJSONString(classExams));
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/ajaxselectschoolexambytype.do")
    @ResponseBody
    public void ajaxSelectSchoolExamByType(Integer examType ,PrintWriter printWriter){
        SchoolExam schoolExam = new SchoolExam();
        schoolExam.setCurrentPage(1);
        //填入要查找的属性
        schoolExam.setSe_Examtype(examType);
        //结束时间小与当前时间的不显示
        schoolExam.setDisDate(new Date());
        List<SchoolExam> schoolExams = schoolExamService.selectBySchoolExamInfo(schoolExam);
        printWriter.print(JSON.toJSONString(schoolExams));
        printWriter.flush();
        printWriter.close();
    }
    @RequestMapping("/ajaxsaveclassexam.do")
    @ResponseBody
    public void ajaxSaveClassExam(ClassExam classExam , String examdays,PrintWriter printWriter){
        //判定并放入参加时间
        classExam.setCe_Examday(examdays!=null && examdays.length()>0 ?DateUtil.dateFormat(examdays,"yyyy-MM-dd"):null);
        //放入创建时间
        classExam.setCe_Createdate(new Date());
        //调用单个添加方法
        Integer integer = classExamService.addClassExamInfo(classExam);
        printWriter.print(integer);
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/ajaxverification.do")
    @ResponseBody
    public void ajaxVerification(StuScore stuScore,PrintWriter printWriter){
        List<StuScore> stuScores = stuScoreService.selectStuScore(stuScore);
        printWriter.print(stuScores != null && stuScores.size() > 0 ? 1 : 0);
        printWriter.flush();
        printWriter.close();
    }
}
