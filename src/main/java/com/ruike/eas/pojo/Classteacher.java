package com.ruike.eas.pojo;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Classteacher {
  private Integer ct_id;
  private Integer class_id;
  private Integer teacher_id;
  private Integer status;
  private String remarks;
  private Date ct_startday;
  private Date ct_stopday;
  private Integer ct_type;
private String classname;

  public String getClassname() {
    return classname;
  }

  public void setClassname(String classname) {
    this.classname = classname;
  }

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

  public Integer getCt_type() {
    return ct_type;
  }

  public void setCt_type(Integer ct_type) {
    this.ct_type = ct_type;
  }

  public void setCt_stopday(Date ct_stopday) {
    this.ct_stopday = ct_stopday;
  }



  private Teacher teacher;//老师实体类
  public Teacher getTeacher() {
    return teacher;
  }

  public void setTeacher(Teacher teacher) {
    this.teacher = teacher;
  }

  private Class classes;//班级实体类
  public Class getClasses() {
    return classes;
  }

  public void setClasses(Class classes) {
    this.classes = classes;
  }

  public String getCt_startdays(){
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String format = sdf.format(this.getCt_startday());
    return format;
  }
  public String getCt_stopdays(){
    if (this.getCt_stopday()!= null){
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      return sdf.format(this.getCt_stopday());
    }
    return null;
  }
}
