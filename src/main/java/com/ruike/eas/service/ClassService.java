package com.ruike.eas.service;

import com.ruike.eas.pojo.Class;

import java.util.List;

public interface ClassService {
    /**
     * 新增新班级
     * @param classes
     * @return
     */
    public Integer insertClass(Class classes);

    /**
     * 带条件查询班级
     * @param classes
     * @return
     */
    public List<Class> selectClass(Class classes);

    /**
     * 带条件修改班级信息
     * @param classes
     * @return
     */
    public Integer updateClass(Class classes);

}
