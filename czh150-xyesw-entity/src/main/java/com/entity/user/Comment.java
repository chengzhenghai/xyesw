package com.entity.user;

import lombok.Data;

import java.util.Date;
import java.util.List;

//用户评论表
@Data
public class Comment {
    private Integer commentid;//评论编号
    private Integer userid;//用户编号
    private Integer commid;//商品编号
    private String commtext;//评论内容
    private Date commdate;//评论时间
    private String username;//用户信息
    private String userimg;

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getCommid() {
        return commid;
    }

    public void setCommid(Integer commid) {
        this.commid = commid;
    }

    public String getCommtext() {
        return commtext;
    }

    public void setCommtext(String commtext) {
        this.commtext = commtext;
    }

    public Date getCommdate() {
        return commdate;
    }

    public void setCommdate(Date commdate) {
        this.commdate = commdate;
    }

}
