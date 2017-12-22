package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassExamMapper;
import com.ruike.eas.dao.ClassScoreMapper;
import com.ruike.eas.dao.StuScoreMapper;
import com.ruike.eas.dao.StudentMapper;
import com.ruike.eas.pojo.*;
import com.ruike.eas.service.ClassExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/11.
 */
@Service("classExamService")
public class ClassExamServiceImpl implements ClassExamService {
    @Autowired
    private ClassExamMapper classExamMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private StuScoreMapper stuScoreMapper;

    @Autowired
    private ClassScoreMapper classScoreMapper;

    public List<ClassExam> selectClassExam(ClassExam classExam) {
        return classExamMapper.selectClassExam(classExam);
    }

    public Integer addClassExamInfo(ClassExam classExam) {
        return classExamMapper.insertClassExam(classExam);
    }

    public Integer updateClassExamInfo(ClassExam classExam) {
        return classExamMapper.updateClassExam(classExam);
    }

    public List<ClassExam> findClassExamByNull(ClassExam classExam) {
        return classExamMapper.selectByClassExamByDate(classExam);
    }

    public Integer insertBatchClassExam(List<StuScore> stuScores, ClassScore classScore ,Integer class_id) {
        Stu stu = new Stu();
        Integer i = 0;
        //循环查询对应学号的学生id
        for (StuScore stuScore : stuScores) {
            stu.setStu_no(stuScore.getStu_no());
            stu.setClass_id(class_id);
            //查找对应学号的学生
            Stu student = studentMapper.selectstudentbystu(stu);
            //如果学员学号正确
            if (student != null){
                System.out.println(student.getStu_id());
                //存入对应学号的学生id
                stuScores.get(i).setStu_Id(student.getStu_id());
            }else {
               return -1;
            }
            i++;
        }
        //添加班级成绩
        Integer count = classScoreMapper.insertClassScore(classScore);
        if (count != 0) {
            //批量添加学生成绩
            count = stuScoreMapper.insertAllStuScore(stuScores);
        }
        return count!=0?1:0;
    }

    public List<ClassExam> selectExamHasBeen(ClassExam classExam) {
        return classExamMapper.selectClassExamHasBeen(classExam);
    }
}
