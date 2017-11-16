package com.ruike.eas.service;

import com.ruike.eas.pojo.Stu;

import java.util.List;

public interface StudentService {
    //查询默认显示的学生信息
    //默认显示最近添加的50名学生
    public List<Stu> defaultstudent();
    //根据条件进行单个学生所有基本信息的查询
    public Stu selectstudentbystu(Stu stu);

    public List<Stu> selectByStudent(Stu stu);

    public Integer addStu(Stu stu);

    public Integer updateStuInfo(Stu stu);
}
