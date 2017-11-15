package pojo;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Student implements Serializable{
    private Integer studentid;
    private Integer studentno;
    private String studentname;
    private Integer sex;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JSONField(format="yyyy/MM/dd")
    private Date birthday;
    private String phone;
    private String address;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JSONField(format="yyyy/MM/dd")
    private Date startday;
    private String homephone;
    private String carded;
    private String education;
    private Integer marriage;

    public Integer getStudentid() {
        return studentid;
    }

    public void setStudentid(Integer studentid) {
        this.studentid = studentid;
    }

    public Integer getStudentno() {
        return studentno;
    }

    public void setStudentno(Integer studentno) {
        this.studentno = studentno;
    }

    public String getStudentname() {
        return studentname;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday =new java.sql.Date(birthday.getTime());
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getStartday() {
        return startday;
    }

    public void setStartday(Date startday) {
        this.startday = new java.sql.Date(startday.getTime());
    }

    public String getHomephone() {
        return homephone;
    }

    public void setHomephone(String homephone) {
        this.homephone = homephone;
    }

    public String getCarded() {
        return carded;
    }

    public void setCarded(String carded) {
        this.carded = carded;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public Integer getMarriage() {
        return marriage;
    }

    public void setMarriage(Integer marriage) {
        this.marriage = marriage;
    }
}
