package com.ruike.eas.dao;

import com.ruike.eas.pojo.Scoringstandard;

import java.util.List;

public interface ScoringstandardMapper {
    public  int  insert(Scoringstandard param);
   List<Scoringstandard> selectAll(Scoringstandard param);
}
