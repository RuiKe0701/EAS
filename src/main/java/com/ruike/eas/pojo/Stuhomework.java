package com.ruike.eas.pojo;

import java.util.Date;

public class Stuhomework {
    //家庭作业
    private Integer work_id;
    private String work_name;
    private Integer ras_id;
    private Date work_date;
    private Integer stu_id;
    private Integer class_id;
    private Integer zongfen;
    private Integer stsid;
    private Integer chw_id;
    private String stuname;
    private String classname;
    private Integer caozuo;
    private Integer fen;
    private String rasname;

    public String getRasname() {
        return rasname;
    }

    public void setRasname(String rasname) {
        this.rasname = rasname;
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

    public Integer getChw_id() {
        return chw_id;
    }

    public void setChw_id(Integer chw_id) {
        this.chw_id = chw_id;
    }

    public Integer getStsid() {
        return stsid;
    }

    public void setStsid(Integer stsid) {
        this.stsid = stsid;
    }

    public Integer getZongfen() {
        return zongfen;
    }

    public void setZongfen(Integer zongfen) {
        this.zongfen = zongfen;
    }

    public Integer getWork_id() {
        return work_id;
    }

    public void setWork_id(Integer work_id) {
        this.work_id = work_id;
    }

    public String getWork_name() {
        return work_name;
    }

    public void setWork_name(String work_name) {
        this.work_name = work_name;
    }

    public Integer getRas_id() {
        return ras_id;
    }

    public void setRas_id(Integer ras_id) {
        this.ras_id = ras_id;
    }

    public Date getWork_date() {
        return work_date;
    }

    public void setWork_date(Date work_date) {
        this.work_date = work_date;
    }

    public Integer getStu_id() {
        return stu_id;
    }

    public void setStu_id(Integer stu_id) {
        this.stu_id = stu_id;
    }

    public Integer getClass_id() {
        return class_id;
    }

    public void setClass_id(Integer class_id) {
        this.class_id = class_id;
    }

}
