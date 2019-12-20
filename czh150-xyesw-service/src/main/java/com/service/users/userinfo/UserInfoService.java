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
    void updateUserPaasword(@Param("userid")int userid, @Param("userpass")String userpass);

}

