package com.ruike.eas.service.impl;

import com.ruike.eas.dao.SchoolExamMapper;
import com.ruike.eas.pojo.SchoolExam;
import com.ruike.eas.service.SchoolExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/7.
 */
@Service("schoolExamService")
public class SchoolExamServiceImpl implements SchoolExamService {
    @Autowired
    private SchoolExamMapper schoolExamMapper;

    public List<SchoolExam> selectBySchoolExamInfo(SchoolExam schoolExam) {
        Integer count = schoolExamMapper.selectSchoolExamCount(schoolExam);
        List<SchoolExam> schoolExams = null;
        if (count > 0) {
            schoolExam.init(20,count);
            schoolExams = schoolExamMapper.selectSchoolExam(schoolExam);
        }
        return schoolExams;
    }

    public Integer addSchoolExamInfo(SchoolExam schoolExam) {
        return schoolExamMapper.insertSchoolExam(schoolExam);
    }

    public Integer removeSchoolExamInfo(SchoolExam schoolExam) {
        return schoolExamMapper.updateSchoolExam(schoolExam);
    }
}
