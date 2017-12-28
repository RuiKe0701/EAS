package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.pojo.ThType;
import com.ruike.eas.pojo.Thlogin;
import com.ruike.eas.service.TeacherService;
import com.ruike.eas.service.ThTypeService;
import com.ruike.eas.service.ThloginService;
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

    @Resource
    private ThTypeService thTypeService;

    @Resource
    private ThloginService thloginService;
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

    @RequestMapping("/tzteacherinfos.do")
    public String tzTheacherInfo(HttpServletRequest request){
        Teacher teacher = new Teacher();
        //教师状态0为未离职
        teacher.setTh_status(0);
        Thlogin thlogin = new Thlogin();
        thlogin.setTeacher(teacher);
        //查询未离职的所有老师
        List<Thlogin> thlogins = thloginService.selectThloginAndTeacherInfo(thlogin);
        request.setAttribute("teachers",thlogins);
        List<ThType> thTypes = thTypeService.selectThTypeInfo();
        request.setAttribute("thTypes",thTypes);

        List<Teacher> teachers = teacherService.selectTeacher(teacher);
        request.setAttribute("teacherInfos",teachers);
        return "teacherInfo";
    }

    /**
     * ajax根据状态查询已离职或未离职的老师信息
     * @param thlogin 账号对象(内有教师对象(含th_status))
     * @param printWriter
     */
    @RequestMapping("/ajaxTeacherByStatus.do")
    @ResponseBody
    public void ajaxTeacherByStatus(Thlogin thlogin,PrintWriter printWriter){
        //查询未离职的所有老师
        List<Thlogin> thlogins = thloginService.selectThloginAndTeacherInfo(thlogin);
        printWriter.print(thlogins!=null&&thlogins.size()>0?JSON.toJSONString(thlogins):0);
        printWriter.flush();
        printWriter.close();
    }

    /**
     * 教师离职(待定 未完成)
     * @param teacher 教师对象
     */
    @RequestMapping("/ajaxDeleteTeacher.do")
    @ResponseBody
    public void ajaxDeleteTeacher(Teacher teacher,PrintWriter printWriter){
        Integer integer = teacherService.updateTeacher(teacher);
    }


    /**
     * ajax添加老师及账号信息
     * @param teacher
     * @param printWriter
     */
    @RequestMapping("/ajaxAddTeacherInfo.do")
    public void ajaxAddTeacherInfo( Teacher teacher,PrintWriter printWriter){
        //调用添加老师和老师账号方法
        Thlogin thlogin = teacherService.addTeacherAndLogin(teacher);
        System.out.println(JSON.toJSONString(thlogin));
        String aas=JSON.toJSONString(thlogin);

        printWriter.print(JSON.parseObject(aas));
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/ajaxOldTeacher.do")
    public void ajaxOldTeacher(Thlogin thlogin,PrintWriter printWriter){
        Integer status = teacherService.verificationLogin(2, thlogin);
        if (status != 1) {
            //调用为老师添加新的账号并返回账号对象
            Thlogin thlogin1 = teacherService.addThLogin(thlogin);
            printWriter.print(thlogin1!=null?JSON.toJSONString(thlogin1):0);
        }else{
            printWriter.print(-1);
        }
        printWriter.flush();
        printWriter.close();
    }

    /**
     * 
     * @param teacher
     * @param pwriter
     */
    @RequestMapping("/verificationTeacherName.do")
    @ResponseBody
    public void  verificationTeacherName(Teacher teacher ,PrintWriter pwriter){
        //验证教师名称是否重复 返回值1为重复 0为未重复
        Integer status = teacherService.verificationLogin(1, teacher);
        pwriter.print(status);
        pwriter.flush();
        pwriter.close();
    }
}
