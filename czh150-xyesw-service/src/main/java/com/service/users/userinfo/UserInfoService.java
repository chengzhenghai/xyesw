package com.service.users.userinfo;

import com.entity.user.Userinfo;

import java.util.List;

public interface UserInfoService {
    //查询用户信息
    Userinfo getInfo(int userid);
    //查询所有用户信息
    List<Userinfo> getInfoAll();
    //修改用户信息
    void updateInfo(Userinfo userinfo);
    //修改用户头像
    void updateUserImg(String userimg, int userid);
}

