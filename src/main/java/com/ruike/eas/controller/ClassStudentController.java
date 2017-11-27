package com.ruike.eas.controller;

import com.ruike.eas.pojo.Class;
import com.ruike.eas.pojo.Stu;
import com.ruike.eas.service.ClassService;
import com.ruike.eas.service.StudentService;
import com.ruike.eas.util.DateUtil;
import com.ruike.eas.util.ExcelOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/11/27.
 */
@Controller
public class ClassStudentController {
    @Resource
    private ClassService classService;

    @Resource
    private StudentService studentService;

    @RequestMapping("/jump")
    public String jump(){
        return "addclassstu";
    }

    @RequestMapping("/addcstu")
    @ResponseBody
    public void addClassAndStu(HttpServletRequest req, HttpServletResponse res,PrintWriter printWriter){
        String class_startday = req.getParameter("class_startday");
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
        MultipartFile upload = multipartRequest.getFile("upload");
        Class c = new Class();
        c.setClass_startday(DateUtil.dateFormat(class_startday,"yyyy-MM-dd"));
        //将开班日期转换为班名
        c.setClass_name(DateUtil.dateFormat(c.getClass_startday(),"yyyyMMdd"));
        c.setGrade_id(1);
        c.setClass_state(0);
        c.setStatus(0);
        List<Stu> stus = null;

        Integer integer = classService.insertClass(c);

        if (integer != null){
            try {
                //把导入的excel转换成学生的对象集合(文件名称,文件的流)
                stus = ExcelOperation.readExcel(upload.getOriginalFilename(), upload.getInputStream(), integer);
            } catch (IOException e) {
                e.printStackTrace();
            }
            studentService.addAllStudnet(stus);

        }else{
            printWriter.print("null");
        }
        printWriter.flush();
        printWriter.close();
    }
}
