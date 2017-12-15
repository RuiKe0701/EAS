package com.ruike.eas.pojo;

import java.util.Date;


public class ClassScore {

  private Integer cs_Id;
  private Integer ce_Id;
  private Double cs_Wtavg;
  private Double cs_Ctavg;
  private Double cs_Avg;
  private Integer cs_State;
  private Date cs_Createdate;


  public Integer getCs_Id() {
    return cs_Id;
  }

  public void setCs_Id(Integer cs_Id) {
    this.cs_Id = cs_Id;
  }


  public Integer getCe_Id() {
    return ce_Id;
  }

  public void setCe_Id(Integer ce_Id) {
    this.ce_Id = ce_Id;
  }


  public Double getCs_Wtavg() {
    return cs_Wtavg;
  }

  public void setCs_Wtavg(Double cs_Wtavg) {
    this.cs_Wtavg = cs_Wtavg;
  }


  public Double getCs_Ctavg() {
    return cs_Ctavg;
  }

  public void setCs_Ctavg(Double cs_Ctavg) {
    this.cs_Ctavg = cs_Ctavg;
  }


  public Double getCs_Avg() {
    return cs_Avg;
  }

  public void setCs_Avg(Double cs_Avg) {
    this.cs_Avg = cs_Avg;
  }


  public Integer getCs_State() {
    return cs_State;
  }

  public void setCs_State(Integer cs_State) {
    this.cs_State = cs_State;
  }


  public Date getCs_Createdate() {
    return cs_Createdate;
  }

  public void setCs_Createdate(Date cs_Createdate) {
    this.cs_Createdate = cs_Createdate;
  }

  //班级id
  private Integer class_id;

  //班级名
  private String class_name;

  //班级考试名称
  private String ce_name;

  public String getClass_name() {
    return class_name;
  }

  public void setClass_name(String class_name) {
    this.class_name = class_name;
  }

  public Integer getClass_id() {
    return class_id;
  }

  public void setClass_id(Integer class_id) {
    this.class_id = class_id;
  }

  public String getCe_name() {
    return ce_name;
  }

  public void setCe_name(String ce_name) {
    this.ce_name = ce_name;
  }
}
