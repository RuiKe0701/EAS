package com.ruike.eas.service;

import com.ruike.eas.pojo.*;

import java.util.List;

public interface AttendanceRecordService {
    public Integer addatdrecord(List<Stuattendance> stuattendances, List<Stutotalscore> stutotalscores, Classattendance classattendance,List<Stuleave> stuleaveList);
    //根据老师id 获取老师所带班级的名字
    public List<Classteacher> classteacherlist(Classteacher classteacher);
    //根据班级id查询班级考勤情况
    public List<Classattendance> selectClassttend(Classattendance classattendance);
    //根据班级考勤id查详情
    public List<Stuattendance> selectstuatdlist(Stuattendance stuattendance);
    //根据老师id获取老师历史带的班级
    public List<Classteacher> selectoldclassbytecaherid(Classteacher classteacher);
       /*
    查询默认的主任年级查看班级出勤率
     */
       public List<Classattendance> selectclassstdBygrade(Classattendance classattendance);
}
