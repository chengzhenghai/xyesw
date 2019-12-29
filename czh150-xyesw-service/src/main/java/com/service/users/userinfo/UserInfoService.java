package com.service.users.userinfo;

import com.entity.user.Userinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserInfoService {
    //查询用户信息
    Userinfo getInfo(int userid);

    //修改用户信息
    void updateInfo(Userinfo userinfo);

    //修改用户头像
    void updateUserImg(String userimg, int userid);

    //修改密码
    void updateUserPaasword(int userid, String userpass);

    //修改用户收件地址
    void updateShojian(int userid, String usershojian);

    //修改用户发件地址
    void updateFajian(int userid, String userfajian);

}

