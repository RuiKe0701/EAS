package com.ruike.eas.pojo;

import java.util.Date;

public class Classhomework {
    //班级作业
    private Integer chw_id;
    private String chw_name;
    private Integer chw_number;
    private Date chw_caddate;
    private Integer chw_classid;
    private String chw_rate;

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
