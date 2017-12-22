package com.ruike.eas.dao;

import com.ruike.eas.pojo.Stu;

import java.util.List;

public interface StudentMapper {
    public List<Stu> selectStudent(Stu stu);
    //根据学生对象查询单个学生
    public Stu selectstudentbystu(Stu stu);
    public List<Stu> defaultstudent();

    public List<Stu> selectStuby();

    public Integer insertStu(Stu stu);

    public Integer updateStu(Stu stu);

    //根据班级id查学生
    public List<Stu> selectStuclassid(Stu stu);

    public Integer insertByBatchByStu(List<Stu> stus);

    /**
     * 根据条件分页查询学生信息
     * @param stu 学生对象
     * @return  集合
     */
    List<Stu> selectPagerStuInfo(Stu stu);

    /**
     * 根据条件查询学生信息总条数
     * @param stu 学生信息
     * @return 集合
     */
    Integer selectPagerStuInfoCount(Stu stu);
}
