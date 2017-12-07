package com.ruike.eas.pojo;

import java.util.Date;


public class SchoolExam {

  private Integer se_Id;
  private String se_Name;
  private Date se_Startday;
  private Date se_Stopday;
  private Date se_Createdate;
  private Integer se_Examtype;
  private Integer se_State;
  private Integer se_Ecreateby;


  public Integer getSe_Id() {
    return se_Id;
  }

  public void setSe_Id(Integer se_Id) {
    this.se_Id = se_Id;
  }


  public String getSe_Name() {
    return se_Name;
  }

  public void setSe_Name(String se_Name) {
    this.se_Name = se_Name;
  }


  public Date getSe_Startday() {
    return se_Startday;
  }

  public void setSe_Startday(Date se_Startday) {
    this.se_Startday = se_Startday;
  }


  public Date getSe_Stopday() {
    return se_Stopday;
  }

  public void setSe_Stopday(Date se_Stopday) {
    this.se_Stopday = se_Stopday;
  }


  public Date getSe_Createdate() {
    return se_Createdate;
  }

  public void setSe_Createdate(Date se_Createdate) {
    this.se_Createdate = se_Createdate;
  }


  public Integer getSe_Examtype() {
    return se_Examtype;
  }

  public void setSe_Examtype(Integer se_Examtype) {
    this.se_Examtype = se_Examtype;
  }


  public Integer getSe_State() {
    return se_State;
  }

  public void setSe_State(Integer se_State) {
    this.se_State = se_State;
  }


  public Integer getSe_Ecreateby() {
    return se_Ecreateby;
  }

  public void setSe_Ecreateby(Integer se_Ecreateby) {
    this.se_Ecreateby = se_Ecreateby;
  }

}
