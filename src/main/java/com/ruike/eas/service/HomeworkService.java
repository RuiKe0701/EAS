package com.ruike.eas.service;

import com.ruike.eas.pojo.Classhomework;
import com.ruike.eas.pojo.Stuhomework;

import java.util.Date;
import java.util.List;

public interface HomeworkService {
    /*
  根据班级查询出班级最近一次的点名
   */
    public Classhomework selectnewClasswork(Classhomework classhomework);

    //新增作业
    public Integer addHomeworks(Classhomework classhomework, List<Stuhomework> stuhomeworkList, Date date);
}
