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

    //修改密码
    @Override
    public void updateUserPaasword(int userid, String userpass) {
        dao.updateUserPaasword(userid, userpass);
    }

    //修改用户收件地址
    @Override
    public void updateShojian(int userid, String usershojian) {
        dao.updateShojian(userid, usershojian);
    }

    //修改用户发件地址
    @Override
    public void updateFajian(int userid, String userfajian) {
        dao.updateFajian(userid, userfajian);
    }


}
