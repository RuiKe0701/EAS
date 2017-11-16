package com.ruike.eas.dao;

import com.ruike.eas.service.ClassteacherService;

import java.util.List;

public interface ClassteacherMapper {
    /**
     * 根据条件查询班级老师
     * @param classteacher
     * @return
     */
    public List<ClassteacherService> selectClassteacher(ClassteacherService classteacher);
    /**
     * 添加班级老师关系信息
     * @param classteacher
     * @return
     */
    public Integer inserClassteacher(ClassteacherService classteacher);
    /**
     * 修改老师班级关系信息
     * @param classteacher
     * @return
     */
    public Integer update(ClassteacherService classteacher);
}
