package com.ruike.eas.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Stu {
  private Integer stu_id;
  private String stu_name;
  private String stu_no;
  private Integer stu_sex;
  private Date stu_birthday;
  private String stu_phone;
  private String stu_address;
  @DateTimeFormat(pattern="yyyy-MM-dd")
  private Date stu_startday;
  private String stu_parentphone;
  private String stu_carde;
  private String stu_education;
  private String stu_email;
  private Integer stu_state;
  private Integer status;
  @DateTimeFormat(pattern="yyyy-MM-dd")
  private Date crateday;
  private Integer class_id;
  

  public Integer getStu_id() {
    return stu_id;
  }

  public void setStu_id(Integer stu_id) {
    this.stu_id = stu_id;
  }

  public String getStu_name() {
    return stu_name;
  }

  public void setStu_name(String stu_name) {
    this.stu_name = stu_name;
  }

  public String getStu_no() {
    return stu_no;
  }

  public void setStu_no(String stu_no) {
    this.stu_no = stu_no;
  }

  public Integer getStu_sex() {
    return stu_sex;
  }

  public void setStu_sex(Integer stu_sex) {
    this.stu_sex = stu_sex;
  }

  public Date getStu_birthday() {
    return stu_birthday;
  }

  public void setStu_birthday(Date stu_birthday) {
    this.stu_birthday = new java.sql.Date(stu_birthday.getTime());
  }

  public String getStu_phone() {
    return stu_phone;
  }

  public void setStu_phone(String stu_phone) {
    this.stu_phone = stu_phone;
  }

  public String getStu_address() {
    return stu_address;
  }

  public void setStu_address(String stu_address) {
    this.stu_address = stu_address;
  }

  public Date getStu_startday() {
    return stu_startday;
  }

  public void setStu_startday(Date stu_startday) {
    this.stu_startday =new java.sql.Date(stu_startday.getTime());
  }

  public String getStu_parentphone() {
    return stu_parentphone;
  }

  public void setStu_parentphone(String stu_parentphone) {
    this.stu_parentphone = stu_parentphone;
  }

  public String getStu_carde() {
    return stu_carde;
  }

  public void setStu_carde(String stu_carde) {
    this.stu_carde = stu_carde;
  }

  public String getStu_education() {
    return stu_education;
  }

  public void setStu_education(String stu_education) {
    this.stu_education = stu_education;
  }

  public String getStu_email() {
    return stu_email;
  }

  public void setStu_email(String stu_email) {
    this.stu_email = stu_email;
  }

  public Integer getStu_state() {
    return stu_state;
  }

  public void setStu_state(Integer stu_state) {
    this.stu_state = stu_state;
  }

  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

  public Date getCrateday() {
    return crateday;
  }

  public void setCrateday(Date crateday) {
    this.crateday = crateday;
  }

  public Integer getClass_id() {
    return class_id;
  }

  public void setClass_id(Integer class_id) {
    this.class_id = class_id;
  }
}
