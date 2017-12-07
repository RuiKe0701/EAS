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

}
