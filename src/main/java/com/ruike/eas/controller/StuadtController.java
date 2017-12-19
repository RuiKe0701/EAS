package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.ruike.eas.pojo.*;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.ArrayList;
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
    @Resource
    private LeaveService leaveService;
    @Resource
    private ClassteacherService classteacherService;

    /*进入新增考勤记录页面
     */
    @RequestMapping("/addatd")
    public String add(HttpServletRequest request){
        Classteacher classteacher=new Classteacher();
        classteacher.setTeacher_id(1);
        List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
        int a =0;
        Integer attendancenumber=0;
        List<Stuleave> stuleaveList=new ArrayList<Stuleave>();
        if(classteacherList!=null&&classteacherList.size()>0){
            a=classteacherList.get(0).getClass_id();
            Stuleave stuleave=new Stuleave();
            stuleave.setClass_id(a);
            stuleaveList=leaveService.selectByleave(stuleave);

            Classattendance classattendance=new Classattendance();
            Classattendance classattendance1=new Classattendance();
            classattendance1.setClass_id(a);
            classattendance=classattendanceService.selectnewClassatd(classattendance1);
            attendancenumber=classattendance.getCad_number();

        }else{
            classteacherList=new ArrayList<Classteacher>();
            Classteacher classteacher1=new Classteacher();
            classteacher1.setClass_id(-1);
            classteacher1.setClassname("暂无班级");
            classteacherList.add(classteacher1);
        }
        request.setAttribute("attendancenumber",attendancenumber);
        request.setAttribute("classteacherList",classteacherList);
        request.setAttribute("stuleaveList",stuleaveList);
        return "addatd";
    }
    /*
    学生请假信息更改
     */
    @RequestMapping("/updateleave")
    public void updateleave(PrintWriter printWriter,Integer stuleaveid,String leaveremark){
        if(stuleaveid!=null&&leaveremark!=null){
            Stuleave stuleave=new Stuleave();
            stuleave.setStuleave_id(stuleaveid);
            stuleave.setStuleave_remarks(leaveremark);
            stuleave.setStuleave_state(0);
            Integer aa=leaveService.updateleave(stuleave);
            if(aa>0){
                String jsonString = JSON.toJSONString(1);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }else {
                String jsonString = JSON.toJSONString(0);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }
    /*
    根据班级id查到需要请假的学生
     */
    @RequestMapping("/selectstubyclassid")
    public void selecstu(Integer classid,PrintWriter printWriter){
        List<Stu> stus=new ArrayList<Stu>();
        Stu stu=new Stu();
        stu.setClass_id(classid);
        stus=leaveService.selectstubyclassid(stu);
        String jsonString = JSON.toJSONString(stus);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();

    }
    /*
    根据学生请假条件查询请假学生
    */
    @RequestMapping("/selectstuleavebystu")
    public void selectstuleavebystu(String stuleaves,PrintWriter printWriter){
        Stuleave stuleave= JSON.parseObject(stuleaves,Stuleave.class);
        System.out.println(stuleave.getClass_id()+""+stuleave.getClassname());
        List<Stuleave> stuleaveList=new ArrayList<Stuleave>();
        if(stuleave.getClassname()!=null&&stuleave.getClassname()!=""){
            System.out.println(stuleave.getClassname());
            Classteacher classteacher=new Classteacher();
            classteacher.setTeacher_id(1);
            Class cla=new Class();
            cla.setClass_name(stuleave.getClassname());
            classteacher.setClasses(cla);
            List<Classteacher> classteachers = classteacherService.selectClassteacher(classteacher);
            int wa=0;
            if(classteachers.size()>0){
                Stuleave stuleave1=new Stuleave();
                wa=classteachers.get(0).getClasses().getClass_id();
                stuleave1.setClass_id(wa);
                stuleaveList = leaveService.selectByleave(stuleave1);
                String jsonString = JSON.toJSONString(stuleaveList);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }else {
                String jsonString = JSON.toJSONString(1);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }
        }else if(stuleave.getClass_id()!=null){
            stuleaveList = leaveService.selectByleave(stuleave);
            String jsonString = JSON.toJSONString(stuleaveList);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
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


    @RequestMapping("/getclassleave")
    public void getclassleave(Integer classid,String kaoqingdate,PrintWriter printWriter){
        if(classid!=null&&classid>0&&kaoqingdate!=null){     Stuleave stuleave=new Stuleave();
            stuleave.setClass_id(classid);
            stuleave.setStuleave_days(kaoqingdate);
            List<Stuleave> stuleaveList=leaveService.selectByleave(stuleave);
            if(stuleaveList!=null&&stuleaveList.size()>0){
                String jsonString = JSON.toJSONString(stuleaveList);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }else{
                System.out.println("再无请假");
                String jsonString = JSON.toJSONString(2);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }
    /*
    根据请假id 查询请假学生信息
     */
    @RequestMapping("/selectstubystuleaveid")
    public void Selectstuleave(Integer stuleaveid,PrintWriter printWriter){
        if(stuleaveid!=null){
            Stuleave stuleave=new Stuleave();
            stuleave.setStuleave_id(stuleaveid);
            List<Stuleave> stuleaveList=leaveService.selectByleave(stuleave);
            if(stuleaveList!=null&&stuleaveList.size()>0){
                Stuleave stuleave1=stuleaveList.get(0);
                String jsonString = JSON.toJSONString(stuleave1);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }else {
                String jsonString = JSON.toJSONString(1);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }
    /*
    进行学生的请假添加
     */
    @RequestMapping("/insertstuleave")
    public void Insertstuleave(PrintWriter printWriter ,String stuleaves) {
        Stuleave stuleave= JSON.parseObject(stuleaves,Stuleave.class);
        List<Stuleave> stuleaveList=new ArrayList<Stuleave>();
        stuleaveList.add(stuleave);
        Integer a=leaveService.insertleave(stuleaveList);
        if (a>0){
            String jsonString = JSON.toJSONString(1);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();

        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();

        }
    }
    /*
    获取学生成绩信息
     */
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
/*
进行学院全部新增
 */
@RequestMapping("/doinsetadt")
public void Doaddatdrecore(String chuqinglv,Integer classids,Integer cadnumber,String leaveLists,String classatdname,
                           String stuattendancelists,String studentScoreList,String kaoqindate,  PrintWriter printWriter){
    ArrayList<Stuattendance> stuattendancelist =  JSON.parseObject(stuattendancelists, new TypeReference<ArrayList<Stuattendance>>(){});
    ArrayList<Stutotalscore> StutotalscoreList =  JSON.parseObject(studentScoreList, new TypeReference<ArrayList<Stutotalscore>>(){});
    ArrayList<Stuleave> stuleaveArrayList =  JSON.parseObject(leaveLists, new TypeReference<ArrayList<Stuleave>>(){});
    if(chuqinglv!=null&&classids!=null&& cadnumber!=null){
        Classattendance classattendance=new Classattendance();
        classattendance.setCad_number(cadnumber);
        classattendance.setClass_id(classids);
        classattendance.setCad_rate(chuqinglv);
        classattendance.setCad_dates(kaoqindate);
        classattendance.setCad_name(classatdname);
        if(stuattendancelist!=null&&StutotalscoreList!=null){
            Integer a=attendanceRecordService.addatdrecord(stuattendancelist,StutotalscoreList,classattendance,stuleaveArrayList);
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

