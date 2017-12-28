package com.ruike.eas.pojo;

import com.ruike.eas.util.DateUtil;

import java.util.Date;

public class Teacher {
  private Integer th_id;
  private String th_name;
  private Integer th_type;
  private Integer th_status;
  private Date th_entrydate;
  private Integer status;

  public Date getTh_entrydate() {
    return th_entrydate;
  }
  public String getTh_entrydates() {
    return this.getTh_entrydate()!=null? DateUtil.dateFormat(this.getTh_entrydate(),"yyyy-MM-dd"):"";
  }

  public void setTh_entrydate(Date th_entrydate) {
    this.th_entrydate = th_entrydate;
  }

  public Integer getTh_status() {
    return th_status;
  }

  public void setTh_status(Integer th_status) {
    this.th_status = th_status;
  }

  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

  public Integer getTh_id() {
    return th_id;
  }

  public void setTh_id(Integer th_id) {
    this.th_id = th_id;
  }

  public String getTh_name() {
    return th_name;
  }

  public void setTh_name(String th_name) {
    this.th_name = th_name;
  }

  public Integer getTh_type() {
    return th_type;
  }

  public void setTh_type(Integer th_type) {
    this.th_type = th_type;
  }
}
