package com.ruike.eas.pojo;

public class Thlogin {
    private Integer thl_id;
    private Integer th_id;
    private String thl_number;
    private String thl_password;
    private Integer ty_id;

    public Integer getThl_id() {
        return thl_id;
    }

    public void setThl_id(Integer thl_id) {
        this.thl_id = thl_id;
    }

    public Integer getTh_id() {
        return th_id;
    }

    public void setTh_id(Integer th_id) {
        this.th_id = th_id;
    }

    public String getThl_number() {
        return thl_number;
    }

    public void setThl_number(String thl_number) {
        this.thl_number = thl_number;
    }

    public String getThl_password() {
        return thl_password;
    }

    public void setThl_password(String thl_password) {
        this.thl_password = thl_password;
    }

    public Integer getTy_id() {
        return ty_id;
    }

    public void setTy_id(Integer ty_id) {
        this.ty_id = ty_id;
    }

    //老师对象
    private Teacher teacher;
    //职位名称
    private String ty_name;
    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getTy_name() {
        return ty_name;
    }

    public void setTy_name(String ty_name) {
        this.ty_name = ty_name;
    }
}
