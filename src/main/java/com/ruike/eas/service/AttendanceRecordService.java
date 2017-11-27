package com.ruike.eas.service;

import com.ruike.eas.pojo.Classattendance;
import com.ruike.eas.pojo.Scoringstandard;
import com.ruike.eas.pojo.Stuattendance;
import com.ruike.eas.pojo.Stutotalscore;

import java.util.List;

public interface AttendanceRecordService {
    public Integer addatdrecord(List<Stuattendance> stuattendances, List<Stutotalscore> stutotalscores, Classattendance classattendance);
}
