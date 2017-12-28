package com.ruike.eas.service;

import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.pojo.Thlogin;

import java.util.List;

public interface ThloginService {
    /*
    登陆验证操作
     */
    public Thlogin dologin(Thlogin thlogin);
    /*
    获取老师信息
     */
    public Teacher TeacherInfo(Teacher teacher);

    /**
     * 根据条件查询教师与账号信息
     * @param thlogin 账号对象
     * @return 集合
     */
    List<Thlogin> selectThloginAndTeacherInfo(Thlogin thlogin);

}
