package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.Stu;
import service.StudentService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class StudentController {
    @Resource
    private StudentService studentService;
    @RequestMapping("/studentinfo")
    public String studentinfo(){
        return "teacher";
    }

    //加载学生基本信息列表/
    @RequestMapping("/thstudentinfo")
    public String selectstudents(HttpServletRequest request){
        List<Stu> stus=new ArrayList<Stu>();
        stus=studentService.defaultstudent();
        for (Stu stu : stus) {
            System.out.println(stu.getStu_no());
        }
        request.setAttribute("stulist",stus);
        return "thstudentinfo";
    }
    //展示学生所有基本信息
    @RequestMapping("/showstudent")
    public String showstudent(HttpServletRequest request,Integer stuid,String l){
        System.out.println(l);
        System.out.println(stuid);
        Stu stu=new Stu();
        stu.setStu_id(stuid);
        Stu stu1=new Stu();
        stu1 =studentService.selectstudentbystu(stu);
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


}
