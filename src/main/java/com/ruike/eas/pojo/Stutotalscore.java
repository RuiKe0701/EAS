package com.ruike.eas.pojo;

import sun.rmi.server.InactiveGroupException;

import java.io.Serializable;

public class Stutotalscore implements Serializable {

    /*
        学生总分表主键
         */
    private Integer sts_id;
    /*
    学生表主键
     */
    private Integer stu_id;
    /*
    学生综合分数
     */
    private Integer stu_totalscore;
    /*
    学生姓名
     */
    private String stuname;
    /*
    学生性别
     */
    private Integer sex;
    /*
    学生学号
     */
    private String stuno;

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getStuno() {
        return stuno;
    }

    public void setStuno(String stuno) {
        this.stuno = stuno;
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname;
    }

    public Integer getSts_id() {
        return sts_id;
    }

    public void setSts_id(Integer sts_id) {
        this.sts_id = sts_id;
    }

    public Integer getStu_id() {
        return stu_id;
    }

    public void setStu_id(Integer stu_id) {
        this.stu_id = stu_id;
    }

    public Integer getStu_totalscore() {
        return stu_totalscore;
    }

    public void setStu_totalscore(Integer stu_totalscore) {
        this.stu_totalscore = stu_totalscore;
    }

    public Integer getClass_id() {
        return class_id;
    }

    public void setClass_id(Integer class_id) {
        this.class_id = class_id;
    }

    /*
        学生班级主键

         */
    private Integer class_id;
}
