package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Administrator on 2017/11/26.
 */
@Controller
public class TeacherController {

    @Resource
    private TeacherService teacherService;

    @RequestMapping("/addclassteacher")
    public String addClassTeacher(String classname, Integer classid,HttpServletRequest request){
            request.setAttribute("classname",classname);
            request.setAttribute("classid",classid);
            return "addclassteacher";
    }

    @RequestMapping("/ajaxteacherinfo")
    @ResponseBody
    public void seleTeacher(Integer th_type,PrintWriter printWriter){
        Teacher teacher = new Teacher();
        //放入要查找的老师的类型
        teacher.setTh_type(th_type);
        //调用带条件查找老师
        List<Teacher> teachers = teacherService.selectTeacher(teacher);
        printWriter.print(JSON.toJSON(teachers));
        printWriter.flush();
        printWriter.close();
    }

}
