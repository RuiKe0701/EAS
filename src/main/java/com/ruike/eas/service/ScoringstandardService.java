package com.ruike.eas.service;

import com.ruike.eas.pojo.Scoringstandard;

import java.util.List;

public interface ScoringstandardService {
    /*
    新增评分标准（含评分项和分数，处理方式）
     */
    public  int  insert(Scoringstandard param);
    /*
    查询评分标（可以待条件进行评分查询）
     */
    public List<Scoringstandard> selectAll(Scoringstandard param);

}
