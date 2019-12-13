package com.service.users.userstore;

import com.entity.commodity.Commodity;
import com.entity.commodity.CommodityImg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserStoreService {

    //查询所有我的商品
    List<Commodity> getMyCommodity(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize, @Param("userid") int userid);

    //删除商品图片
    void deleteCommodityImg(int commimg);

    //修改商品图片
    void updateCommodityImg(@Param("commimgpath") String commimgpath, @Param("commimg") int commimg);

    //删除商品
    void deleteMyComm(int commid);

    //添加商品
    void insertMyComm(Commodity commodity);

    //修改商品
    void updateMyComm(Commodity commodity);

    //上传商品图片
    void insertCommImg(CommodityImg commodityImg);

}
