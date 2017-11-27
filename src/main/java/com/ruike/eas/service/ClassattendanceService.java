package com.ruike.eas.service;

import com.ruike.eas.pojo.Classattendance;

import java.util.List;

public interface ClassattendanceService {
    public Integer insertClassatd(Classattendance classattendance);
    public List<Classattendance> selectClassatd(Classattendance classattendance);
    /*
    根据班级查询出班级最近一次的点名
     */
    public Classattendance selectnewClassatd(Classattendance classattendance);
}
