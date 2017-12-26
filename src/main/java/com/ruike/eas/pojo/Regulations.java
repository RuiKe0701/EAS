package com.ruike.eas.pojo;

import com.ruike.eas.util.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
//规章
public class Regulations {
    private Integer ras_id;
    private String ras_name;
    private Integer ras_fraction;
    private Integer ras_way;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date ras_createday;
    private Integer ras_createby;
    private Integer rast_id;
    private String restname;
    private Integer tiao;
    private String thname;

    public String getThname() {
        return thname;
    }

    public void setThname(String thname) {
        this.thname = thname;
    }

    public Integer getTiao() {
        return tiao;
    }

    public void setTiao(Integer tiao) {
        this.tiao = tiao;
    }

    public String getRestname() {
        return restname;
    }

    public void setRestname(String restname) {
        this.restname = restname;
    }

    public Integer getRas_id() {
        return ras_id;
    }

    public void setRas_id(Integer ras_id) {
        this.ras_id = ras_id;
    }

    public String getRas_name() {
        return ras_name;
    }

    public void setRas_name(String ras_name) {
        this.ras_name = ras_name;
    }

    public Integer getRas_fraction() {
        return ras_fraction;
    }

    public void setRas_fraction(Integer ras_fraction) {
        this.ras_fraction = ras_fraction;
    }

    public Integer getRas_way() {
        return ras_way;
    }

    public void setRas_way(Integer ras_way) {
        this.ras_way = ras_way;
    }

    public Date getRas_createday() {
        return ras_createday;
    }

    public void setRas_createday(Date ras_createday) {
        this.ras_createday = ras_createday;
    }
    public String getRas_createdays() {
        return this.getRas_createday() != null ? DateUtil.dateFormat(this.getRas_createday(),"yyyy-MM-dd") : "";
    }
    public Integer getRas_createby() {
        return ras_createby;
    }

    public void setRas_createby(Integer ras_createby) {
        this.ras_createby = ras_createby;
    }

    public Integer getRast_id() {
        return rast_id;
    }

    public void setRast_id(Integer rast_id) {
        this.rast_id = rast_id;
    }
}
