package com.service.users.enter;

import com.entity.user.Administrato;
import com.entity.user.Users;

import java.util.List;

public interface UsersService {
    //登入查询用户判断
    Users getUsers(Users users);
    //登入管理员用户判断
    Administrato getAdmins(Administrato administrato);
}

