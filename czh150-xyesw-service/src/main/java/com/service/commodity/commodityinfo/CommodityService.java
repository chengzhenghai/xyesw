package com.service.commodity.commodityinfo;

import com.entity.commodity.Commodity;
import com.entity.commodity.CommodityImg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommodityService {
    //查询所有商品信息
    List<Commodity> getCommodityAll(int pageNum, int pageSize);

    //用类型查询到商品id，在用id查询商品
    List<Commodity> getCommTypeAll(int pageNum, int pageSize, int commid);

    //查询商品详情
    Commodity getCommodity(int commid);

    //按名称查询商品
    List<Commodity> getCommodityName(int pageNum, int pageSize, String commname);

    //查询所有商品图片
    List<CommodityImg> getCommodityImg(int commid);

    //修改商品状态
    void updateCommState(@Param("commid") int commid, @Param("commstate") String commstate);


}

