package com.ruike.eas.service.impl;

import com.ruike.eas.dao.StuScoreMapper;
import com.ruike.eas.pojo.StuScore;
import com.ruike.eas.service.StuScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/11.
 */
@Service("stuScoreService")
public class StuScoreServiceImpl implements StuScoreService {
    @Autowired
    private StuScoreMapper stuScoreMapper;

    public List<StuScore> selectStuScore(StuScore stuScore) {
        return stuScoreMapper.selectStuScore(stuScore);
    }
}
