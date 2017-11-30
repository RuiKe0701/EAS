package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.ruike.eas.pojo.*;
import com.ruike.eas.service.AttendanceRecordService;
import com.ruike.eas.service.ClassattendanceService;
import com.ruike.eas.service.ScoringstandardService;
import com.ruike.eas.service.StutotalscoreService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class StuadtController {
    @Resource
    private StutotalscoreService stutotalscoreService;
    @Resource
    private ScoringstandardService scoringstandardService;
    @Resource
    private ClassattendanceService classattendanceService;
    @Resource
    private AttendanceRecordService attendanceRecordService;
    /*进入新增考勤记录页面
     */
    @RequestMapping("/addatd")
    public String add(HttpServletRequest request){
        Classteacher classteacher=new Classteacher();
        classteacher.setTeacher_id(1);
        List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
        int a =0;
        Integer attendancenumber=0;
        if(classteacherList.size()>0){
            a=classteacherList.get(0).getClass_id();
            Classattendance classattendance=new Classattendance();
            Classattendance classattendance1=new Classattendance();
            classattendance1.setClass_id(a);
            classattendance=classattendanceService.selectnewClassatd(classattendance1);
            attendancenumber=classattendance.getCad_number();
        }
        request.setAttribute("attendancenumber",attendancenumber);
        request.setAttribute("classteacherList",classteacherList);
        return "addatd";
    }
    @RequestMapping("/addatdgetno")
    public void Getnumber(PrintWriter printWriter,Integer classid){
        Classattendance classattendance=new Classattendance();
        Classattendance classattendance1=new Classattendance();
        Integer attendancenumber=0;
        if(classid!=null) {
            classattendance1.setClass_id(classid);
            classattendance = classattendanceService.selectnewClassatd(classattendance1);
            attendancenumber = classattendance.getCad_number();
            String jsonString = JSON.toJSONString(attendancenumber);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }else {
            String jsonString = JSON.toJSONString(-1);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }
    @RequestMapping("/addatdrecord")
    public void Addatdrecore(PrintWriter printWriter,Integer classid){
        //查询班级应该签到学生的信息
        List<Stutotalscore> stutotalscoreList=new ArrayList<Stutotalscore>();
        Stutotalscore stutotalscore=new Stutotalscore();
        stutotalscore.setClass_id(classid);
        stutotalscoreList=stutotalscoreService.selectStusts(stutotalscore);
        //查询班级最近点名信息根据信息生成班级点名名字

        String jsonString = JSON.toJSONString(stutotalscoreList);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
//        request.setAttribute("stutotalscoreList",stutotalscoreList);
//        //主要返回数据：班级点名次数根据班级次生成最新的点名次数
//        request.setAttribute("attendancenumber",attendancenumber);

    }


    @RequestMapping("/getscorings")
    public void GetScortings(PrintWriter printWriter){
        List<Scoringstandard> scoringstandardList=new ArrayList<Scoringstandard>();
        Scoringstandard scoringstandard=new Scoringstandard();
        scoringstandard.setSs_type(0);
        scoringstandardList=scoringstandardService.selectAll(scoringstandard);
        String jsonString = JSON.toJSONString(scoringstandardList);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
}
@RequestMapping("/doinsetadt")
public void Doaddatdrecore(String chuqinglv,Integer classids,Integer cadnumber,
                           String stuattendancelists,String studentScoreList,String kaoqindate,  PrintWriter printWriter){
    ArrayList<Stuattendance> stuattendancelist =  JSON.parseObject(stuattendancelists, new TypeReference<ArrayList<Stuattendance>>(){});
    ArrayList<Stutotalscore> StutotalscoreList =  JSON.parseObject(studentScoreList, new TypeReference<ArrayList<Stutotalscore>>(){});
    if(chuqinglv!=null&&classids!=null&& cadnumber!=null){
        Classattendance classattendance=new Classattendance();
        classattendance.setCad_number(cadnumber);
        classattendance.setClass_id(classids);
        classattendance.setCad_rate(chuqinglv);
        classattendance.setCad_dates(kaoqindate);
        classattendance.setCad_name("哈哈哈哈");
        if(stuattendancelist!=null&&StutotalscoreList!=null){
            Integer a=attendanceRecordService.addatdrecord(stuattendancelist,StutotalscoreList,classattendance);
            if(a>0){
                String jsonString = JSON.toJSONString(1);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }
        }
    }else {
        String jsonString = JSON.toJSONString(0);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
}

}

