package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassstuMapper;
import com.ruike.eas.dao.ClassteacherMapper;
import com.ruike.eas.dao.StudentMapper;

import com.ruike.eas.dao.StutotalscoreMapper;
import com.ruike.eas.pojo.Classstu;
import com.ruike.eas.pojo.Stutotalscore;
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

    @Autowired
    private ClassstuMapper classstuMapper;
    @Autowired
    private StutotalscoreMapper stutotalscoreMapper;

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
    //批量添加学生
    public Integer addAllStudnet(List<Stu> stus) {
        int count = studentMapper.insertByBatchByStu(stus);
        if (count > 0) {
            List<Classstu> classstus = new ArrayList<Classstu>();
            for (Stu stu : stus) {
                Classstu ct = new Classstu();
                ct.setStu_id(stu.getStu_id());
                ct.setClass_id(stu.getClass_id());
                classstus.add(ct);
            }
            List<Stutotalscore> stutotalscoreList=new ArrayList<Stutotalscore>();

            for (Stu stu : stus) {
                Stutotalscore ct = new Stutotalscore();
                ct.setStu_id(stu.getStu_id());
                ct.setClass_id(stu.getClass_id());
                ct.setStu_totalscore(80);
                stutotalscoreList.add(ct);
            }
            int count2=stutotalscoreMapper.insertStustses(stutotalscoreList);
           count = classstuMapper.insertAllClassStu(classstus);
            if(count>0&&count2>0){
                count=1;
            }else {
                count=0;
            }
        }
        return count;
    }

    public Integer addStuAndClass(Stu stu) {
        //添加到学生档案
        Integer count = studentMapper.insertStu(stu);
        //如果成功
        if (count != 0) {
            //声明班级学生分配对象
            Classstu classstu = new Classstu();
            //将返回的stu_id放入
            classstu.setStu_id(stu.getStu_id());
            //放入班级id
            classstu.setClass_id(stu.getClass_id());
            //添加到班级学生分配表
            count = classstuMapper.insertClassStu(classstu);
        }else {
            count = -1;
        }
        return count;
    }

    public List<Stu> selectPagerStudentInfo(Stu stu) {
        List<Stu> stus = null;
        //总条数
        Integer count = studentMapper.selectPagerStuInfoCount(stu);
        //总数不等于0
        if (count != 0){
            //初始化分页属性
            stu.init(20,count);
            //根据条件分页查询学生信息
            stus = studentMapper.selectPagerStuInfo(stu);
        }
        return stus;
    }
}

