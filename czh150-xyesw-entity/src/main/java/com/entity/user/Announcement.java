package com.entity.user;

import lombok.Data;

import java.util.Date;

//管理员发布公告表
@Data
public class Announcement {
    private Integer onticeid;//公告编号
    private String onticetext;//公告内容
    private String onticeimg;//公告图片
    private Date onticedate;//公告时间

    public Integer getOnticeid() {
        return onticeid;
    }

    public void setOnticeid(Integer onticeid) {
        this.onticeid = onticeid;
    }

    public String getOnticetext() {
        return onticetext;
    }

    public void setOnticetext(String onticetext) {
        this.onticetext = onticetext;
    }

    public String getOnticeimg() {
        return onticeimg;
    }

    public void setOnticeimg(String onticeimg) {
        this.onticeimg = onticeimg;
    }

    public Date getOnticedate() {
        return onticedate;
    }

    public void setOnticedate(Date onticedate) {
        this.onticedate = onticedate;
    }
}
