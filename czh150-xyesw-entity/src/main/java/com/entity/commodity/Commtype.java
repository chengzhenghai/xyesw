package com.entity.commodity;

import lombok.Data;

//商品类型表
@Data
public class Commtype {
    private Integer commtypeid;//商品类型子表编号
    private Integer commid;//商品编号

    public Integer getTypesid() {
        return typesid;
    }

    public void setTypesid(Integer typesid) {
        this.typesid = typesid;
    }

    private Integer typesid;//商品类型

    public Integer getCommtypeid() {
        return commtypeid;
    }

    public void setCommtypeid(Integer commtypeid) {
        this.commtypeid = commtypeid;
    }

    public Integer getCommid() {
        return commid;
    }

    public void setCommid(Integer commid) {
        this.commid = commid;
    }


}
