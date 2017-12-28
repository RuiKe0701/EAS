package com.ruike.eas.dao;

import com.ruike.eas.pojo.ThType;

import java.util.List;

public interface ThTypeMapper {
    /**
     * 根据条件查询账号属性
     * @param thType 属性对象
     * @return 集合
     */
    List<ThType> selectThType(ThType thType);
}
