package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassteacherMapper;
import com.ruike.eas.dao.StudentMapper;

import com.ruike.eas.pojo.Classstu;
import com.ruike.eas.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruike.eas.pojo.Stu;

import java.util.ArrayList;
import java.util.List;
@Service("studentService")
public class StudnetServiceImpl implements StudentService {
    @Autowired
    private  StudentMapper studentMapper;

    @Autowired
    private ClassteacherMapper classteacherMapper;

    public List<Stu> defaultStudent() {
        return studentMapper.defaultstudent();
    }

    //根据id进行单个学生的基本信息展示
    public Stu selectStudentByStu(Stu stu) {
        if(stu.getStu_id()!=null){
            return  studentMapper.selectstudentbystu(stu);
        }else {
            return null;
        }
        }
    //根据条件查询学生信息
    public List<Stu> selectByStudent(Stu stu) {
        return studentMapper.selectStudent(stu);
    }
    //添加新学员
    public Integer addStu(Stu stu) {
        return studentMapper.insertStu(stu);
    }
    //修改学员信息
    public Integer updateStuInfo(Stu stu) {
        return studentMapper.updateStu(stu);
    }
    //根据班级查询学员信息
    public List<Stu> selectStuByClass(Stu stu) {
        return studentMapper.selectStudent(stu);
    }

    public List<Stu> addAllStudnet(List<Stu> stus) {

        int a=studentMapper.insertByBatchByStu(stus);
        if (a>0){
            for (Stu stu : stus) {
                int as=stu.getStu_id();
                System.out.println(as);
            }
        }
        return stus;
    }
}

