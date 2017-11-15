package pojo;

import java.util.Date;

public class Class {
  private Integer class_id;
  private String class_name;
  private Date class_startday;
  private Date class_stopday;

  private Integer grade_id;
  public Integer getClass_id() {
    return class_id;
  }

  public void setClass_id(Integer class_id) {
    this.class_id = class_id;
  }

  public String getClass_name() {
    return class_name;
  }

  public void setClass_name(String class_name) {
    this.class_name = class_name;
  }

  public Date getClass_startday() {
    return class_startday;
  }

  public void setClass_startday(Date class_startday) {
    this.class_startday = class_startday;
  }

  public Date getClass_stopday() {
    return class_stopday;
  }

  public void setClass_stopday(Date class_stopday) {
    this.class_stopday = class_stopday;
  }

  public Integer getGrade_id() {
    return grade_id;
  }

  public void setGrade_id(Integer grade_id) {
    this.grade_id = grade_id;
  }
}
