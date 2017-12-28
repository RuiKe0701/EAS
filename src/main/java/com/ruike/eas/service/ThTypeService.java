package com.ruike.eas.service;

import com.ruike.eas.pojo.ThType;

import java.util.List;

public interface ThTypeService {
    /**
     * 查找所有账号属性信息
     * @return
     */
    List<ThType> selectThTypeInfo();
}
