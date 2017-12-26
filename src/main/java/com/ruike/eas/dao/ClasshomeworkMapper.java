package com.ruike.eas.dao;

import com.ruike.eas.pojo.Classattendance;
import com.ruike.eas.pojo.Classhomework;

import java.util.List;

public interface ClasshomeworkMapper {
    /*
      根据班级查询出班级最近一次的点名
       */
    public Classhomework selectnewClasswork(Classhomework classhomework);
    /*
      根据条件查作业记录勤情况
       */
    public List<Classhomework> selectClassworkByclasswork(Classhomework classhomework);
    /*
    新增班级班级作业
     */
    public Integer insertclasshomework(Classhomework classhomework);
}
