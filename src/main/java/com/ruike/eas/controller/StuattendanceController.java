package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Classstu;
import com.ruike.eas.pojo.Classteacher;
import com.ruike.eas.pojo.Stuattendance;
import com.ruike.eas.service.AttendanceRecordService;
import com.ruike.eas.service.StuattendanceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class StuattendanceController {
    @Resource
    private AttendanceRecordService attendanceRecordService;
    @Resource
    private StuattendanceService stuattendanceService;
    /*
    班级学生主任查看页面
     */
    @RequestMapping("/zhuclassstuattencercord.do")
    public String Classstuadts(HttpServletRequest request){
        Classteacher classteacher=new Classteacher();
        Integer thid=(Integer) request.getSession().getAttribute("th");
        classteacher.setTeacher_id(thid);
        List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
        List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
        request.setAttribute("oldclassteacherList",classteacherList1);
        Integer classid=0;
        if(classteacherList.size()>0){
            request.setAttribute("classteacherList",classteacherList);
            classid=classteacherList.get(0).getClass_id();
        }
        Stuattendance stuattendance=new Stuattendance();
        stuattendance.setClass_id(classid);
        List<Stuattendance> stuattendanceList=stuattendanceService.selectsatdbyclassid(stuattendance);
        request.setAttribute("stuattendanceList",stuattendanceList);
        return "stuattencercord";
    }
    /*
  班级学生考勤页面
   */

    @RequestMapping("/classstuattencercord")
    public String Classstuadt(HttpServletRequest request){
        Classteacher classteacher=new Classteacher();
        Integer thid=(Integer) request.getSession().getAttribute("th");
        classteacher.setTeacher_id(thid);
        List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
        List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
        request.setAttribute("oldclassteacherList",classteacherList1);
        Integer classid=0;
        if(classteacherList.size()>0){
            request.setAttribute("classteacherList",classteacherList);
            classid=classteacherList.get(0).getClass_id();
        }
        Stuattendance stuattendance=new Stuattendance();
        stuattendance.setClass_id(classid);
        List<Stuattendance> stuattendanceList=stuattendanceService.selectsatdbyclassid(stuattendance);
        request.setAttribute("stuattendanceList",stuattendanceList);
        return "stuattencercord";
    }
    /*
    根据班级id获取班级学生的出勤情况
     */
    @RequestMapping("/selectstuadtbyclassid")
    public void Selectstuadtbyclassid(Integer classid , PrintWriter printWriter){
        Stuattendance stuattendance=new Stuattendance();
        stuattendance.setClass_id(classid);
        System.out.println(classid);
        List<Stuattendance> stuattendanceList=stuattendanceService.selectsatdbyclassid(stuattendance);
        for (Stuattendance stuattendance1 : stuattendanceList) {
            System.out.println(stuattendance1.getAttendancetime()+"[]"+stuattendance1.getClassattendancetime()+"dsdsds"+stuattendance1.getAttendancerate());
        }
        String jsonString = JSON.toJSONString(stuattendanceList);
        System.out.println("sss");
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
    /*
    学生详细考勤页面
     */
    @RequestMapping("/stuattebcercorerecord")
    public String Stuatt(){
        return "stuattebcercorerecord";
    }
    /*

     */
    @RequestMapping("/stuattebcercorerecordbystu")
    public String Stuattsbystu(Integer classid,Integer stuid,String l,Integer zhuang,HttpServletRequest request){
        Classteacher classteacher=new Classteacher();
        Integer thid=(Integer) request.getSession().getAttribute("th");
        classteacher.setTeacher_id(thid);
        List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
        List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
        Classstu classstu=new Classstu();
        classstu.setClass_id(classid);
        List<Classstu> classstus=stuattendanceService.selectClassstubyclassid(classstu);
        request.setAttribute("oldclassteacherList",classteacherList1);
        request.setAttribute("classstus",classstus);
        request.setAttribute("classteacherList",classteacherList);
        request.setAttribute("classid",classid);
        request.setAttribute("zhuang",zhuang);
        request.setAttribute("stuid",stuid);
        System.out.println(zhuang);
        Stuattendance stuattendance=new Stuattendance();
        stuattendance.setStu_id(stuid);
        stuattendance.setClass_id(classid);
        List<Stuattendance> stuattendanceList=new ArrayList<Stuattendance>();
        stuattendanceList=attendanceRecordService.selectstuatdlist(stuattendance);
        request.setAttribute("stuattendanceList",stuattendanceList);
        request.setAttribute("xq",0);
        System.out.println(classid+"+++++++++++++++"+stuid);
        return "stuattebcercorerecord";
    }
    /*
    查询班级学生出勤
     */
 /*
 根据班级id改变学员
  */
 @RequestMapping("/selectstubyclassids")
    public String SelectStuByClassids(Integer classid,Integer zhuang,HttpServletRequest request,Integer xq){
     Classteacher classteacher=new Classteacher();
     Integer thid=(Integer) request.getSession().getAttribute("th");
     classteacher.setTeacher_id(thid);
     List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
     List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
     Classstu classstu=new Classstu();
     classstu.setClass_id(classid);
     List<Classstu> classstus=stuattendanceService.selectClassstubyclassid(classstu);
     Integer stuid=0;
     if(classstus!=null&&classstus.size()>0){
         Stuattendance stuattendance=new Stuattendance();
         stuattendance.setClass_id(classid);
         stuid=classstus.get(0).getStu_id();
         stuattendance.setStu_id(stuid);
         List<Stuattendance> stuattendanceList=new ArrayList<Stuattendance>();
         stuattendanceList=attendanceRecordService.selectstuatdlist(stuattendance);
         request.setAttribute("stuattendanceList",stuattendanceList);
     }
     request.setAttribute("oldclassteacherList",classteacherList1);
     request.setAttribute("zhuang",zhuang);
     request.setAttribute("classstus",classstus);
     request.setAttribute("classteacherList",classteacherList);
     request.setAttribute("classid",classid);
     request.setAttribute("stuid",stuid);
     request.setAttribute("xq",xq);
     System.out.println(xq+"ssssssssssssssssss");
     return "stuattebcercorerecord";
 }
 /*
 根据学生id获取学生的出勤详情
  */
 @RequestMapping("/selectstuadtbystuid")
    public void SelectStuadtByStuid(PrintWriter printWriter,Integer stuid,Integer classid){
     Stuattendance stuattendance=new Stuattendance();
     stuattendance.setClass_id(classid);
     System.out.println(classid);
     stuattendance.setStu_id(stuid);
     List<Stuattendance> stuattendanceList=new ArrayList<Stuattendance>();
     stuattendanceList=attendanceRecordService.selectstuatdlist(stuattendance);
     for (Stuattendance stuattendance1 : stuattendanceList) {
         System.out.println(stuattendance1.getAttendancetime()+"[]"+stuattendance1.getClassattendancetime()+"dsdsds"+stuattendance1.getAttendancerate());
     }
     String jsonString = JSON.toJSONString(stuattendanceList);
     System.out.println("sss");
     printWriter.write(jsonString);
     printWriter.flush();
     printWriter.close();
 }
}
