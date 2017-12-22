package com.ruike.eas.service;

import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.pojo.Thlogin;

public interface ThloginService {
    /*
    登陆验证操作
     */
    public Thlogin dologin(Thlogin thlogin);
    /*
    获取老师信息
     */
    public Teacher TeacherInfo(Teacher teacher);

}
