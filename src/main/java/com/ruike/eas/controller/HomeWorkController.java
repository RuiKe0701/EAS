package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.ruike.eas.pojo.*;
import com.ruike.eas.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class HomeWorkController {
    @Resource
    private AttendanceRecordService attendanceRecordService;
    @Resource
    private HomeworkService homeworkService;
    @Resource
    private StutotalscoreService stutotalscoreService;
    @Resource
    private RegulationsService regulationsService;

    @RequestMapping("/stuhomework.do")
    public String HomeWork(HttpServletRequest request){
        Integer a=(Integer) request.getSession().getAttribute("thtype");
        Classteacher classteacher = new Classteacher();
        Integer thid=(Integer) request.getSession().getAttribute("th");
        classteacher.setTeacher_id(thid);
        List<Classteacher> classteacherList = attendanceRecordService.classteacherlist(classteacher);
        List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
        request.setAttribute("oldclassteacherList",classteacherList1);
        Integer classid = 0;
        if (classteacherList.size() > 0) {
            request.setAttribute("classteacherList", classteacherList);
            classid = classteacherList.get(0).getClass_id();
        }
        return "stuhomework";
    }
    //班级作业情况
    @RequestMapping("/classhomework.do")
    public String ClassHomeWork(HttpServletRequest request){
        Integer a=(Integer) request.getSession().getAttribute("thtype");
        Classteacher classteacher = new Classteacher();
        Integer thid=(Integer) request.getSession().getAttribute("th");
        classteacher.setTeacher_id(thid);
        List<Classteacher> classteacherList = attendanceRecordService.classteacherlist(classteacher);
        List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
        request.setAttribute("oldclassteacherList",classteacherList1);
        Integer classid = 0;
        if (classteacherList.size() > 0) {
            request.setAttribute("classteacherList", classteacherList);
            for (Classteacher classteacher1 : classteacherList) {
                System.out.println(classteacher1.getClassname());
            }
            classid = classteacherList.get(0).getClass_id();
        }
        return "classhomework";
    }
    //查询出记录次数
    @RequestMapping("/selecrworknumber.do")
    public void SelectWorkNumber(Integer classid, PrintWriter printWriter){

        Classattendance classattendance1=new Classattendance();
        Classhomework classhomework=new Classhomework();
        Classhomework classhomework1=new Classhomework();
        Integer attendancenumber=0;
        if(classid!=null) {
            classhomework1.setChw_classid(classid);
            classhomework = homeworkService.selectnewClasswork(classhomework1);
            attendancenumber = classhomework.getChw_number();
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
    /*
  获取评分信息
   */
    /*
    获取学生成绩信息
     */
        @RequestMapping("/getregulatonbytypework.do")
        public void getregulatonbytypework(PrintWriter printWriter){
            List<Regulations> regulationsList=new ArrayList<Regulations>();
            Regulations regulations=new Regulations();
            regulations.setRast_id(1);
            regulationsList=regulationsService.SelectRegulationByRl(regulations);
            String jsonString = JSON.toJSONString(regulationsList);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
    }
    @RequestMapping("/selectstuworkstu.do")
    public void selectstuwork(PrintWriter printWriter,Integer classid){
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
    }
    //学生作业完成情况
    @RequestMapping("/addstuhomeworks.do")
    public  void AddStuhomeWork(String suthomeworks,Integer classids,Integer cadnumber,String kaoqindate,String homename,PrintWriter printWriter){
        Date date=new Date();
        try
        {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            date = sdf.parse(kaoqindate);
        }
        catch (ParseException e)
        {
            System.out.println(e.getMessage());
        }
        ArrayList<Stuhomework> stuhomeworkArrayList =  JSON.parseObject(suthomeworks, new TypeReference<ArrayList<Stuhomework>>(){});
        Classhomework classhomework=new Classhomework();
        classhomework.setChw_number(cadnumber);
        classhomework.setChw_classid(classids);
        classhomework.setChw_name(homename);
        classhomework.setChw_caddate(date);
        Integer a=homeworkService.addHomeworks(classhomework,stuhomeworkArrayList,date);
        if(a!=-1){
            String jsonString = JSON.toJSONString(a);
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
}
