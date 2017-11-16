package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.pojo.Classteacher;
import com.ruike.eas.service.ClassteacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ruike.eas.pojo.Stu;
import com.ruike.eas.service.StudentService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        classteachers.setTeacher_id(1);
        //获取老师正在管理的班级
         classteacherArrayList=classteacherService.selectClassteacher(classteachers);
        request.setAttribute("ct",classteacherArrayList);
        request.setAttribute("stulist",stus);
        return "thstudentinfo";
    }
    //展示学生所有基本信息
    @RequestMapping("/showstudent")
    public String showstudent(HttpServletRequest request,Integer stuid,String l){
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
    public void selectStudentByStu(PrintWriter printWriter,Integer classid,String stuname,Integer sturts){
        //根据班级名称查询
        if(classid!=null){
            String stu="class没毛病"+classid+""+sturts;
            String jsonString = JSON.toJSONString(stu);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }else if(stuname!=null&&stuname!=""){
            String stu=stuname+"没毛病"+""+sturts;
            String jsonString = JSON.toJSONString(stu);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }

    }

}
