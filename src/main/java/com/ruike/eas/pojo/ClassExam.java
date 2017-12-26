package com.ruike.eas.pojo;

import com.ruike.eas.util.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
public class ClassExam {

  private Integer ce_Id;
  private String ce_Name;
  private Integer class_Id;
  private Date ce_Examday;
  private String ce_Remarks;
  private Integer se_Id;
  private Integer ce_State = 0;
  private Date ce_Createdate;


  public Integer getCe_Id() {
    return ce_Id;
  }

  public void setCe_Id(Integer ce_Id) {
    this.ce_Id = ce_Id;
  }


  public String getCe_Name() {
    return ce_Name;
  }

  public void setCe_Name(String ce_Name) {
    this.ce_Name = ce_Name;
  }


  public Integer getClass_Id() {
    return class_Id;
  }

  public void setClass_Id(Integer class_Id) {
    this.class_Id = class_Id;
  }


  public Date getCe_Examday() {
    return ce_Examday;
  }
  public String getCe_Eday() {
    return this.ce_Examday!=null?DateUtil.dateFormat(this.getCe_Examday(),"yyyy-MM-dd"):"";
  }
  public void setCe_Examday(Date ce_Examday) {
    this.ce_Examday = ce_Examday;
  }


  public String getCe_Remarks() {
    return ce_Remarks;
  }

  public void setCe_Remarks(String ce_Remarks) {
    this.ce_Remarks = ce_Remarks;
  }


  public Integer getSe_Id() {
    return se_Id;
  }

  public void setSe_Id(Integer se_Id) {
    this.se_Id = se_Id;
  }


  public Integer getCe_State() {
    return ce_State;
  }

  public void setCe_State(Integer ce_State) {
    this.ce_State = ce_State;
  }


  public Date getCe_Createdate() {
    return ce_Createdate;
  }

  public void setCe_Createdate(Date ce_Createdate) {
    this.ce_Createdate = ce_Createdate;
  }

  //班级名
  private String class_name;

  public String getClass_name() {
    return class_name;
  }

  public void setClass_name(String class_name) {
    this.class_name = class_name;
  }

  //校级考试名称
  private String se_name;

  public String getSe_name() {
    return se_name;
  }

  public void setSe_name(String se_name) {
    this.se_name = se_name;
  }

  //结束时间
  private Date stopDate;

  public Date getStopDate() {
    return stopDate;
  }

  public void setStopDate(Date stopDate) {
    this.stopDate = stopDate;
  }

  //考试类型
  private Integer se_Examtype;

  public Integer getSe_Examtype() {
    return se_Examtype;
  }

  public void setSe_Examtype(Integer se_Examtype) {
    this.se_Examtype = se_Examtype;
  }
}
