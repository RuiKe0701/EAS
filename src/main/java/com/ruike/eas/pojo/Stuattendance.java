package com.ruike.eas.pojo;

import com.ruike.eas.util.DateUtil;

import java.io.Serializable;
import java.util.Date;

public class Stuattendance implements Serializable{
    /*
    学员出勤次数
 */
    private Integer attendancetime;

    public Integer getAttendancetime() {
        return attendancetime;
    }

    public void setAttendancetime(Integer attendancetime) {
        this.attendancetime = attendancetime;
    }

    /*
    学生出勤记录表主键
     */
    private Integer sad_id;
    /*
    学生编号，外键学生id
     */
    private Integer stu_id;
    /*
   评分选项及处理
     */
    private Integer ss_id;
    /*
    新增出勤记录日期

     */
    private Date sad_recorddate;
    /*
    班级出勤表主键，
     */
    private Integer cad_id;
    /*
    班级主键
     */
    private Integer fen;
    private Integer caozuo;
    private String ssname;
    /*
    学生名称
     */
    private String stuname;
    private String cadname;

    public String getCadname() {
        return cadname;
    }

    public void setCadname(String cadname) {
        this.cadname = cadname;
    }

    public Integer getClassattendancetime() {
        return classattendancetime;
    }

    public void setClassattendancetime(Integer classattendancetime) {
        this.classattendancetime = classattendancetime;
    }


    private Integer classattendancetime;
    /*
    班级名称
     */
    private String classname;

    /*
    学生出勤率
     */
    private Integer attendancerate;

    public Integer getAttendancerate() {
       if(attendancetime!=null&&classattendancetime!=null){
           double a=(((double) attendancetime)/((double) classattendancetime))*100;
           return (int)a;
       }else {
           return 1;}

    }



    public String getClassname() {
        return classname;
    }
    public void setClassname(String classname) {
        this.classname = classname;
    }
    public String getStuname() {
        return stuname;
    }
    public void setStuname(String stuname) {
        this.stuname = stuname;
    }
    public Integer getFen() {
        return fen;
    }
    public void setFen(Integer fen) {
        this.fen = fen;
    }
    public Integer getCaozuo() {
        return caozuo;
    }
    public void setCaozuo(Integer caozuo) {
        this.caozuo = caozuo;
    }
    public String getSsname() {
        return ssname;
    }
    public void setSsname(String ssname) {
        this.ssname = ssname;
    }

    private Integer class_id;

    public Integer getClass_id() {
        return class_id;
    }

    public void setClass_id(Integer class_id) {
        this.class_id = class_id;
    }

    public Integer getSad_id() {
        return sad_id;
    }

    public void setSad_id(Integer sad_id) {
        this.sad_id = sad_id;
    }

    public Integer getStu_id() {
        return stu_id;
    }

    public void setStu_id(Integer stu_id) {
        this.stu_id = stu_id;
    }

    public Integer getSs_id() {
        return ss_id;
    }

    public void setSs_id(Integer ss_id) {
        this.ss_id = ss_id;
    }

    public Date getSad_recorddate() {
        return sad_recorddate;
    }
    public String getSad_recorddates() {
        return   this.getSad_recorddate()!=null ? DateUtil.dateFormat(this.getSad_recorddate(),"yyyy-MM-dd"):"";
    }

    public void setSad_recorddate(Date sad_recorddate) {
        this.sad_recorddate = sad_recorddate;
    }

    public Integer getCad_id() {
        return cad_id;
    }

    public void setCad_id(Integer cad_id) {
        this.cad_id = cad_id;
    }



}
