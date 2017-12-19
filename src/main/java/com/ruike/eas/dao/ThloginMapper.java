package com.ruike.eas.dao;

import com.ruike.eas.pojo.Thlogin;

public interface ThloginMapper {
    /*
    根据老师账号密码查询老师信息
     */
    public Thlogin selectbynumberandpwd(Thlogin thlogin);
}
