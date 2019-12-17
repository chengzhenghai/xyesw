package com.service.users.userinfo.impl;

import com.dao.users.userinfo.UserInfoDao;
import com.entity.user.Userinfo;
import com.service.users.userinfo.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoDao dao;

    //查询用户信息
    @Override
    public Userinfo getInfo(int userid) {
        return dao.getInfo(userid);
    }

    //修改用户信息
    @Override
    public void updateInfo(Userinfo userinfo) {
        dao.updateInfo(userinfo);
    }

    //修改用户头像
    @Override
    public void updateUserImg(String userimg, int userid) {
        dao.updateUserImg(userimg, userid);
    }


}
