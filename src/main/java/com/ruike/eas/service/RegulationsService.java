package com.ruike.eas.service;

import com.ruike.eas.pojo.Regulations;
import com.ruike.eas.pojo.Regulationstype;

import java.util.List;

public interface RegulationsService {
    //条件查询规章评分
    public List<Regulations> SelectRegulationByRl(Regulations regulations);
    //查看规章类型
    public List<Regulationstype> selectrltbyrlt(Regulationstype regulationstype);
    //添加新的规章类型
    public Integer insertintoral(Regulationstype regulationstype);
    //添加新的规章
    public Integer InsertRegulation(Regulations regulations);
}
