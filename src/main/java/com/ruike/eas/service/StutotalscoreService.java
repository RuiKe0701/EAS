package com.ruike.eas.service;

import com.ruike.eas.pojo.Stutotalscore;

import java.util.List;

public interface StutotalscoreService {
    public Integer insertStustses(List<Stutotalscore> stutotalscoreList);
    public Integer updatestusts(List<Stutotalscore> stutotalscoreList);
    /*
    查询出学生总分根据条件
     */
    public List<Stutotalscore> selectStusts(Stutotalscore stutotalscore);
    /*
    根据条件查询学生总分信息
     */
    public List<Stutotalscore> selectStustsbystus(Stutotalscore stutotalscore);
}
