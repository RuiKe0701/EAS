package com.ruike.eas.controller;

import com.alibaba.fastjson.JSON;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.pojo.Classteacher;
import com.ruike.eas.pojo.Teacher;
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

    @RequestMapping("/showclasst")
    public String showClassThacher(HttpServletRequest request){

        Classteacher classteacher = new Classteacher();
        //放入老师的id
        classteacher.setTeacher_id(1);
        Class c = new Class();
        //班级状态(1为结业,0为未结业)
        c.setStatus(0);
        //查询此老师在校的班级
        List<Classteacher> cs = classteacherService.selectClassteacher(classteacher);
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
        return "classmanagement";
    }

    @RequestMapping("/jsonclass")
    @ResponseBody
    public void jsonFindClassTeache(PrintWriter printWriter,String classname,Integer status){
        //从此老师所有记录中查找
        if (status != null ){
            Classteacher classteacher = new Classteacher();
            //放入老师的id
            classteacher.setTeacher_id(1);
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
        classte.setCt_stopday(new Date());
        Integer count = classteacherService.update(classte);
        printWriter.print(count);
        printWriter.flush();
        printWriter.close();
    }

    @RequestMapping("/addclassteacherinfo")
    @ResponseBody
    public void addClassTeacherInfo(Classteacher classteacher,PrintWriter printWriter){
        //开始时间
        classteacher.setCt_startday(new Date());
        //0为当前档案
        classteacher.setStatus(0);
        Integer integer = classteacherService.inserClassteacher(classteacher);
        printWriter.print(integer);
        printWriter.flush();
        printWriter.close();
    }

}
