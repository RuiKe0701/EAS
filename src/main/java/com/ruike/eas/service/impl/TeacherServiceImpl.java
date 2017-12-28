package com.ruike.eas.service.impl;

import com.ruike.eas.dao.TeacherMapper;
import com.ruike.eas.dao.ThloginMapper;
import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.pojo.Thlogin;
import com.ruike.eas.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;
@Service("teacherService")
public class TeacherServiceImpl implements TeacherService{
    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private ThloginMapper thloginMapper;

    public List<Teacher> selectTeacher(Teacher teacher) {
        return teacherMapper.selectTeacher(teacher);
    }

    public Integer inserTeacher(Teacher teacher) {
        return null;
    }

    public Integer updateTeacher(Teacher teacher) {
        return teacherMapper.updateTeacher(teacher);
    }

    public Thlogin addTeacherAndLogin(Teacher teacher) {
        Thlogin thlogin = null;
        //0为未离职
        teacher.setTh_status(0);
        //删除状态为未删除
        teacher.setStatus(0);
        //当前时间为创建时间
        teacher.setTh_entrydate(new Date());
        //插入教师表
        Integer count = teacherMapper.inserTeacher(teacher);
        //如果成功
        if (count != 0) {
            thlogin = new Thlogin();
            //放入刚插入的教师id
            thlogin.setTh_id(teacher.getTh_id());
            //名字格式为zbit+教师id
            thlogin.setThl_number("zbit"+teacher.getTh_type()+teacher.getTh_id());
            //密码默认为123456 后期可以设置自己修改密码的功能
            thlogin.setThl_password("123456");
            //类型id
            thlogin.setTy_id(teacher.getTh_type());
            //插入账号
            count = thloginMapper.insertThlogin(thlogin);
            //如果插入失败则为null
            if (count == 0) {
                thlogin = null;
            }
        }
        return thlogin;
    }

    public Thlogin addThLogin(Thlogin thlogin) {
        thlogin.setThl_password("123456");
        thlogin.setThl_number("zbit"+thlogin.getTy_id()+thlogin.getTh_id());
        Integer count = thloginMapper.insertThlogin(thlogin);
        if (count != 0) {
            return thlogin;
        }
        return null;
    }


    public Integer verificationLogin(Integer status ,Object tl){
        //返回默认为1
        Integer count = 0;
        //状态为1 则需要验证教师名是否重复 只需要验证在职
        if (status ==1){
            Teacher teacher = (Teacher)tl;
            teacher.setTh_status(0);
            //查找在职的指定名字的教师
            List<Teacher> teachers = teacherMapper.selectTeacher(teacher);
            //如果有数据则重复了返回为1 没有数据则可以插入返回0
            count = teachers!=null && teachers.size() > 0 ? 1:count;
        }else if (status == 2){ //状态码 2 则需要验证是否添加了重复的账号
            //内有教师id与权限类型id
            Thlogin thlogin = (Thlogin)tl;
            //查找指定教师与权限 有无重复数据
            List<Thlogin> thlogins = thloginMapper.selectThlogin(thlogin);
            //有则1  无则0
            count = thlogins != null && thlogins.size() > 0 ? 1 : count ;
        }
        return count;
    }
}
