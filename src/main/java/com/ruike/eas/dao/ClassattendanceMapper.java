package com.ruike.eas.dao;

import com.ruike.eas.pojo.Classattendance;

import java.util.List;

public interface ClassattendanceMapper {
    public Integer insertClassatd(Classattendance classattendance);
    public List<Classattendance> selectClassatd(Classattendance classattendance);
    /*
    根据班级查询出班级最近一次的点名
     */
    public Classattendance selectnewClassatd(Classattendance classattendance);
}
