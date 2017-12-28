package com.ruike.eas.dao;

import com.ruike.eas.pojo.Thlogin;

import java.util.List;

public interface ThloginMapper {
    /*
    根据老师账号密码查询老师信息
     */
    public Thlogin selectbynumberandpwd(Thlogin thlogin);

    /**
     * 根据条件查询账号信息
     * @param thlogin 账号对象
     * @return 集合
     */
    List<Thlogin> selectThlogin(Thlogin thlogin);


    Integer insertThlogin(Thlogin thlogin);
}
