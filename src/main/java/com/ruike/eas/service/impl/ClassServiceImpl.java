package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassMapper;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("classService")
public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassMapper classMapper;
    //添加新学员
    public Integer insertClass(Class classes) {
        return classMapper.insertClass(classes);
    }
    //带条件查询班级信息
    public List<Class> selectClass(Class classes) {
        return null;
    }
    //班级信息修改
    public Integer updateClass(Class classes) {
        return null;
    }
}
