package com.dao.users.enter;

import com.entity.user.Administrato;
import com.entity.user.Users;

//用户登入
public interface UsersDao {
    //用户登入
    Users getUsers(Users users);
    //管理员登入
    Administrato getAdmins(Administrato administrato);
}
