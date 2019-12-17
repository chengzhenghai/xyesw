package com.entity.user;

import lombok.Data;

//用户信息表
@Data
public class Userinfo {
    private Integer userinfoid;//用户信息编号
    private Integer userid;//用户编号
    private String usernumber;//号码
    private String userimg;//用户头像
    private String usershojian;//收件地址
    private String userfajian;//发件地址
    private String username;//用户名称
    private String useraccount;//用户账号
    private String userpass;//用户密码
    private String userstate;//用户状态

    public Integer getUserinfoid() {
        return userinfoid;
    }

    public void setUserinfoid(Integer userinfoid) {
        this.userinfoid = userinfoid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsernumber() {
        return usernumber;
    }

    public void setUsernumber(String usernumber) {
        this.usernumber = usernumber;
    }

    public String getUserimg() {
        return userimg;
    }

    public void setUserimg(String userimg) {
        this.userimg = userimg;
    }

    public String getUsershojian() {
        return usershojian;
    }

    public void setUsershojian(String usershojian) {
        this.usershojian = usershojian;
    }

    public String getUserfajian() {
        return userfajian;
    }

    public void setUserfajian(String userfajian) {
        this.userfajian = userfajian;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUseraccount() {
        return useraccount;
    }

    public void setUseraccount(String useraccount) {
        this.useraccount = useraccount;
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass;
    }

    public String getUserstate() {
        return userstate;
    }

    public void setUserstate(String userstate) {
        this.userstate = userstate;
    }

}
