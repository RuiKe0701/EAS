package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.*;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.AttendanceRecordService;
import com.ruike.eas.service.HomeworkService;
import com.ruike.eas.service.StuattendanceService;
import com.ruike.eas.service.StutotalscoreService;
import com.sun.org.apache.xerces.internal.xs.datatypes.ObjectList;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class StutotalscoreController {

    @Resource
    private AttendanceRecordService attendanceRecordService;
    @Resource
    private StuattendanceService stuattendanceService;
    @Resource
    private StutotalscoreService stutotalscoreService;
    @Resource
    private HomeworkService homeworkService;



    @RequestMapping("/usersssss")
    public String  sssss(){
        return "aa";
    }



    @RequestMapping("/userssss")
    public void aa(PrintWriter printWriter){
        List<Object> ss = new ArrayList<Object>();
        Stutotalscore stu=new Stutotalscore();
        stu.setClass_id(1);
        Class Teacher=new Class();
        Teacher.setClass_name("www");
        ss.add(Teacher);
        ss.add(stu);
        ss.get(1);
        String jsonString = JSON.toJSONString(ss);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
    /*
    学生总分页面
     */
    @RequestMapping("/stutatolscoreye.do")
    public String Stutatolescoereye(HttpServletRequest request){
        Classteacher classteacher=new Classteacher();
        Integer thid=(Integer) request.getSession().getAttribute("th");
        classteacher.setTeacher_id(thid);
        List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
        List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
        Classstu classstu=new Classstu();
        Integer classid=0;
        if(classteacherList.size()>0){
            classid= classteacherList.get(0).getClass_id();
        }
        classstu.setClass_id(classid);
        List<Classstu> classstus=stuattendanceService.selectClassstubyclassid(classstu);
        request.setAttribute("oldclassteacherList",classteacherList1);
        request.setAttribute("classstus",classstus);
        request.setAttribute("classteacherList",classteacherList);
        request.setAttribute("zhuang",0);
        request.setAttribute("classid", classid);

        Stutotalscore stutotalscore=new Stutotalscore();
        stutotalscore.setClass_id(classid);

        List<Stutotalscore> stutotalscoreList=new ArrayList<Stutotalscore>();
        stutotalscoreList=stutotalscoreService.selectStustsbystus(stutotalscore);
        request.setAttribute("stuhomeworkList",stutotalscoreList);
        request.setAttribute("xq",0);
        return "stutatolscore";
    }
    @RequestMapping("/selectstutatolscorebyclassid.do")
    public void Stutatolbyclassid(PrintWriter printWriter,Integer classid){
        Stutotalscore stutotalscore=new Stutotalscore();
        stutotalscore.setClass_id(classid);
        List<Stutotalscore> stutotalscoreList=new ArrayList<Stutotalscore>();
        stutotalscoreList=stutotalscoreService.selectStustsbystus(stutotalscore);
        String jsonString = JSON.toJSONString(stutotalscoreList);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
    @RequestMapping("/selctstutotalbyclassidandstuid.do")
    public String Stutotalbuclassid(HttpServletRequest request){
        Classteacher classteacher=new Classteacher();
        Integer thid=(Integer) request.getSession().getAttribute("th");
        classteacher.setTeacher_id(thid);
        List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
        List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
        Classstu classstu=new Classstu();
        Integer classid=0;
        if(classteacherList.size()>0){
            classid= classteacherList.get(0).getClass_id();
        }
        classstu.setClass_id(classid);
        List<Classstu> classstus=stuattendanceService.selectClassstubyclassid(classstu);
        request.setAttribute("oldclassteacherList",classteacherList1);
        request.setAttribute("classstus",classstus);
        request.setAttribute("classteacherList",classteacherList);
        request.setAttribute("zhuang",0);
        request.setAttribute("classid", classid);
        Integer stuid=0;
        if (classstus.size()>0){
            stuid=classstus.get(0).getStu_id();
        }
        request.setAttribute("stuid",stuid);

        Stuattendance stuattendance=new Stuattendance();
        Stuhomework stuhomework=new Stuhomework();
        stuhomework.setClass_id(classid);
        stuhomework.setStu_id(stuid);

        List<Stuhomework> stuhomeworkList=new ArrayList<Stuhomework>();
        stuhomeworkList=homeworkService.selectStuhomeworkbystuhomework(stuhomework);
        request.setAttribute("stuhomeworkList",stuhomeworkList);
        request.setAttribute("xq",0);
        return "stuchangetotalscore";
    }
}
