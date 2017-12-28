package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ThTypeMapper;
import com.ruike.eas.pojo.ThType;
import com.ruike.eas.service.ThTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("thTypeService")
public class ThTypeServiceImpl implements ThTypeService {
    @Resource
    private ThTypeMapper thTypeMapper;
    public List<ThType> selectThTypeInfo() {
        return thTypeMapper.selectThType(new ThType());
    }
}
