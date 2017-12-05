package com.ruike.eas.service;

import com.ruike.eas.pojo.Classstu;
import com.ruike.eas.pojo.Stu;

import java.util.List;

public interface StudentService {
    //查询默认显示的学生信息

    /**
     * 默认显示最近添加的50名学生
     * @return
     */
    public List<Stu> defaultStudent();

    /**
     * 根据条件进行单个学生所有基本信息的查询
     * @param stu
     * @return
     */
    public Stu selectStudentByStu(Stu stu);

    /**
     * 根据条件查询学生信息
     * @param stu
     * @return
     */
    public List<Stu> selectByStudent(Stu stu);

    /**
     * 新增学生
     * @param stu
     * @return
     */
    public Integer addStu(Stu stu);

    /**
     * 修改学生信息
     * @param stu
     * @return
     */
    public Integer updateStuInfo(Stu stu);
    /**
     * 根据学生所在班级查询学生信息
     */
    public List<Stu> selectStuByClass(Stu stu);

    /**
     * 批量添加学生并分配给班级
     * @param stus 学生集合
     * @return 插入的带id的学生集合
     */
    public Integer addAllStudnet(List<Stu> stus);

    /**
     * 添加一名学生档案并分配班级
     * @param stu 学生对象
     * @return 受影响行数
     */
    public Integer addStuAndClass(Stu stu);
}
