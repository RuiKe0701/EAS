package com.ruike.eas.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Scoringstandard implements Serializable{
    private Integer ss_id;
    private String ss_name;
    private Integer ss_fraction;
    private Integer ss_way;
    private Integer ss_createby;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ss_createdate;
    private Integer ss_type;
    private String teachername;

    public Integer getSs_fraction() {
        return ss_fraction;
    }

    public void setSs_fraction(Integer ss_fraction) {
        this.ss_fraction = ss_fraction;
    }



    public String getTeachername() {
        return teachername;
    }

    public void setTeachername(String teachername) {
        this.teachername = teachername;
    }

    public Integer getSs_type() {
        return ss_type;
    }

    public void setSs_type(Integer ss_type) {
        this.ss_type = ss_type;
    }



    public Integer getSs_id() {
        return ss_id;
    }

    public void setSs_id(Integer ss_id) {
        this.ss_id = ss_id;
    }

    public String getSs_name() {
        return ss_name;
    }

    public void setSs_name(String ss_name) {
        this.ss_name = ss_name;
    }

    public Integer getSs_way() {
        return ss_way;
    }

    public void setSs_way(Integer ss_way) {
        this.ss_way = ss_way;
    }

    public Integer getSs_createby() {
        return ss_createby;
    }

    public void setSs_createby(Integer ss_createby) {
        this.ss_createby = ss_createby;
    }

    public Date getSs_createdate() {
        return ss_createdate;
    }

    public void setSs_createdate(Date ss_createdate) {
        this.ss_createdate = new java.sql.Date(ss_createdate.getTime());
    }
}
