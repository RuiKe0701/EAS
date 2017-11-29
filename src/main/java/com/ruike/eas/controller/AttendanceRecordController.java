package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Classattendance;
import com.ruike.eas.pojo.Classteacher;
import com.ruike.eas.pojo.Stuattendance;
import com.ruike.eas.service.AttendanceRecordService;
import com.ruike.eas.service.ClassteacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@Controller
public class AttendanceRecordController {
    @Resource
    private AttendanceRecordService attendanceRecordService;
    @RequestMapping("/attendancerecord")
    public String Attend(HttpServletRequest request){
        Classteacher classteacher=new Classteacher();
        classteacher.setTeacher_id(1);
        List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
        Integer classid=0;
        if(classteacherList.size()>0){
            request.setAttribute("classteacherList",classteacherList);
            classid=classteacherList.get(0).getClass_id();
        }
        Classattendance classattendance=new Classattendance();
        classattendance.setClass_id(classid);
        List<Classattendance> classattendances= attendanceRecordService.selectClassttend(classattendance);
        for (Classattendance classattendance1 : classattendances) {
            System.out.println(classattendance1.getCad_name());
        }
        request.setAttribute("classattendances",classattendances);
        return "classattencercord";
    }
    //查询班级出勤详情
    @RequestMapping("/dostuattendancerecord")
    public void Attends(PrintWriter printWriter,Integer cadid){
        Stuattendance stuattendance=new Stuattendance();
        stuattendance.setCad_id(cadid);
        List<Stuattendance> stuattendanceList=attendanceRecordService.selectstuatdlist(stuattendance);
        String jsonString = JSON.toJSONString(stuattendanceList);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
    //根据班级id查询班级出勤记录
    @RequestMapping("/selectclassatd")
    public void selectclassatd(PrintWriter printWriter, Integer classid, String startday,String stopday){
        Classattendance classattendance=new Classattendance();

    }
}
