package com.ruike.eas.service;

import com.ruike.eas.pojo.ClassScore;

import java.util.List;

/**
 * Created by Administrator on 2017/12/14.
 */
public interface ClassScoreService {
    /**
     * 根据班级查询班级成绩的信息
     * @param classScore 班级考试对象(内有班级id(class_id))
     * @return 集合
     */
    List<ClassScore> selectClassScoreByClass(ClassScore classScore);
}
