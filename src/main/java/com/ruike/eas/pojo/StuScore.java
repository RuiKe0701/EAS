package com.ruike.eas.pojo;

import com.ruike.eas.util.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class StuScore {

  private Integer stuc_Id;
  private Integer ce_Id;
  private Integer stu_Id;
  private Double stuc_Wtscores;
  private Double stuc_Ctscores;
  private Double stuc_Avgscores;
  private Integer stuc_State = 0;
  private Date stuc_Createdate;


  public Integer getStuc_Id() {
    return stuc_Id;
  }

  public void setStuc_Id(Integer stuc_Id) {
    this.stuc_Id = stuc_Id;
  }


  public Integer getCe_Id() {
    return ce_Id;
  }

  public void setCe_Id(Integer ce_Id) {
    this.ce_Id = ce_Id;
  }


  public Integer getStu_Id() {
    return stu_Id;
  }

  public void setStu_Id(Integer stu_Id) {
    this.stu_Id = stu_Id;
  }


  public Double getStuc_Wtscores() {
    return stuc_Wtscores;
  }

  public void setStuc_Wtscores(Double stuc_Wtscores) {
    this.stuc_Wtscores = stuc_Wtscores;
  }


  public Double getStuc_Ctscores() {
    return stuc_Ctscores;
  }

  public void setStuc_Ctscores(Double stuc_Ctscores) {
    this.stuc_Ctscores = stuc_Ctscores;
  }


  public Double getStuc_Avgscores() {
    return stuc_Avgscores;
  }

  public void setStuc_Avgscores(Double stuc_Avgscores) {
    this.stuc_Avgscores = stuc_Avgscores;
  }


  public Integer getStuc_State() {
    return stuc_State;
  }

  public void setStuc_State(Integer stuc_State) {
    this.stuc_State = stuc_State;
  }


  public Date getStuc_Createdate() {
    return stuc_Createdate;
  }

  public void setStuc_Createdate(Date stuc_Createdate) {
    this.stuc_Createdate = stuc_Createdate;
  }

  //学号
  private String stu_no;

  public String getStu_no() {
    return stu_no;
  }

  public void setStu_no(String stu_no) {
    this.stu_no = stu_no;
  }

  //学生id
  private Integer stu_id;
  //学生姓名
  private String stu_name;
  //参加考试日期
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date ce_Examday;

  //班级id
  private Integer class_id;
  //班级名
  private String class_name;

  //开始名称
  private String ce_Name;

  //学生年级id
  private Integer gread_id;

  public String getCe_Name() {
    return ce_Name;
  }

  public void setCe_Name(String ce_Name) {
    this.ce_Name = ce_Name;
  }

  public Integer getGread_id() {
    return gread_id;
  }

  public void setGread_id(Integer gread_id) {
    this.gread_id = gread_id;
  }

  public Date getCe_Examday() {
    return ce_Examday;
  }
  public String getCe_Examdays() {
    return this.ce_Examday!=null ? DateUtil.dateFormat(this.ce_Examday,"yyyy-MM-dd") :"";
  }
  public void setCe_Examday(Date ce_Examday) {
    this.ce_Examday = ce_Examday;
  }

  public String getStu_name() {
    return stu_name;
  }

  public void setStu_name(String stu_name) {
    this.stu_name = stu_name;
  }

  public String getClass_name() {
    return class_name;
  }

  public void setClass_name(String class_name) {
    this.class_name = class_name;
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
