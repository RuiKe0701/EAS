package com.ruike.eas.pojo;

/**
 * 老师表
 */
public class Teacher {
  private Integer th_id; //主键，自增
  private String th_name; //名字
  private Integer th_type; //老师类型

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
