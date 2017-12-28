package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.ruike.eas.pojo.*;
import com.ruike.eas.pojo.Class;
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
    @Resource
    private StuattendanceService stuattendanceService;
    /*
    学生的个人详细历史记录
     */
    @RequestMapping("/stuhomework.do")
    public String HomeWork(HttpServletRequest request){
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
        return "stuhomework";
    }
    /*
        查询学生个人信息
 */
    @RequestMapping("/stuhomeworkinfobystuid.do")
    public String HomeWorks(Integer classid,Integer stuid,String l,Integer zhuang,HttpServletRequest request){
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
        request.setAttribute("zhuang",zhuang);
        request.setAttribute("classid", classid);
        if(stuid==null||stuid<=0){
            stuid=0;
            if(classstus.size()>0){
                stuid=classstus.get(0).getStu_id();
            }
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
        return "stuhomework";
    }
    /*
    根据学员id获取学员记录
     */
    @RequestMapping("/selectstuworkbystuid.do")
    public void SelectStuadtByStuid(PrintWriter printWriter,Integer stuid,Integer classid){
        Stuattendance stuattendance=new Stuattendance();
        Stuhomework stuhomework=new Stuhomework();
        stuhomework.setClass_id(classid);
        stuhomework.setStu_id(stuid);

        List<Stuhomework> stuhomeworkList=new ArrayList<Stuhomework>();
        stuhomeworkList=homeworkService.selectStuhomeworkbystuhomework(stuhomework);


        String jsonString = JSON.toJSONString(stuhomeworkList);
        System.out.println(jsonString);
        printWriter.print(jsonString);
        printWriter.flush();
        printWriter.close();
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
            classid = classteacherList.get(0).getClass_id();
        }
        request.setAttribute("classid",classid);
        Classhomework classhomework=new Classhomework();
        classhomework.setChw_classid(classid);
        classhomework.setTiao(50);
        List<Classhomework> classhomeworkList=homeworkService.selectClassworkByclasswork(classhomework);
        request.setAttribute("classhomeworkList",classhomeworkList);
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
            regulations.setTiao(16);
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
    @RequestMapping("/doseleclasshomeworkinfo.do")
    public void DoselectClassHomeWordinfo(Integer chwid,PrintWriter printWriter){
        Stuhomework stuhomework=new Stuhomework();
        stuhomework.setChw_id(chwid);
        List<Stuhomework> stuhomeworkList=homeworkService.selectStuhomeworkbystuhomework(stuhomework);
        String jsonString = JSON.toJSONString(stuhomeworkList);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();

    }
    /*
   根据班级查询作业记录详情
     */
    @RequestMapping("/selectclasshomeworkbyclassidand.do")
    public void SelectClassHome(Integer classsid,String startdate ,String stopdate,PrintWriter printWriter){
        System.out.println("//////////////////////////"+classsid);
        Classhomework classhomework =new Classhomework();
        classhomework.setChw_classid(classsid);
        System.out.println(startdate);
        classhomework.setStopdate(stopdate);
        classhomework.setStartdate(startdate);
        System.out.println(stopdate);
        List<Classhomework> classhomeworkList=homeworkService.selectClassworkByclasswork(classhomework);
        String jsonString = JSON.toJSONString(classhomeworkList);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
    /*
    查看学员个人作业详情
     */
    @RequestMapping("/selectstuhomeworkbystuid")
    public String Stuattsbystu(Integer classid,Integer stuid,String l,Integer zhuang,HttpServletRequest request){
        Classteacher classteacher=new Classteacher();
        Integer thid=(Integer) request.getSession().getAttribute("th");
        classteacher.setTeacher_id(thid);
        List<Classteacher> classteacherList=attendanceRecordService.classteacherlist(classteacher);
        List<Classteacher> classteacherList1=attendanceRecordService.selectoldclassbytecaherid(classteacher);
        Stuhomework stuhomework=new Stuhomework();
        stuhomework.setClass_id(classid);
        List<Stuhomework> stuhomeworkList=homeworkService.selectStuhomeworkbystuhomework(stuhomework);
        request.setAttribute("oldclassteacherList",classteacherList1);
        request.setAttribute("stuhomeworkList",stuhomeworkList);
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
}
