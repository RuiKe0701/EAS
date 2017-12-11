package com.ruike.eas.pojo;

import com.ruike.eas.util.DateUtil;
import com.ruike.eas.util.Page;

import java.util.Date;


public class SchoolExam extends Page{

  private Integer se_Id;
  private String se_Name;
  private Date se_Startday;
  private Date se_Stopday;
  private Date se_Createdate;
  private Integer se_Examtype;
  private Integer se_State;
  private Integer se_Createby;
  private Integer class_id;

  public Integer getClass_id() {
    return class_id;
  }

  public void setClass_id(Integer class_id) {
    this.class_id = class_id;
  }

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
  public String getSe_Startdays() {
    return this.getSe_Startday() != null ? DateUtil.dateFormat(this.getSe_Startday(),"yyyy-MM-dd") : "";
  }
  public void setSe_Startday(Date se_Startday) {
    this.se_Startday = se_Startday;
  }
  public void setSe_Startds(String se_Startday) {
    if (se_Startday != null && se_Startday.length() > 0){
      this.se_Startday = DateUtil.dateFormat(se_Startday,"yyyy-MM-dd");
    }
  }


  public Date getSe_Stopday() {
    return se_Stopday;
  }
  public String getSe_Stopdays() {
    return this.getSe_Stopday() != null ? DateUtil.dateFormat(this.getSe_Stopday(),"yyyy-MM-dd") : "";
  }
  public void setSe_Stopday(Date se_Stopday) {
    this.se_Stopday = se_Stopday;
  }
  public void setSe_Stopds(String se_Stopday) {
    if (se_Stopday != null && se_Stopday.length() > 0) {
      this.se_Stopday = DateUtil.dateFormat(se_Stopday,"yyyy-MM-dd");
    }
  }



  public Date getSe_Createdate() {
    return se_Createdate;
  }
  public String getSe_Createdates() {
    return this.getSe_Createdate() != null ? DateUtil.dateFormat(this.getSe_Createdate(),"yyyy-MM-dd"): "";
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

  public Integer getSe_Createby() {
    return se_Createby;
  }

  public void setSe_Createby(Integer se_Createby) {
    this.se_Createby = se_Createby;
  }


  //班级名
  private String class_name;

  public String getClass_name() {
    return class_name;
  }

  public void setClass_name(String class_name) {
    this.class_name = class_name;
  }

  //创建人姓名
  private String th_name;

  public String getTh_name() {
    return th_name;
  }

  public void setTh_name(String th_name) {
    this.th_name = th_name;
  }

  //用于单个判定考试是否已经结束
  private Date disDate;

  public Date getDisDate() {
    return disDate;
  }

  public void setDisDate(Date disDate) {
    this.disDate = disDate;
  }
}
