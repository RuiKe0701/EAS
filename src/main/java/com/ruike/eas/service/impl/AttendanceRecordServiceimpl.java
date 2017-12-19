package com.ruike.eas.service.impl;

import com.ruike.eas.dao.*;
import com.ruike.eas.pojo.*;
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
    @Autowired
    private ClassteacherMapper classteacherMapper;
    @Autowired
    private LeaveMapper leaveMapper;

    public Integer addatdrecord(List<Stuattendance> stuattendances, List<Stutotalscore> stutotalscores, Classattendance classattendance,List<Stuleave> stuleaveList) {
        Integer classatd=classattendanceMapper.insertClassatd(classattendance);
        if(classatd>0){
            Integer cadid=classattendance.getCad_id();
            Date date=classattendance.getCad_date();
            System.out.println(cadid);
            for (Stuattendance stuattendance : stuattendances) {
                stuattendance.setCad_id(cadid);
                stuattendance.setSad_recorddate(date);
            }
            Integer bb=0;
            if(stuleaveList!=null&&stuleaveList.size()>0){
                for (Stuleave stuleave : stuleaveList) {
                    stuleave.setStuleave_day(date);
                }
                bb=leaveMapper.insertleave(stuleaveList);
            }else{
                bb=1;
            }
            Integer ss=stuattendanceMapper.insertStuatds(stuattendances);
            Integer aa=stutotalscoreMapper.updatestusts(stutotalscores);
            if(ss>0&&aa>0&&bb>0){
                return 1;
            }else{
                return 0;
            }
        }else{
            return 0;
        }
    }

    public List<Classteacher> classteacherlist(Classteacher classteacher) {
        return classteacherMapper.selectclassbytecaherid(classteacher);
    }

    public List<Classattendance> selectClassttend(Classattendance classattendance) {
        return classattendanceMapper.selectClassatdbyclassatd(classattendance);
    }

    public List<Stuattendance> selectstuatdlist(Stuattendance stuattendance) {
        return stuattendanceMapper.stuattendancesbystuatd(stuattendance);
    }
    public List<Classteacher> selectoldclassbytecaherid(Classteacher classteacher) {
        return classteacherMapper.selectoldclassbytecaherid(classteacher);
    }
}
