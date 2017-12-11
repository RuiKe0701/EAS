package com.ruike.eas.service;

import com.ruike.eas.pojo.ClassExam;

import java.util.List;

/**
 * Created by Administrator on 2017/12/11.
 */
public interface ClassExamService {

    /**
     * 根据条件查询班级考试
     * @param classExam 班级参加考试对象
     * @return 集合
     */
    public List<ClassExam> selectClassExam(ClassExam classExam);

    /**
     * 添加班级考试(单个)
     * @param classExam 班级考试对象
     * @return 受影响行数
     */
    public Integer addClassExamInfo(ClassExam classExam);
}
