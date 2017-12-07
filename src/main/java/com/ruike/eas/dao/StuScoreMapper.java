package com.ruike.eas.dao;

import com.ruike.eas.pojo.Stu;
import com.ruike.eas.pojo.StuScore;

import java.util.List;

/**
 * Created by Administrator on 2017/12/6.
 */
public interface StuScoreMapper {
    /**
     * 根据条件查询学生考试成绩表
     * @param stuScore 实体类
     * @return 集合
     */
    public List<StuScore> selectStuScore(StuScore stuScore);

    /**
     * 根据条件插入学生考试成绩表
     * @param stuScore 实体类
     * @return 集合
     */
    public Integer insertStuScore(StuScore stuScore);

    /**
     * 根据条件修改学生考试成绩表
     * @param stuScore 实体类
     * @return 受影响行数
     */
    public Integer updateStuScore(StuScore stuScore);

    /**
     * 批量插入学生考试成绩表
     * @param stuScores 集合
     * @return 受影响行数
     */
    public Integer insertAllStuScore(List<StuScore> stuScores);
}
