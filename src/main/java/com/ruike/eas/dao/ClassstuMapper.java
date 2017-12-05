package com.ruike.eas.dao;

import com.ruike.eas.pojo.Classstu;

import java.util.List;

public interface ClassstuMapper {
    /**
     * 插入学生班级分配表(单个)
     * @param cs 班级分配对象
     * @return  受影响行数
     */
    public Integer insertClassStu(Classstu cs);

    /**
     * 批量插入学生班级分配表(多个)
     * @param classstus 班级分配对象集合
     * @return 受影响行数
     */
    public Integer insertAllClassStu(List<Classstu> classstus);
}
