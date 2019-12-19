package com.service.users.userorder;

import com.entity.order.Commorder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserOrderService {

    //查询用户所有订单
    List<Commorder> getCommOrderAll(int userid, String orderstate);

    //查询用户所有出售中的商品
    List<Commorder> getCommAll(int userid, String orderstate);

    //修改订单状态
    void updateOrderstate(Commorder commorder);

    //删除订单
    void deleteOrder(String orderid);

    //添加订单
    void insertOrder(Commorder commorder);
}
