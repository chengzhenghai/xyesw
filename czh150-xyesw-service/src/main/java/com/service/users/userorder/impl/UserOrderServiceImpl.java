package com.service.users.userorder.impl;

import com.dao.users.userorder.UserOrderDao;
import com.service.users.userorder.UserOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserOrderServiceImpl implements UserOrderService {
    @Autowired
    private UserOrderDao dao;


}
