package com.ruike.eas.service;

import com.ruike.eas.pojo.Classstu;
import com.ruike.eas.pojo.Stuattendance;

import java.util.List;

public interface StuattendanceService {
    /*
    根据班级id获取班级全体学生出勤情况
     */
    public List<Stuattendance> selectsatdbyclassid(Stuattendance stuattendance);
    /*
 根据班级id获取班级学生
  */
    public List<Classstu> selectClassstubyclassid(Classstu classstu);
}
