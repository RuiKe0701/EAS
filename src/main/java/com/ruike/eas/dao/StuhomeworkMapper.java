package com.ruike.eas.dao;

import com.ruike.eas.pojo.Stuhomework;

import java.util.List;

public interface StuhomeworkMapper {
    //批量新增学生家庭作业
    public Integer addstuhomeworks(List<Stuhomework> stuhomeworkList);
}
