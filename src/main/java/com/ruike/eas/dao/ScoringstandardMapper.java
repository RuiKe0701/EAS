package com.ruike.eas.dao;

import com.ruike.eas.pojo.Scoringstandard;

import java.util.List;

public interface ScoringstandardMapper {
    /*
    新增评分标准
     */
    public  int  insert(Scoringstandard param);
    /*
    查询评分标准表
     */
    public List<Scoringstandard> selectAll(Scoringstandard param);
}
