package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.StudentService;

import javax.annotation.Resource;

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
