package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.pojo.Classteacher;
import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.service.ClassService;
import com.ruike.eas.service.ClassteacherService;
import com.ruike.eas.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.*;

/**
 * Created by Administrator on 2017/11/20.
 */
@Controller
public class ClassTeacherOperating {
    @Resource
    private ClassteacherService classteacherService;

    @Resource
    private ClassService classService;

    @Resource
    private TeacherService teacherService;

    @RequestMapping("/showclasst")
    public String showClassThacher(HttpServletRequest request){

        Classteacher classteacher = new Classteacher();
        //放入老师的id
        Integer thid=(Integer) request.getSession().getAttribute("th");
        classteacher.setTeacher_id(thid);
        Class c = new Class();
        //班级状态(1为结业,0为未结业)
        c.setStatus(0);
        //查询此老师在校的班级
        List<Classteacher> cs = classteacherService.selectClassteacher(classteacher);
        if (cs != null && cs.size() > 0){
            List<Classteacher> classteachers = new ArrayList<Classteacher>();
            for (Classteacher cl : cs) {
                //信息状态 (0当前档案，其他为备份状态)
                if (cl.getStatus()==0) {
                    classteachers.add(cl);
                }
            }
            Classteacher classte =  new Classteacher();
            //放入第一个班级的id
            classte.setClass_id(classteachers.get(0).getClass_id());
            //默认查找第一个班级的信息
            List<Classteacher> ccc = classteacherService.selectClassteacher(classte);
            //对状态进行排序 当前的档案在上面
            Collections.sort(ccc, new Comparator<Classteacher>() {
                public int compare(Classteacher o1, Classteacher o2) {
                    return o1.getStatus().compareTo(o2.getStatus());
                }
            });
            request.setAttribute("classcs",classteachers);
            request.setAttribute("clate",ccc);
        }
        return "classmanagement";
    }

    @RequestMapping("/jsonclass")
    @ResponseBody
    public void jsonFindClassTeache(PrintWriter printWriter,String classname,Integer status,HttpServletRequest request){
        //从此老师所有记录中查找
        if (status != null ){
            Classteacher classteacher = new Classteacher();
            //放入老师的id
            Integer thid=(Integer) request.getSession().getAttribute("th");
            classteacher.setTeacher_id(thid);
            Class c = new Class();
            //班级名称
            c.setClass_name(classname);
            classteacher.setClasses(c);
            //查询此老师在校的班级
            List<Classteacher> cs = classteacherService.selectClassteacher(classteacher);
            if (cs == null || cs.size() == 0){
                printWriter.print(0);
            }else{
                Classteacher classte =  new Classteacher();
                //放入第一个班级的id
                classte.setClass_id(cs.get(0).getClass_id());
                //默认查找第一个班级的信息
                List<Classteacher> ccc = classteacherService.selectClassteacher(classte);
                //对状态进行排序 当前的档案在上面
                if (ccc != null && ccc.size() > 0) {
                    Collections.sort(ccc, new Comparator<Classteacher>() {
                        public int compare(Classteacher o1, Classteacher o2) {
                            return o1.getStatus().compareTo(o2.getStatus());
                        }
                    });
                    printWriter.print(JSON.toJSONString(ccc));
                } else {
                    printWriter.print(0);
                }
            }
        }else {
            Classteacher classteacher = new Classteacher();
            Class c = new Class();
            c.setClass_name(classname);
            classteacher.setClasses(c);
            List<Classteacher> cs = classteacherService.selectClassteacher(classteacher);
            if (cs != null && cs.size() > 0) {
                //集合排序 让当前在档的对象排上面
                Collections.sort(cs, new Comparator<Classteacher>() {
                    public int compare(Classteacher o1, Classteacher o2) {
                        return o1.getStatus().compareTo(o2.getStatus());
                    }
                });
                printWriter.print(JSON.toJSONString(cs));
            } else {
                printWriter.print(0);
            }
        }
        printWriter.flush();
        printWriter.close();
    }

    /**
     * 结束代课
     * @param ctid 需要修改的记录id
     */
    @RequestMapping("/endsub")
    @ResponseBody
    public void ajaxEndSubstitution(PrintWriter printWriter,Integer ctid){
        Classteacher classte = new Classteacher();
        classte.setCt_id(ctid);
        //0为当前其他为历史
        classte.setStatus(1);
        classte.setCt_stopday(new Date());
        Integer count = classteacherService.update(classte);
        printWriter.print(count);
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/addclassteacherinfo")
    @ResponseBody
    public void addClassTeacherInfo(Classteacher classteacher,PrintWriter printWriter){
        //0为当前档案
        classteacher.setStatus(0);
        Integer integer = classteacherService.inserClassteacher(classteacher);
        printWriter.print(integer);
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/tiaoaddclass")
    public String tiaoAddClass(HttpServletRequest request){
        Teacher teacher = new Teacher();
        //放入要查找的老师的类型
        teacher.setTh_type(0);
        //调用带条件查找老师
        List<Teacher> teachers = teacherService.selectTeacher(teacher);
        request.setAttribute("teachers",teachers);
        return "addclass";
    }

    @RequestMapping("/addclassandteacher")
    @ResponseBody
    public void addClassAndTeacher(Class c , Integer th_id ,PrintWriter printWriter){
//        System.out.println(th_id);
        c.setStatus(0);
        c.setClass_state(0);
        Classteacher classteacher = new Classteacher();
        classteacher.setTeacher_id(th_id);
        classteacher.setStatus(0);
        classteacher.setRemarks("班主任");
        classteacher.setCt_startday(c.getClass_startday());
        //在此班的任教类型(0为班主任1为主教2辅教)
        classteacher.setCt_type(0);
        Integer integer = classService.addClassAndTeacher(c, classteacher);
        printWriter.print(integer);
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/verificationclass_name")
    @ResponseBody
    public void showClassByName(Class c ,PrintWriter printWriter){
        //根据班级名查询有无重名班级
        List<Class> classes = classService.selectClass(c);
        printWriter.print(classes!=null&&classes.size()>0?1:0);
    }

}
