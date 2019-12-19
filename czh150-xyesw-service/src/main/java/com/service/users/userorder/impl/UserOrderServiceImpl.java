package com.service.users.userorder.impl;

import com.dao.users.userorder.UserOrderDao;
import com.entity.order.Commorder;
import com.service.users.userorder.UserOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserOrderServiceImpl implements UserOrderService {
    @Autowired
    private UserOrderDao dao;

    //查询用户所有订单
    @Override
    public List<Commorder> getCommOrderAll(int userid, String orderstate) {
        return dao.getCommOrderAll(userid, orderstate);
    }
    //查询用户所有出售的商品
    @Override
    public List<Commorder> getCommAll(int userid, String orderstate) {
        return dao.getCommAll(userid, orderstate);
    }
    //修改订单状态
    @Override
    public void updateOrderstate(Commorder commorder) {
        dao.updateOrderstate(commorder);
    }

    //删除订单
    @Override
    public void deleteOrder(String orderid) {
        dao.deleteOrder(orderid);
    }

    //添加订单
    @Override
    public void insertOrder(Commorder commorder) {
        dao.insertOrder(commorder);
    }
}
