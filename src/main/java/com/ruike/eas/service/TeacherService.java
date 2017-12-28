package com.ruike.eas.service;

import com.ruike.eas.pojo.Teacher;
import com.ruike.eas.pojo.Thlogin;

import java.util.List;

public interface TeacherService {
    /**
     * 带条件查询老师信息
     * @param teacher
     * @return
     */
    public List<Teacher> selectTeacher(Teacher teacher);

    /**
     * 新增老师信息
     * @param teacher
     * @return
     */
    public Integer inserTeacher(Teacher teacher);

    /**
     * 更新老师信息
     * @param teacher
     * @return
     */
    public Integer updateTeacher(Teacher teacher);

    /**
     * 添加新老师及其账号信息
     * @param teacher 教师对象(内有姓名于任职类型)
     * @return 账号对象
     */
    Thlogin addTeacherAndLogin(Teacher teacher);


    /**
     * 为老师添加新账号
     * @param thlogin 账号
     * @return 账号对象
     */
    Thlogin addThLogin(Thlogin thlogin);

    /**
     * 验证姓名是否重复(只和在职的比较) 或者账号添加 验证(是否重复)
     * @param status 状态码 1 为验证新教师添加是否重名 2位验证为教师添加新账号是否重复
     * @param tl 对象 根据状态转换
     * @return 状态码
     */
    Integer verificationLogin(Integer status ,Object tl);
}
