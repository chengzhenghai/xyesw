package com.service.users.enter.impl;

import com.dao.users.enter.UsersDao;
import com.entity.user.Administrato;
import com.entity.user.Users;
import com.service.users.enter.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersDao dao;

    //登入查询用户判断
    @Override
    public Users getUsers(Users users) {
        return dao.getUsers(users);
    }
    //登入查询用户判断
    @Override
    public Administrato getAdmins(Administrato administrato) {
        return dao.getAdmins(administrato);
    }


}
