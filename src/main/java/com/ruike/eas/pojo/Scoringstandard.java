package com.ruike.eas.pojo;

import java.io.Serializable;
import java.util.Date;

public class Scoringstandard implements Serializable{
    private Integer ss_id;
    private String ss_name;
    private Integer ss_way;
    private Integer ss_createby;
    private Date ss_createdate;

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
        this.ss_createdate = ss_createdate;
    }
}
