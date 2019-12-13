package com.entity.commodity;

import lombok.Data;

import java.util.List;

//商品图片表
@Data
public class CommodityImg {
    private Integer commimg;//编号
    private Integer commid;//商品编号
    private String commimgpath;//图片路径

    public Integer getCommimg() {
        return commimg;
    }

    public void setCommimg(Integer commimg) {
        this.commimg = commimg;
    }

    public Integer getCommid() {
        return commid;
    }

    public void setCommid(Integer commid) {
        this.commid = commid;
    }

    public String getCommimgpath() {
        return commimgpath;
    }

    public void setCommimgpath(String commimgpath) {
        this.commimgpath = commimgpath;
    }

}
