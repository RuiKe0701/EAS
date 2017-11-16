package com.ruike.eas.service.impl;

import com.ruike.eas.dao.StudentMapper;

import com.ruike.eas.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruike.eas.pojo.Stu;

import java.util.List;
@Service("studentService")
public class StudnetServiceImpl implements StudentService {
    @Autowired
    private  StudentMapper studentMapper;

    public List<Stu> defaultstudent() {
        return studentMapper.defaultstudent();
    }

    //根据id进行单个学生的基本信息展示
    public Stu selectstudentbystu(Stu stu) {
        if(stu.getStu_id()!=null){
            return  studentMapper.selectstudentbystu(stu);
        }else {
            return null;
        }
        }

    public List<Stu> selectByStudent(Stu stu) {
        return null;
    }

    public Integer addStu(Stu stu) {
        return null;
    }

    public Integer updateStuInfo(Stu stu) {
        return null;
    }
}

