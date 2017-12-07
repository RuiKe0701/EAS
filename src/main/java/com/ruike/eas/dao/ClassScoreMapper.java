package com.ruike.eas.dao;

import com.ruike.eas.pojo.ClassScore;

import java.util.List;

/**
 * Created by Administrator on 2017/12/6.
 */
public interface ClassScoreMapper {

    /**
     * 根据条件查询班级考试成绩表
     * @param classScore 实体类
     * @return 集合
     */
    public List<ClassScore> selectClassScore(ClassScore classScore);

    /**
     * 根据条件插入班级考试成绩表
     * @param classScore 实体类
     * @return 受影响行数
     */
    public Integer insertClassScore(ClassScore classScore);

    /**
     * 根据条件修改班级考试成绩表
     * @param classScore 实体类
     * @return 受影响行数
     */
    public Integer updateClassScore(ClassScore classScore);

    /**
     * 批量插入班级考试成绩白表
     * @param classScores 集合
     * @return 受影响行数
     */
    public Integer insertAllClassScore(List<ClassScore> classScores);

}
