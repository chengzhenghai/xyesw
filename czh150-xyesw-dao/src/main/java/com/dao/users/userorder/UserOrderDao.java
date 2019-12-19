package com.dao.users.userorder;

import com.entity.order.Commorder;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

//用户订单
public interface UserOrderDao {

    //查询用户所有订单
    List<Commorder> getCommOrderAll(@Param("userid") int userid, @Param("orderstate") String orderstate);

    //查询用户所有出售中的商品
    List<Commorder> getCommAll(@Param("userid") int userid, @Param("orderstate") String orderstate);

    //修改订单状态
    void updateOrderstate(Commorder commorder);

    //删除订单
    void deleteOrder(String orderid);

    //添加订单
    void insertOrder(Commorder commorder);

}
