package com.ruike.eas.service.impl;

import com.ruike.eas.dao.ClassattendanceMapper;
import com.ruike.eas.dao.ScoringstandardMapper;
import com.ruike.eas.dao.StuattendanceMapper;
import com.ruike.eas.dao.StutotalscoreMapper;
import com.ruike.eas.pojo.Classattendance;
import com.ruike.eas.pojo.Scoringstandard;
import com.ruike.eas.pojo.Stuattendance;
import com.ruike.eas.pojo.Stutotalscore;
import com.ruike.eas.service.AttendanceRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("attendanceRecordService")
public class AttendanceRecordServiceimpl implements AttendanceRecordService{
    @Autowired
    private ClassattendanceMapper classattendanceMapper;
    @Autowired
    private StuattendanceMapper stuattendanceMapper;
    @Autowired
    private StutotalscoreMapper stutotalscoreMapper;


    public Integer addatdrecord(List<Stuattendance> stuattendances, List<Stutotalscore> stutotalscores, Classattendance classattendance) {
        Integer classatd=classattendanceMapper.insertClassatd(classattendance);
        if(classatd>0){
            Integer cadid=classattendance.getCad_id();
            System.out.println(cadid);
            for (Stuattendance stuattendance : stuattendances) {
                stuattendance.setCad_id(cadid);
                stuattendance.setSad_recorddate(new Date());
            }
            Integer ss=stuattendanceMapper.insertStuatds(stuattendances);
            Integer aa=stutotalscoreMapper.updatestusts(stutotalscores);
            if(ss>0&&aa>0){
                return 1;
            }else{
                return 0;
            }
        }else{
            return 0;
        }
    }
}
