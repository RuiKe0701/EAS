package com.ruike.eas.dao;

import com.ruike.eas.pojo.Stutotalscore;

import java.util.List;

public interface StutotalscoreMapper {
    public Integer insertStustses(List<Stutotalscore> stutotalscoreList);
    public Integer updatestusts(List<Stutotalscore> stutotalscoreList);
    public List<Stutotalscore> selectStusts(Stutotalscore stutotalscore);
}
