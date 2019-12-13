package com.entity.user;

import lombok.Data;

import java.util.Date;

//用户评论表
@Data
public class Comment {
    private Integer commentid;//评论编号
    private Integer userid;//用户编号
    private Integer commid;//商品编号
    private String commtext;//评论内容
    private Date commdate;//评论时间
}
