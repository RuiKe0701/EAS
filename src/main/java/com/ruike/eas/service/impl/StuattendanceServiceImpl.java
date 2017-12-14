package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassattendanceMapper;
import com.ruike.eas.dao.ClassstuMapper;
import com.ruike.eas.dao.StuattendanceMapper;
import com.ruike.eas.pojo.Classattendance;
import com.ruike.eas.pojo.Classstu;
import com.ruike.eas.pojo.Stuattendance;
import com.ruike.eas.service.StuattendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service("stuattendanceService")
public class StuattendanceServiceImpl implements StuattendanceService {
    @Autowired
    private StuattendanceMapper stuattendanceMapper;
    @Autowired
    private ClassattendanceMapper classattendanceMapper;
    @Autowired
    private ClassstuMapper classstuMapper;
    /*
    根据班级id查到该班学员出勤情况
     */
    public List<Stuattendance> selectsatdbyclassid(Stuattendance stuattendance) {
        Classattendance classattendance1=new Classattendance();
        classattendance1.setClass_id(stuattendance.getClass_id());
        Integer a=classattendanceMapper.selecttime(classattendance1);
        List<Stuattendance> stuattendanceList=new ArrayList<Stuattendance>();
        Stuattendance stuattendance2=new Stuattendance();
        stuattendance2.setClass_id(stuattendance.getClass_id());
        stuattendanceList=stuattendanceMapper.selectstuatdbyclassid(stuattendance2);
        for (Stuattendance stuattendance1 : stuattendanceList) {
            stuattendance1.setClassattendancetime(a);
        }
        return stuattendanceList;
    }

    public List<Classstu> selectClassstubyclassid(Classstu classstu) {
        return classstuMapper.selectclassstubyclassid(classstu);
    }
}
