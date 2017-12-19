package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ThloginMapper;
import com.ruike.eas.pojo.Thlogin;
import com.ruike.eas.service.ThloginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("thloginService")
public class ThloginServiceImpl implements ThloginService{
    @Autowired
    private ThloginMapper thloginMapper;

    public Thlogin dologin(Thlogin thlogin) {
        return thloginMapper.selectbynumberandpwd(thlogin);
    }
}
