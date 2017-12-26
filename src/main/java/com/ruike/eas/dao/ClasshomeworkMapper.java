package com.ruike.eas.dao;

import com.ruike.eas.pojo.Classattendance;
import com.ruike.eas.pojo.Classhomework;

public interface ClasshomeworkMapper {
    /*
      根据班级查询出班级最近一次的点名
       */
    public Classhomework selectnewClasswork(Classhomework classhomework);
    /*
    新增班级班级作业
     */
    public Integer insertclasshomework(Classhomework classhomework);
}
