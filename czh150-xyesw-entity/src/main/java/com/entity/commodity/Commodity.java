package com.entity.commodity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

//商品表
@Data
public class Commodity {
    private Integer commid;//商品编号
    private String commname;//商品名称
    private BigDecimal commmoney;//商品价格
    private Integer userid;//商品所有者编号（外键）
    private String commdrief;//商品简介
    private String commimgpath;//商品图片

    public Integer getCommid() {
        return commid;
    }

    public void setCommid(Integer commid) {
        this.commid = commid;
    }

    public String getCommname() {
        return commname;
    }

    public void setCommname(String commname) {
        this.commname = commname;
    }

    public BigDecimal getCommmoney() {
        return commmoney;
    }

    public void setCommmoney(BigDecimal commmoney) {
        this.commmoney = commmoney;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getCommdrief() {
        return commdrief;
    }

    public void setCommdrief(String commdrief) {
        this.commdrief = commdrief;
    }

    public String getCommimgpath() {
        return commimgpath;
    }

    public void setCommimgpath(String commimgpath) {
        this.commimgpath = commimgpath;
    }
}
