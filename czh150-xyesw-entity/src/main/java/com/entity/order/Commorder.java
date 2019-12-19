package com.entity.order;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

//订单表
@Data
public class Commorder {
    private String orderid;//订单编号
    private Date orderdate;//订单时间
    private Integer userid;//购买商品用户编号
    private Integer userids;//卖出商品用户编号
    private Integer commid;//商品编号
    private BigDecimal ordertotal;//订单总价
    private String orderstate;//订单状态
    private String username;//用户信息
    private String commname;//商品信息

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getUserids() {
        return userids;
    }

    public void setUserids(Integer userids) {
        this.userids = userids;
    }

    public String getOrderstate() {
        return orderstate;
    }

    public void setOrderstate(String orderstate) {
        this.orderstate = orderstate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCommname() {
        return commname;
    }

    public void setCommname(String commname) {
        this.commname = commname;
    }

    public Integer getCommid() {
        return commid;
    }

    public void setCommid(Integer commid) {
        this.commid = commid;
    }

    public BigDecimal getOrdertotal() {
        return ordertotal;
    }

    public void setOrdertotal(BigDecimal ordertotal) {
        this.ordertotal = ordertotal;
    }

}
