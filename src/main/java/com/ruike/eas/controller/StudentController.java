package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.*;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.ClassteacherService;
import com.ruike.eas.util.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ruike.eas.service.StudentService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class StudentController {
    @Resource
    private StudentService studentService;
    @Resource
    private ClassteacherService classteacherService;

    @RequestMapping("/studentinfo")
    public String studentinfo(){
        return "teacher";
    }

    /**
     *
     * 学生信息初始页面
     * @param request
     * @return 返回老师所带领的班级 和默认显示的学生信息
     */
    @RequestMapping("/thstudentinfo")
    public String selectstudents(HttpServletRequest request){
        List<Stu> stus=new ArrayList<Stu>();
        //获取默认显示的的学生信息
        stus=studentService.defaultStudent();
        List<Classteacher> classteacherArrayList=new ArrayList<Classteacher>();
        Classteacher classteachers=new Classteacher();
        //放入老师id 暂时没有登陆所以用1#########################################################
        classteachers.setStatus(0);
        classteachers.setTeacher_id(1);
        //获取老师正在管理的班级
        classteacherArrayList=classteacherService.selectClassteacher(classteachers);
        request.setAttribute("ct",classteacherArrayList);
        request.setAttribute("stulist",stus);
        return "thstudentinfo";
    }
    //展示学生所有基本信息
    @RequestMapping("/showstudents")
    public String showstudent(HttpServletRequest request,Integer stuid){
        Stu stu=new Stu();
        stu.setStu_id(stuid);
        Stu stu1=new Stu();
        stu1 =studentService.selectStudentByStu(stu);
        if(stu1!=null){
            request.setAttribute("stu",stu1);
            System.out.println(stu1.getStu_name());
        }
        return "showstudent";
    }
    @RequestMapping("/thaddstudent")
    public String thaddstudent(){
        return "thaddstudent";
    }


    @RequestMapping("/thselecstudentbystu")
    @ResponseBody
    public void selectStudentByStu(PrintWriter printWriter,String classname,String stuname,Integer sturts){
        //根据班级名称查询
        if(classname!=null&&classname!=""){
            Classteacher classteacher=new Classteacher();
            classteacher.setTeacher_id(1);
            Class cla=new Class();
            cla.setClass_name(classname);
            classteacher.setClasses(cla);
            List<Classteacher> classteachers = classteacherService.selectClassteacher(classteacher);
            int wa=0;
            if(classteachers!=null&&classteachers.size()>=1){
                wa=classteachers.get(0).getClasses().getClass_id();
                System.out.println(wa);
                Stu stu=new Stu();
                Class s=new Class();
                s.setClass_id(wa);
                stu.setClasses(s);
                List<Stu> stus= studentService.selectStuByClass(stu);
                if(stus!=null) {
                    String jsonString = JSON.toJSONString(stus);
                    printWriter.write(jsonString);
                    printWriter.flush();
                    printWriter.close();
                }else{
                    String jsonString = JSON.toJSONString(0);
                    printWriter.write(jsonString);
                    printWriter.flush();
                    printWriter.close();
                }
            }else{
                String jsonString = JSON.toJSONString(0);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }
        }else if(stuname!=null&&stuname!=""){
            Stu stu1=new Stu();
            System.out.println("sss"+stuname);
            stu1.setStu_name(stuname);
            List<Stu> stuList=new ArrayList<Stu>();
            stuList=studentService.selectByStudent(stu1);
            if(stuList!=null) {
                String jsonString = JSON.toJSONString(stuList);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }else{
                    String jsonString = JSON.toJSONString(0);
                    printWriter.write(jsonString);
                    printWriter.flush();
                    printWriter.close();
            }
        }
    }

    @RequestMapping("/ddd")
    public String dianming(){
        return  "aa";
    }

    @RequestMapping("/addstuinfo")
    @ResponseBody
    public void addStudentInfo(PrintWriter printWriter,Stu stu,String stu_birthdays,String stu_startdays){
        //因前台date问题所以单独接收日期转换并放入对应属性
        stu.setStu_birthday(DateUtil.dateFormat(stu_birthdays,"yyyy-MM-dd"));
        stu.setStu_startday(DateUtil.dateFormat(stu_startdays,"yyyy-MM-dd"));
        stu.setStatus(0);
        stu.setStu_state(0);
        stu.setCrateday(new Date());
        //执行单独添加一名学生到档案并分配到对应班级
        Integer count = studentService.addStuAndClass(stu);
        printWriter.print(count);
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/showclassstuinfo")
    @ResponseBody
    public void showClassStuInfo(String classid ,PrintWriter printWriter){
        if(classid!=null && !classid.equals("")){
            Classteacher classteacher=new Classteacher();
            //#############################登陆的老师id
            classteacher.setTeacher_id(1);
            classteacher.setStatus(0);
            classteacher.setClass_id(Integer.parseInt(classid));
            Class cla=new Class();
            cla.setClass_state(0);
            classteacher.setClasses(cla);
            List<Classteacher> classteachers = classteacherService.selectClassteacher(classteacher);
            if(classteachers!=null && classteachers.size()>=1) {
                Integer wa = classteachers.get(0).getClasses().getClass_id();
                System.out.println(wa);
                Stu stu = new Stu();
                Class s = new Class();
                s.setClass_id(wa);
                stu.setClasses(s);
                List<Stu> stus = studentService.selectStuByClass(stu);
                if (stus != null) {
                    String jsonString = JSON.toJSONString(stus);
                    printWriter.write(jsonString);
                } else {
                    String jsonString = JSON.toJSONString(0);
                    printWriter.write(jsonString);
                }
                printWriter.flush();
                printWriter.close();
            }
        }
    }

    /**
     * 跳转教导主任查看学生信息页面
     * @param request
     * @return
     */
    @RequestMapping("/anotherstudentinfo.do")
    public String anotherStudentInfo(HttpServletRequest request){
        Stu stu = new Stu();
        //查询第一页的所有学生信息
        stu.setList(studentService.selectPagerStudentInfo(stu));
        request.setAttribute("pager",stu);
        return "anotherstudentinfo";
    }

    /**
     * ajax查询学生信息（教导主任查看）
     * @param stu 学生对象
     * @param printWriter
     */
    @RequestMapping("/anotherajaxstudentinfo.do")
    @ResponseBody
    public void  anotherAjaxStudentInfo(Stu stu ,PrintWriter printWriter){
        List<Stu> stus = studentService.selectPagerStudentInfo(stu);
        stu.setList(stus);
        String s = JSON.toJSONString(stu);
        printWriter.print(s);
        printWriter.flush();
        printWriter.close();
    }
}
