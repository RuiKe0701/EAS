package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.pojo.Stu;
import com.ruike.eas.pojo.Stutotalscore;
import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.service.StutotalscoreService;
import com.sun.org.apache.xerces.internal.xs.datatypes.ObjectList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class StutotalscoreController {
    @Resource
    private StutotalscoreService stutotalscoreService;

    @RequestMapping("/usersssss")
    public String  sssss(){
        return "aa";
    }

    @RequestMapping("/userssss")
    public void aa(PrintWriter printWriter){
        List<Object> ss = new ArrayList<Object>();
        Stutotalscore stu=new Stutotalscore();
        stu.setClass_id(1);
        Class Teacher=new Class();
        Teacher.setClass_name("www");
        ss.add(Teacher);
        ss.add(stu);
        ss.get(1);

        String jsonString = JSON.toJSONString(ss);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
    /*
    学生总分页面
     */

}
