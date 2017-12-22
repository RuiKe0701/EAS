package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.*;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.AttendanceRecordService;
import com.ruike.eas.service.ClassService;
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
    @Resource
    private ClassteacherService classteacherService;
    @Resource
    private ClassService classService;
    @RequestMapping("/attendancerecord")
    public String Attend(HttpServletRequest request){
        int a=0;
        if(a==1) {
            Classteacher classteacher = new Classteacher();
            classteacher.setTeacher_id(1);
            List<Classteacher> classteacherList = attendanceRecordService.classteacherlist(classteacher);
            List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
            request.setAttribute("oldclassteacherList",classteacherList1);
            Integer classid = 0;
            if (classteacherList.size() > 0) {
                request.setAttribute("classteacherList", classteacherList);
                classid = classteacherList.get(0).getClass_id();
            }
            Classattendance classattendance = new Classattendance();
            classattendance.setClass_id(classid);
            List<Classattendance> classattendances = attendanceRecordService.selectClassttend(classattendance);
            for (Classattendance classattendance1 : classattendances) {
                System.out.println(classattendance1.getCad_name());
            }
            request.setAttribute("quan",3);
            request.setAttribute("classattendances", classattendances);
            return "classattencercord";
        }else{
            System.out.println("sssssssssssssssssssssssssssssssssssssssssssssssssssss");
            Class class1 = new Class();
            class1.setGrade_id(1);
            List<Class> classes = classService.selectClass(class1);
            request.setAttribute("classes", classes);
            Integer classid = 0;
            if (classes.size() > 0) {
                request.setAttribute("classteacherList", classes);
                classid = classes.get(0).getClass_id();
            }
            Classattendance classattendance = new Classattendance();
            classattendance.setGradeid(1);
            List<Classattendance> classattendances = attendanceRecordService.selectclassstdBygrade(classattendance);
            for (Classattendance classattendance1 : classattendances) {
                System.out.println(classattendance1.getCad_name());
            }

            request.setAttribute("quan",1);
            request.setAttribute("classattendances", classattendances);
            return "classattencercord";
        }
    }
    //查询班级出勤详情
    @RequestMapping("/dostuattendancerecord")
    public void Attends(PrintWriter printWriter,Integer cadid){
        Stuattendance stuattendance=new Stuattendance();
        stuattendance.setCad_id(cadid);
        List<Stuattendance> stuattendanceList=attendanceRecordService.selectstuatdlist(stuattendance);
        for (Stuattendance stuattendance1 : stuattendanceList) {
            System.out.println(stuattendance1.getAttendancetime()+"sss"+stuattendance1.getStu_id());
        }
        String jsonString = JSON.toJSONString(stuattendanceList);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
    //根据班级id查询班级出勤记录
    @RequestMapping("/doselectclassatdss")
    public void selectclassatdss(PrintWriter printWriter, Integer classsid,String startday,String stopday,String classname){

        Classattendance classattendance=new Classattendance();
        System.out.println(startday);
        if(startday!=null && startday.length()>0) {
            classattendance.setStartdays(startday);
            System.out.println(classattendance.getStartday());
        }
        if(stopday!=null && stopday.length()>0){
            classattendance.setStopdays(stopday);
        }
        if(classname!=null&& classname!=""){
                Classteacher classteacher=new Classteacher();
                classteacher.setTeacher_id(1);
                Class cla=new Class();
                cla.setClass_name(classname);
                classteacher.setClasses(cla);
                List<Classteacher> classteachers = classteacherService.selectClassteacher(classteacher);
                int wa=0;
                if(classteachers.size()>0){
                    wa=classteachers.get(0).getClasses().getClass_id();
                    classattendance.setClass_id(wa);
                    List<Classattendance> classattendanceList = attendanceRecordService.selectClassttend(classattendance);
                    for (Classattendance classattendance1 : classattendanceList) {
                        System.out.println(classattendance1.getCad_name());
                    }
                    String jsonString = JSON.toJSONString(classattendanceList);
                    printWriter.write(jsonString);
                    printWriter.flush();
                    printWriter.close();
                }else {
                    String jsonString = JSON.toJSONString(0);
                    printWriter.write(jsonString);
                    printWriter.flush();
                    printWriter.close();
                }
        }else if(classsid!=null) {
            classattendance.setClass_id(classsid);
            List<Classattendance> classattendanceList = attendanceRecordService.selectClassttend(classattendance);
            for (Classattendance classattendance1 : classattendanceList) {
                System.out.println(classattendance1.getCad_name());
            }
            String jsonString = JSON.toJSONString(classattendanceList);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }

}
