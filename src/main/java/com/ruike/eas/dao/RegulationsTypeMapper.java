package com.ruike.eas.dao;

import com.ruike.eas.pojo.Regulationstype;

import java.util.List;

public interface RegulationsTypeMapper {
    //查看规章类型
    public List<Regulationstype> selectrltbyrlt(Regulationstype regulationstype);
    //添加新的规章类型
    public Integer insertintoral(Regulationstype regulationstype);
}
