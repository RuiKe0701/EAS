package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Property;
import pojo.Student;
import service.StudentService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class StudentController {
    @Resource
    private StudentService studentService;
    @RequestMapping("studentinfo")
    public String studentinfo(){
        return "teacher";
    }
    @RequestMapping("thstudentinfo")
    public String thstudentinfo(){
        return "thstudentinfo";
    }
    @RequestMapping("thaddstudent")
    public String thaddstudent(){
        return "thaddstudent";
    }

}
