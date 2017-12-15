package com.ruike.eas.pojo;

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

  private String stu_no;

  public String getStu_no() {
    return stu_no;
  }

  public void setStu_no(String stu_no) {
    this.stu_no = stu_no;
  }
}
