package com.ruike.eas.dao;

import com.ruike.eas.pojo.SchoolExam;

import java.util.List;

/**
 * Created by Administrator on 2017/12/6.
 */
public interface SchoolExamMapper {
    /**
     * 根据条件查询考试类型安排表
     * @param schoolExam 实体类
     * @return 集合
     */
    public List<SchoolExam> selectSchoolExam(SchoolExam schoolExam);

    /**
     * 根据条件查询数据总数量
     * @param schoolExam 实体类
     * @return 总数量
     */
    public Integer selectSchoolExamCount(SchoolExam schoolExam);

    /**
     * 根据条件插入考试类型安排表
     * @param schoolExam 实体类
     * @return 受影响行数
     */
    public Integer insertSchoolExam(SchoolExam schoolExam);


    /**
     * 根据条件修改考试类型安排表
     * @param schoolExam 实体类
     * @return 受影响行数
     */
    public Integer updateSchoolExam(SchoolExam schoolExam);
}
