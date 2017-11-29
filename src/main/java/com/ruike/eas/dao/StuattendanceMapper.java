package com.ruike.eas.dao;

import com.ruike.eas.pojo.Stuattendance;

import java.util.List;

public interface StuattendanceMapper{
    public Integer insertStuatds(List<Stuattendance> stuattendances);

    public List<Stuattendance> stuattendancesbystuatd(Stuattendance stuattendance);

}
