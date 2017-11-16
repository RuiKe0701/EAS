package com.ruike.eas.pojo;

import java.util.Date;

public class Classteacher {
  private Integer ct_id;
  private Integer class_id;
  private Integer teacher_id;
  private Integer status;
  private String remarks;
  private Date ct_startday;
  private Date ct_stopday;
  private Long ct_type;

  public Integer getCt_id() {
    return ct_id;
  }

  public void setCt_id(Integer ct_id) {
    this.ct_id = ct_id;
  }

  public Integer getClass_id() {
    return class_id;
  }

  public void setClass_id(Integer class_id) {
    this.class_id = class_id;
  }

  public Integer getTeacher_id() {
    return teacher_id;
  }

  public void setTeacher_id(Integer teacher_id) {
    this.teacher_id = teacher_id;
  }

  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

  public String getRemarks() {
    return remarks;
  }

  public void setRemarks(String remarks) {
    this.remarks = remarks;
  }

  public Date getCt_startday() {
    return ct_startday;
  }

  public void setCt_startday(Date ct_startday) {
    this.ct_startday = ct_startday;
  }

  public Date getCt_stopday() {
    return ct_stopday;
  }

  public void setCt_stopday(Date ct_stopday) {
    this.ct_stopday = ct_stopday;
  }

  public Long getCt_type() {
    return ct_type;
  }

  public void setCt_type(Long ct_type) {
    this.ct_type = ct_type;
  }
}
