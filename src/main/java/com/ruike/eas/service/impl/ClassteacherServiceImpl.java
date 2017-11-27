package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassteacherMapper;
import com.ruike.eas.pojo.Classteacher;
import com.ruike.eas.service.ClassteacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("classteacherService")
public class ClassteacherServiceImpl implements ClassteacherService {
    @Autowired
    private ClassteacherMapper classteacherMapper;
    public List<Classteacher> selectClassteacher(Classteacher classteacher) {
        return classteacherMapper.selectClassteacher(classteacher);
    }

    public Integer inserClassteacher(Classteacher classteacher) {
        return classteacherMapper.inserClassteacher(classteacher);
    }

    public Integer update(Classteacher classteacher) {
        return classteacherMapper.update(classteacher);
    }
}
