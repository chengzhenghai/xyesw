package com.dao.users.userinfo;

import com.entity.user.Userinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//用户信息
public interface UserInfoDao {

    //查询单个用户信息
    Userinfo getInfo(int userid);

    //修改用户信息
    void updateInfo(Userinfo userinfo);

    //修改用户头像
    void updateUserImg(@Param("userimg") String userimg,@Param("userid") int userid);

    //修改密码
    void updateUserPaasword(@Param("userid")int userid, @Param("userpass")String userpass);

    //修改用户收件地址
    void updateShojian(@Param("userid")int userid, @Param("usershojian")String usershojian);

    //修改用户发件地址
    void updateFajian(@Param("userid")int userid, @Param("userfajian")String userfajian);


}
