package com.ruike.eas.service.impl;

import com.ruike.eas.dao.StutotalscoreMapper;
import com.ruike.eas.pojo.Stutotalscore;
import com.ruike.eas.service.StutotalscoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("stutotalscoreService")
public class StutotalscoreServiceImpl implements StutotalscoreService{
    @Autowired
    private StutotalscoreMapper stutotalscoreMapper;
    public Integer insertStustses(List<Stutotalscore> stutotalscoreList) {
        return null;
    }
    public Integer updatestusts(List<Stutotalscore> stutotalscoreList) {
        return null;
    }
    public List<Stutotalscore> selectStusts(Stutotalscore stutotalscore) {
        return stutotalscoreMapper.selectStusts(stutotalscore);
    }
    public List<Stutotalscore> selectStustsbystus(Stutotalscore stutotalscore) {
        return stutotalscoreMapper.selectStustsbystus(stutotalscore);
    }
}
