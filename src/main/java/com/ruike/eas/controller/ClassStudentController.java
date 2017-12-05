package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.ruike.eas.pojo.*;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.ClassService;
import com.ruike.eas.service.ClassteacherService;
import com.ruike.eas.service.StudentService;
import com.ruike.eas.service.TeacherService;
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

import java.lang.reflect.Array;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.ArrayList;


/**
 * Created by Administrator on 2017/11/27.
 */
@Controller
public class ClassStudentController {
    @Resource
    private ClassService classService;

    @Resource
    private StudentService studentService;

    @Resource
    private ClassteacherService classteacherService;

    @Resource
    private TeacherService teacherService;

    @RequestMapping("/jump")
    public String jump(HttpServletRequest request){
        Classteacher classteacher = new Classteacher();
        //放入老师的id
        classteacher.setTeacher_id(1);
        //查询此老师在校的班级
        classteacher.setStatus(0);
        List<Classteacher> cs = classteacherService.selectClassteacher(classteacher);
        List<Class> classList = new ArrayList<Class>();
        for (Classteacher c : cs) {
            if (c.getClasses().getGrade_id() == 1 || c.getClasses().getGrade_id()==4 ) {
                classList.add(c.getClasses());
            }
        }
//        List<Classteacher> collect = cs.stream()
//                .filter(s -> s.getClasses().getGrade_id() == 1 || s.getClasses().getGrade_id() == 4)
//                .collect(Collectors.<Classteacher>toList());
        request.setAttribute("classes",classList);
        return "addclassstu";

    }

    @RequestMapping("/addcstu")
    @ResponseBody
    public void addClassAndStu(HttpServletRequest req, HttpServletResponse res,PrintWriter printWriter){
        //取出选择的班级id
        String class_id = req.getParameter("class_id");
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
        //取出选择的文件流
        MultipartFile upload = multipartRequest.getFile("upload");
        if (upload != null){
            //声明学生集合
            List<Stu> stus = null;
            try {
                //把导入的excel转换成学生的对象集合(文件名称,文件的流)
                stus = ExcelOperation.readExcel(upload.getOriginalFilename(), upload.getInputStream() ,Integer.parseInt(class_id));
            } catch (IOException e) {
                e.printStackTrace();
            }
            if (stus != null && stus.size() > 0){
                    Integer count = studentService.addAllStudnet(stus);
                    printWriter.print(count > 0 ?  1 : 0);
            }else {
                printWriter.print(-1);
            }
        }
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/stuupgraded")
    @ResponseBody
    public void stuUpgraded(String cls ,String classteacher,String cla,PrintWriter printWriter){
        //将JSON字符串转换成对应的对象
        ArrayList<Classstu> stus =  JSON.parseObject(cls, new TypeReference<ArrayList<Classstu>>(){});
        Classteacher classte = JSON.parseObject(classteacher,Classteacher.class);
        Class clas = JSON.parseObject(cla,Class.class);
        //调用升班方法
        Integer integer = classService.stuUpgraded(stus, clas, classte);
        printWriter.print(integer);
        printWriter.flush();
        printWriter.close();
    }

    /**
     * 跳转学生升班
     */
    @RequestMapping("/jumpupgraded")
    public String jumpUpgraded(HttpServletRequest request){
        Classteacher classteacher = new Classteacher();
        //放入老师的id
        classteacher.setTeacher_id(1);
        //查询此老师在校的班级
        classteacher.setStatus(0);
        List<Classteacher> cs = classteacherService.selectClassteacher(classteacher);
        Collections.sort(cs, new Comparator<Classteacher>() {
            public int compare(Classteacher o1, Classteacher o2) {
                return o1.getCt_startday().compareTo(o2.getCt_startday());
            }
        });

        Stu stu = new Stu();
        Class c = new Class();
        //默认查询第一个班级的学生
        c.setClass_id(cs.get(0).getClass_id());
        stu.setClasses(c);
        //根据班级id查询对应的学生
        List<Stu> stuList = studentService.selectByStudent(stu);

        Teacher teacher = new Teacher();
        //放入要查找的老师的类型(0为班主任)
        teacher.setTh_type(0);
        //调用带条件查找老师
        List<Teacher> teachers = teacherService.selectTeacher(teacher);
        request.setAttribute("classteachers",cs);
        request.setAttribute("teachers",teachers);
        request.setAttribute("stuList",stuList);
        return "upgraded";
    }
}
