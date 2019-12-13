package com.entity.user;

import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

//管理员表
@Data
public class Administrato {
    private Integer adminid;//管理员编号
    @NotNull(message = "管理员账号不能为空")
    @Size(max = 20, min = 5, message = "管理员账号必须大于等于5位，小于等于20位")
    private String adminname;//管理员账号
    @NotNull(message = "管理员密码不能为空")
    @Size(max = 20, min = 5, message = "管理员密码必须大于等于5位，小于等于20位")
    private String adminpass;//管理员密码
}
