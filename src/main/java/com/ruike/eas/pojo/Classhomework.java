package com.ruike.eas.pojo;

import com.ruike.eas.util.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Classhomework {
    //班级作业
    private Integer chw_id;
    private String chw_name;
    private Integer chw_number;
    private Date chw_caddate;
    private Integer chw_classid;
    private String chw_rate;
    private String classname;
    private Integer tiao;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date stopdate;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date startdate;
    public Date getStartdate() {
        return startdate;
    }
    public void setStartdate(String  startdate) {
        this.startdate =  startdate != null ? DateUtil.dateFormat(startdate,"yyyy-MM-dd") : null;
    }
    public void setStopdate(String  stopdate) {
        this.stopdate =  stopdate != null ? DateUtil.dateFormat(stopdate,"yyyy-MM-dd") : null;
    }
    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getStopdate() {
        return stopdate;
    }

    public void setStopdate(Date stopdate) {
        this.stopdate = stopdate;
    }




    public Integer getTiao() {
        return tiao;
    }

    public void setTiao(Integer tiao) {
        this.tiao = tiao;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public Integer getChw_id() {
        return chw_id;
    }

    public void setChw_id(Integer chw_id) {
        this.chw_id = chw_id;
    }

    public String getChw_name() {
        return chw_name;
    }

    public void setChw_name(String chw_name) {
        this.chw_name = chw_name;
    }

    public Integer getChw_number() {
        return chw_number;
    }

    public void setChw_number(Integer chw_number) {
        this.chw_number = chw_number;
    }

    public Date getChw_caddate() {
        return chw_caddate;
    }
    public String getChw_caddates() {
        return this.getChw_caddate() != null ? DateUtil.dateFormat(this.getChw_caddate(),"yyyy-MM-dd") : "";
    }
    public void setChw_caddates(String  cad_dates) {
        this.chw_caddate = DateUtil.dateFormat(cad_dates,"yyyy-MM-dd");
    }
    public void setChw_caddate(Date chw_caddate) {
        this.chw_caddate = chw_caddate;
    }

    public Integer getChw_classid() {
        return chw_classid;
    }

    public void setChw_classid(Integer chw_classid) {
        this.chw_classid = chw_classid;
    }

    public String getChw_rate() {
        return chw_rate;
    }

    public void setChw_rate(String chw_rate) {
        this.chw_rate = chw_rate;
    }
}
