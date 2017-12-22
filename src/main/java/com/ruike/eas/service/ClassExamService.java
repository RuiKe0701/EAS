package com.ruike.eas.service;

import com.ruike.eas.pojo.ClassExam;
import com.ruike.eas.pojo.ClassScore;
import com.ruike.eas.pojo.Stu;
import com.ruike.eas.pojo.StuScore;

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

    /**
     * 修改班级考试
     * @param classExam  班级考试对象
     * @return  是否成功
     */
    public Integer updateClassExamInfo(ClassExam classExam);

    /**
     * 查找考完试未录入成绩的班级考试
     * @param classExam 班级考试对象
     * @return 班级考试集合
     */
    public List<ClassExam> findClassExamByNull(ClassExam classExam);

    /**
     * 批量添加学生成绩
     * @param stuScores 学生成绩对象(内只有学号需要再查出id)
     * @param classScore 班级成绩对象
     * @return 状态码
     */
    Integer insertBatchClassExam(List<StuScore> stuScores , ClassScore classScore ,Integer class_id);

    /**
     * 查询指定班级已录入成绩的班级考试
     * @param classExam 班级考试
     * @return 集合
     */
    List<ClassExam> selectExamHasBeen(ClassExam classExam);
}
