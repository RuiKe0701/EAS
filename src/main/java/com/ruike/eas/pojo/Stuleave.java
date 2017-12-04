package com.ruike.eas.pojo;

import com.ruike.eas.util.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Stuleave implements Serializable{
    private String stuname;
    private String classname;
    /*
    学生请假表主键
     */
    private Integer stuleave_id;
    /*
    学生id外键
     */
    private Integer stu_id;
    /*
    班级id外键
     */
    private Integer class_id;
    /*
    请假备注理由
     */
    private String stuleave_remarks;
    /*
    请假状态
     */
    private Integer stuleave_state;

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    /*
        请假日期
         */
    @DateTimeFormat(pattern="yyyy-MM-dd")

    private Date stuleave_day;


    public Integer getStuleave_id() {
        return stuleave_id;
    }

    public void setStuleave_id(Integer stuleave_id) {
        this.stuleave_id = stuleave_id;
    }

    public Integer getStu_id() {
        return stu_id;
    }

    public void setStu_id(Integer stu_id) {
        this.stu_id = stu_id;
    }

    public Integer getClass_id() {
        return class_id;
    }

    public void setClass_id(Integer class_id) {
        this.class_id = class_id;
    }

    public String getStuleave_remarks() {
        return stuleave_remarks;
    }

    public void setStuleave_remarks(String stuleave_remarks) {
        this.stuleave_remarks = stuleave_remarks;
    }

    public Integer getStuleave_state() {
        return stuleave_state;
    }

    public void setStuleave_state(Integer stuleave_state) {
        this.stuleave_state = stuleave_state;
    }

    public Date getStuleave_day() {
        return stuleave_day;
    }
    public String getStuleave_days() {
        return DateUtil.dateFormat(this.stuleave_day,"yyyy-MM-dd");
    }

    public void setStuleave_day(Date stuleave_day) {
        this.stuleave_day = stuleave_day;
    }
    public void setStuleave_days(String stuleave_days) {
        this.stuleave_day = DateUtil.dateFormat(stuleave_days,"yyyy-MM-dd");
    }


}
