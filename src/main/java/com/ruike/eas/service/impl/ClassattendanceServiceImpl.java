package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassattendanceMapper;
import com.ruike.eas.pojo.Classattendance;
import com.ruike.eas.service.ClassattendanceService;
import com.ruike.eas.service.ClassteacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("classattendanceService")
public class ClassattendanceServiceImpl implements ClassattendanceService {
    @Resource
    private ClassattendanceMapper classattendanceMapper;
    public Integer insertClassatd(Classattendance classattendance) {
        return classattendanceMapper.insertClassatd(classattendance);
    }

    public List<Classattendance> selectClassatd(Classattendance classattendance) {
        return null;
    }

    public Classattendance selectnewClassatd(Classattendance classattendance) {
        Classattendance classattendance1=classattendanceMapper.selectnewClassatd(classattendance);
        if(classattendance1==null){
            classattendance1=new Classattendance();
            classattendance1.setCad_number(0);
        }
        return classattendance1;
    }
}
