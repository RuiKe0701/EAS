package com.ruike.eas.service.impl;

import com.ruike.eas.dao.TeacherMapper;
import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("teacherService")
public class TeacherServiceImpl implements TeacherService{
    @Autowired
    private TeacherMapper teacherMapper;

    public List<Teacher> selectTeacher(Teacher teacher) {
        return teacherMapper.selectTeacher(teacher);
    }

    public Integer inserTeacher(Teacher teacher) {
        return null;
    }

    public Integer updateTeacher(Teacher teacher) {
        return null;
    }
}
