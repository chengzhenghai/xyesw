package com.entity.order;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

//订单表
@Data
public class Order {
    private String orderid;//订单编号
    private Date orderdate;//订单时间
    private Integer userid;//购买商品用户编号
    private Integer userids;//卖出商品用户编号
    private Integer commid;//商品编号
    private BigDecimal ordertotal;//订单总价
}
