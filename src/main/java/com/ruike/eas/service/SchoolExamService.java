package com.ruike.eas.service;

import com.ruike.eas.pojo.SchoolExam;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
public interface SchoolExamService {

    /**
     * 根据条件分页查询考试安排
     * @param schoolExam 考试类型安排对象
     * @return 集合
     */
    public List<SchoolExam> selectBySchoolExamInfo(SchoolExam schoolExam);

    /**添加新的学校考试
     * @param schoolExam 学校考试对象
     * @return 受影响行数
     */
    public Integer addSchoolExamInfo(SchoolExam schoolExam);

    /**
     * 删除指定的学校考试安排
     * @param schoolExam 学校考试安排(含id,与删除状态)
     * @return 受影响行数
     */
    public Integer removeSchoolExamInfo(SchoolExam schoolExam);
}
