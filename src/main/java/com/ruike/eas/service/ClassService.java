package com.ruike.eas.service;

import com.ruike.eas.pojo.Class;
import com.ruike.eas.pojo.Classstu;
import com.ruike.eas.pojo.Classteacher;

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

    /**
     * 为指定学生做升班
     * @param classstus 学生班级分配对象(里面暂时只有需要升班的学生id)
     * @param c 需要升班的班级对象(含id,结束时间,即结业状态,新班级的年级,新班级的名称)
     * @param classteacher 班级老师分配对象(含新班级的名字,新老师id,开班日期)
     * @return 是否成功 否则返回错误码
     */
    public Integer stuUpgraded(List<Classstu> classstus, Class c, Classteacher classteacher);

    /**
     * 创建新班级并分配给指定班主任
     * @param c 新班级对象
     * @param classteacher 班级老师分配对象(含分配的老师id)
     * @return 是否成功
     */
    public Integer addClassAndTeacher(Class c ,Classteacher classteacher);

}
