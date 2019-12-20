package com.service.users.userorder;

import com.entity.order.Commorder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserOrderService {

    //查询用户所有订单
    List<Commorder> getCommOrderAll(int userid, String orderstate);

    //查询有多少条订单
    int orders(int userid, String orderstate);

    //查询用户所有出售中的商品
    List<Commorder> getCommAll(int userid, String orderstate);

    //查询用户买出多少条订单
    int ordersComm(@Param("userid") int userid, @Param("orderstate") String orderstate);

    //修改订单状态
    void updateOrderstate(Commorder commorder);

    //删除订单
    void deleteOrder(String orderid);

    //添加订单
    void insertOrder(Commorder commorder);

    //通过商品id查询订单状态
    int orderState(int commid, String orderstate);

    //通过商品id删除订单
    void deleteCommOrder(int commid);
}
