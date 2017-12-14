package com.ruike.eas.dao;

import com.ruike.eas.pojo.ClassExam;

import java.util.List;

/**
 * Created by Administrator on 2017/12/6.
 */
public interface ClassExamMapper {

    /**
     * 根据条件查询班级考试表
     * @param classExam 实体类
     * @return 集合
     */
    public List<ClassExam> selectClassExam(ClassExam classExam);

    /**
     * 根据条件插入查询班级考试表
     * @param classExam 实体类
     * @return 受影响行数
     */
    public Integer insertClassExam(ClassExam classExam);

    /**
     * 根据条件修改班级考试表
     * @param classExam 实体类
     * @return 受影响行数
     */
    public Integer updateClassExam(ClassExam classExam);

    /**
     * 查询考完试还没有录入成绩的考试
     * @param classExam 班级考试对象
     * @return 集合
     */
    public List<ClassExam> selectByClassExamByDate(ClassExam classExam);
}
