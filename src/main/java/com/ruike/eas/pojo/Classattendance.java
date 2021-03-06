package com.ruike.eas.pojo;

import java.io.Serializable;
import java.util.Date;

public class Classattendance implements Serializable {
    /*
    班级出勤率主键
     */
    private Integer cad_id;
    /*
    班级点名次数
     */
    private Integer cad_number;
    /*
    班级点名出勤率
     */
    private String cad_rate;
    /*班级点名名字
     */
    private String cad_name;
    /*班级点名日期
     */
    private Date cad_date;
    /*班级班级点名班级id 外键
     */
    private Integer class_id;


    public Integer getCad_id() {
        return cad_id;
    }

    public void setCad_id(Integer cad_id) {
        this.cad_id = cad_id;
    }

    public Integer getCad_number() {
        return cad_number;
    }

    public void setCad_number(Integer cad_number) {
        this.cad_number = cad_number;
    }

    public String getCad_rate() {
        return cad_rate;
    }

    public void setCad_rate(String cad_rate) {
        this.cad_rate = cad_rate;
    }

    public String getCad_name() {
        return cad_name;
    }

    public void setCad_name(String cad_name) {
        this.cad_name = cad_name;
    }

    public Date getCad_date() {
        return cad_date;
    }

    public void setCad_date(Date cad_date) {
        this.cad_date = cad_date;
    }

    public Integer getClass_id() {
        return class_id;
    }

    public void setClass_id(Integer class_id) {
        this.class_id = class_id;
    }


}
