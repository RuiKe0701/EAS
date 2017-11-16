package com.ruike.eas.service;

import com.ruike.eas.pojo.Teacher;

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
}
