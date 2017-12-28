package com.ruike.eas.controller;

import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.pojo.Thlogin;
import com.ruike.eas.service.ThloginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Resource
    private ThloginService thloginService;
    /*
    登陆页面
     */
    @RequestMapping("/login")
    public String Login(){
        return "login";
    }
    /*
    登陆操作
     */
    @RequestMapping("/dologin")
    public String DoLogin(String number, String password, HttpServletRequest request){
        if(number!=null&&password!=null){
            Thlogin thlogin=new Thlogin();
            thlogin.setThl_number(number);
            thlogin.setThl_password(password);
            Thlogin thlogin1=thloginService.dologin(thlogin);
            if(thlogin1!=null&&thlogin1.getTh_id()!=null){
                request.getSession().setAttribute("th",thlogin1.getTh_id());
                request.getSession().setAttribute("thtype",thlogin1.getTy_id());
                Teacher teacher=new Teacher();
                teacher.setTh_id(thlogin1.getTh_id());
                Teacher teacher1=thloginService.TeacherInfo(teacher);
                request.setAttribute("teachers",teacher1);
                System.out.println(teacher1.getTh_name());
                request.setAttribute("type",thlogin1.getTy_id());
                return "teacher";
            }
        }
        return "studentinfo";
    }
}
