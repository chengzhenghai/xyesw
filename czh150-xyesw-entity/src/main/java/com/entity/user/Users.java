package com.entity.user;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

//用户表
@Data
public class Users {
    private Integer userid;//用户编号
    @NotNull(message = "账号不能为空")
    @Size(max = 20, min = 6, message = "账号必须大于等于6位，小于等于20位")
    private String useraccount;//用户账号
    @NotNull(message = "密码不能为空")
    @Size(max = 20, min = 6, message = "密码必须大于等于6位，小于等于20位")
    private String userpass;//用户密码
    private String userstate;//用户状态

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
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
