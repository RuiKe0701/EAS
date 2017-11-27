package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassMapper;
import com.ruike.eas.pojo.Class;
import com.ruike.eas.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("classService")
public class ClassServiceImpl implements ClassService {
    @Autowired
    private ClassMapper classMapper;
    //添加新班级
    public Integer insertClass(Class classes) {
        Integer count = null;
        Class cc = new Class();
        cc.setClass_name(classes.getClass_name());
        //查找此班级名字是否被占用
        List<Class> cs = classMapper.selectClass(cc);
        if (cs == null || cs.size() == 0){
            classMapper.insertClass(classes);
            count = classes.getClass_id();
        }
        return count;
    }
    //带条件查询班级信息
    public List<Class> selectClass(Class classes) {
        return classMapper.selectClass(classes);
    }
    //班级信息修改
    public Integer updateClass(Class classes) {
        return classMapper.updateClass(classes);
    }
}
