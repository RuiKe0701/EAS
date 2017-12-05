package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassMapper;
import com.ruike.eas.dao.ClassstuMapper;
import com.ruike.eas.dao.ClassteacherMapper;
import com.ruike.eas.dao.StudentMapper;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.pojo.Classstu;
import com.ruike.eas.pojo.Classteacher;
import com.ruike.eas.pojo.Stu;
import com.ruike.eas.service.ClassService;
import com.ruike.eas.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("classService")
public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassMapper classMapper;

    @Autowired
    private ClassteacherMapper classteacherMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ClassstuMapper classstuMapper;
    //添加新班级
    public Integer insertClass(Class classes) {
        Integer count = null;
        Class cc = new Class();
        cc.setClass_name(classes.getClass_name());
        //查找此班级名字是否被占用
        List<Class> cs = classMapper.selectClass(cc);
        if (cs == null || cs.size() == 0){
            classMapper.insertClass(classes);
            count = classes.getClass_id();
        }
        return count;
    }
    //带条件查询班级信息
    public List<Class> selectClass(Class classes) {
        return classMapper.selectClass(classes);
    }
    //班级信息修改
    public Integer updateClass(Class classes) {
        return classMapper.updateClass(classes);
    }

    //升班
    public Integer stuUpgraded(List<Classstu> classstus, Class c, Classteacher classteacher) {
        Integer count = 0;
        //取出新班级的年级类型
        Integer grad = c.getGrade_id();
        //取出新班的班级名称
        String class_name = c.getClass_name();
        c.setClass_name(null);
        c.setGrade_id(null);
        //将升班的新班开班日期作为旧班的结束日期
        c.setClass_stopday(classteacher.getCt_startday());
        //1为班结业,0未结业
        c.setClass_state(1);
        //休班班级信息 改为结业并插入结束日期
        Integer classcount = classMapper.updateClass(c);
        if (classcount > 0) {
            Classteacher ct = new Classteacher();
            ct.setClass_id(c.getClass_id());
            ct.setCt_stopday(classteacher.getCt_startday());
            ct.setStatus(1);
            //修改旧班的老师班级分配表(将老师改为历史并给结束日期)
            Integer update = classteacherMapper.update(ct);
            if (update > 0) {
                Class cl = new Class();
                cl.setClass_name(class_name);
                cl.setClass_startday(classteacher.getCt_startday());
                cl.setGrade_id(grad);
                cl.setStatus(0);
                cl.setClass_state(0);
                //插入新的班级
                Integer integer = classMapper.insertClass(cl);
                if (integer > 0) {
                    Stu stu = new Stu();
                    Integer stucount = 0;
                    for (Classstu classstu : classstus) {
                        //顺便将新的班级id写入班级学生对象中
                        classstu.setClass_id(cl.getClass_id());
                        stu.setStu_id(classstu.getStu_id());
                        stu.setClass_id(cl.getClass_id());
                        stucount += studentMapper.updateStu(stu);
                    }
                    if (stucount == classstus.size()) {
                        //为班级老师对象写入刚插入班级的id
                        classteacher.setClass_id(cl.getClass_id());
                        classteacher.setStatus(0);
                        classteacher.setRemarks("班主任");
                        classteacher.setCt_type(0);
                        Integer integer1 = classteacherMapper.inserClassteacher(classteacher);
                        if (integer1 > 0) {
                            Integer integer2 = classstuMapper.insertAllClassStu(classstus);
                            //0为批量添加学生班级分配表失败 1 为成功
                            count = integer2 > 0 ? 1 : 0;
                        }else{
                            //批量分配学生失败
                            count = -5;
                        }
                    }else{
                        //修改学生班级失败
                        count = -4;
                    }
                }else{
                    //插入新班级失败
                    count = -3;
                }
            }else{
                //修改旧班的老师班级分配表(将老师改为历史并给结束日期)失败
                count = -2;
            }
        }else {
            //修改原来班级失败
            count = -1;
        }
        if (count != 1){
            throw new RuntimeException("升班失败 异常回滚");
        }
        return count;
    }

    public Integer addClassAndTeacher(Class c, Classteacher classteacher) {
        //执行插入班级表方法
        Integer count = classMapper.insertClass(c);
        if (count > 0) {
            //放入创建成功的班级的id
            classteacher.setClass_id(c.getClass_id());
            //执行插入班级老师分配方法
            count = classteacherMapper.inserClassteacher(classteacher);
            //如果插入失败 则全部回滚
            if (count != 1){
                throw new RuntimeException("创建班级分配老师失败!");
            }
        }
        return count;
    }
}
