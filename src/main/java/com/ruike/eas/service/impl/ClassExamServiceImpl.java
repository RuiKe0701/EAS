package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassExamMapper;
import com.ruike.eas.pojo.ClassExam;
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

    public List<ClassExam> selectClassExam(ClassExam classExam) {
        return classExamMapper.selectClassExam(classExam);
    }

    public Integer addClassExamInfo(ClassExam classExam) {
        return classExamMapper.insertClassExam(classExam);
    }
}
