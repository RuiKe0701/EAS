package com.ruike.eas.service.impl;

import com.ruike.eas.dao.TeacherMapper;
import com.ruike.eas.dao.ThloginMapper;
import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.pojo.Thlogin;
import com.ruike.eas.service.ThloginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("thloginService")
public class ThloginServiceImpl implements ThloginService{
    @Autowired
    private ThloginMapper thloginMapper;
    @Autowired
    private TeacherMapper teacherMapper;

    public Thlogin dologin(Thlogin thlogin) {
        return thloginMapper.selectbynumberandpwd(thlogin);
    }

    public Teacher TeacherInfo(Teacher teacher){return teacherMapper.SelectTeacherBythid(teacher);}

    public List<Thlogin> selectThloginAndTeacherInfo(Thlogin thlogin) {
        return thloginMapper.selectThlogin(thlogin);
    }
}
