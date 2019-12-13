package com.service.commodity.commodityinfo.impl;

import com.dao.commodity.commodityinfo.CommodityDao;
import com.entity.commodity.Commodity;
import com.entity.commodity.CommodityImg;
import com.service.commodity.commodityinfo.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommodityServiceImpl implements CommodityService {

    @Autowired
    private CommodityDao dao;

    //查询所有商品
    @Override
    public List<Commodity> getCommodityAll(int pageNum, int pageSize) {
        return dao.getCommodityAll(pageNum, pageSize);
    }

    //查询商品详情
    @Override
    public Commodity getCommodity(int commid) {
        return dao.getCommodity(commid);
    }

    @Override
    public List<Commodity> getCommTypeAll(int pageNum, int pageSize, int commid) {
        return dao.getCommTypeAll(pageNum, pageSize, commid);
    }

    //根据商品名查询
    @Override
    public List<Commodity> getCommodityName(int pageNum, int pageSize, String commname) {
        return dao.getCommodityName(pageNum, pageSize, commname);
    }

    //商品图片
    @Override
    public List<CommodityImg> getCommodityImg(int commid) {
        return dao.getCommodityImg(commid);
    }

}
