package com.ruike.eas.dao;

import com.ruike.eas.pojo.Classteacher;
import com.ruike.eas.service.ClassteacherService;

import java.util.List;

public interface ClassteacherMapper {
    /**
     * 根据条件查询班级老师表
     * @param classteacher
     * @return
     */
    public List<Classteacher> selectClassteacher(Classteacher classteacher);
    /**
     * 添加班级老师关系信息
     * @param classteacher
     * @return
     */
    public Integer inserClassteacher(Classteacher classteacher);
    /**
     * 修改老师班级关系信息
     * @param classteacher
     * @return
     */
    public Integer update(Classteacher classteacher);

    /*
    根据老师查询老师正在带的班级
     */
    public List<Classteacher> selectclassbytecaherid(Classteacher classteacher);
    /*
    根据老师id查询历史班级
     */
    public List<Classteacher> selectoldclassbytecaherid(Classteacher classteacher);
}
