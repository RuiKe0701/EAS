package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.pojo.SchoolExam;
import com.ruike.eas.service.ClassService;
import com.ruike.eas.service.SchoolExamService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
@Controller
public class SchoolExamController {

    @Resource
    private SchoolExamService schoolExamService;

    @Resource
    private ClassService classService;

    @RequestMapping("/tzscoreexam")
    public String tzScoreExam(HttpServletRequest request){
        SchoolExam exam = new SchoolExam();
        exam.setSe_State(0);
        exam.setCurrentPage(1);
        List<SchoolExam> schoolExams = schoolExamService.selectBySchoolExamInfo(exam);
        exam.setList(schoolExams);
        request.setAttribute("schoolExams",exam);
        return "scoreexam";
    }

    @RequestMapping("/ajaxexaminfo.do")
    @ResponseBody
    public void ajaxExamInfo(SchoolExam schoolExam , PrintWriter printWriter){
        schoolExam.setSe_State(0);
        List<SchoolExam> schoolExams = schoolExamService.selectBySchoolExamInfo(schoolExam);
        schoolExam.setList(schoolExams);
        String str = JSON.toJSONString(schoolExam);
        printWriter.print(str);
        printWriter.flush();
        printWriter.close();
    }
    @RequestMapping("/selectclassbytype.do")
    @ResponseBody
    public void selectClassByType(Class c , PrintWriter printWriter){
        //未结业班级
        c.setClass_state(0);
        //根据年级id和未结业查询班级
        List<Class> classList = classService.selectClass(c);
        printWriter.print(JSON.toJSONString(classList));
        printWriter.flush();
        printWriter.close();
    }
    @RequestMapping("/addschoolexam")
    @ResponseBody
    public void addSchoolExam(SchoolExam schoolExam ,PrintWriter printWriter ,HttpServletRequest request){
        //创建时间
        schoolExam.setSe_Createdate(new Date());
        //标识是否删除
        schoolExam.setSe_State(0);
        //##################################################此处为创建人 暂时为1 有登陆功能则填入登陆账号的老师
        schoolExam.setSe_Createby(1);
        Integer integer = schoolExamService.addSchoolExamInfo(schoolExam);
        printWriter.print(integer);
        printWriter.flush();
        printWriter.close();
    }
    @RequestMapping("/deleteschool")
    @ResponseBody
    public void deleteSchool(SchoolExam schoolExam ,PrintWriter printWriter){
        //1为删除状态
        schoolExam.setSe_State(1);
        //调用删除方法
        Integer integer = schoolExamService.removeSchoolExamInfo(schoolExam);
        printWriter.print(integer);
        printWriter.flush();
        printWriter.close();
    }
}
