package com.ruike.eas.controller;

import com.ruike.eas.pojo.Classstu;
import com.ruike.eas.pojo.Classteacher;
import com.ruike.eas.service.AttendanceRecordService;
import com.ruike.eas.service.StuattendanceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class StudentScoreController {
    @Resource
    private AttendanceRecordService attendanceRecordService;
    @Resource
    private StuattendanceService stuattendanceService;
    /*
    查询默认显示的学生成绩详情信息
     */
    @RequestMapping("/selectstuscore.do")
    public String Selectstuscore(HttpServletRequest request){
        Classteacher classteacher=new Classteacher();
        System.out.println("////////////////////////////////////////");
        Integer teacherid=(Integer) request.getSession().getAttribute("th");
        System.out.println(teacherid);
        classteacher.setTeacher_id(teacherid);
        //查看老师说正在带的班级
        List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
        //查看老师过去带的班级
        if(classteacherList.size()>0){
            Classstu classstu=new Classstu();
            classstu.setClass_id(classteacherList.get(0).getClass_id());
            List<Classstu> classstus=stuattendanceService.selectClassstubyclassid(classstu);
            request.setAttribute("classstus",classstus);
            request.setAttribute("classid",classteacherList.get(0).getClass_id());

        }
        List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
        request.setAttribute("oldclassteacherList",classteacherList1);
        request.setAttribute("classteacherList",classteacherList);
        Classstu classstu=new Classstu();
        //根据班级查询老师所带的学生


        return "studentscore";
    }

}
