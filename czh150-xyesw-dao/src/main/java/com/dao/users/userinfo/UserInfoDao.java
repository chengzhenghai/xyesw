package com.dao.users.userinfo;

import com.entity.user.Userinfo;

import java.util.List;

//用户信息
public interface UserInfoDao {

    //查询单个用户信息
    Userinfo getInfo(int userid);

    //修改用户信息
    void updateInfo(Userinfo userinfo);

    //修改用户头像
    void updateUserImg(String userimg, int userid);
}
