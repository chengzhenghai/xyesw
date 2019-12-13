package com.dao.users.userinfo;

import com.entity.user.Userinfo;

import java.util.List;

//用户信息
public interface UserInfoDao {

    //查询单个用户信息
    Userinfo getInfo(int userid);

    //查询所有用户信息
    List<Userinfo> getInfoAll();

}
