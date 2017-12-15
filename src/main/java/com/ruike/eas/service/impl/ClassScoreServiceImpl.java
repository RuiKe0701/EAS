package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassScoreMapper;
import com.ruike.eas.pojo.ClassScore;
import com.ruike.eas.service.ClassScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/14.
 */
@Service("classScoreService")
public class ClassScoreServiceImpl implements ClassScoreService {

    @Autowired
    private ClassScoreMapper classScoreMapper;

    public List<ClassScore> selectClassScoreByClass(ClassScore classScore) {
        //判定对象和id 是否为null 为null则返回null不为null则调用查询班级成绩方法
        return classScore!=null&&classScore.getClass_id()!=null
                ?classScoreMapper.selectClassScore(classScore):null;
    }
}
