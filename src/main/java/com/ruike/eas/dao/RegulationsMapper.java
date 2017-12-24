package com.ruike.eas.dao;

import com.ruike.eas.pojo.Regulations;

import java.util.List;

public interface RegulationsMapper {
    //条件查询规章评分
    public List<Regulations> SelectRegulationByRl(Regulations regulations);
    //添加新的规章
    public Integer InsertRegulation(Regulations regulations);
}
