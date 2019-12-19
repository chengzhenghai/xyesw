package com.service.users.userstore.impl;

import com.dao.users.userstore.UserStoreDao;
import com.entity.commodity.Commodity;
import com.entity.commodity.CommodityImg;
import com.service.users.userstore.UserStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserStoreServiceImpl implements UserStoreService {
    @Autowired
    private UserStoreDao dao;

    //查询所有我的商品
    @Override
    public List<Commodity> getMyCommodity(int pageNum, int pageSize, int userid) {
        return dao.getMyCommodity(pageNum, pageSize, userid);
    }

    //删除商品图片
    @Override

    public void deleteCommodityImg(int commimg) {
        dao.deleteCommodityImg(commimg);
    }

    //修改商品图片
    @Override
    public void updateCommodityImg(String commimgpath, int commimg) {
        dao.updateCommodityImg(commimgpath, commimg);
    }

    //删除商品
    @Override
    public void deleteMyComm(int commid) {
        dao.deleteMyComm(commid);
    }

    //添加商品
    @Override
    public void insertMyComm(Commodity commodity) {
        dao.insertMyComm(commodity);
    }

    //修改商品
    @Override
    public void updateMyComm(Commodity commodity) {
        dao.updateMyComm(commodity);
    }

    //删除商品图片
    @Override
    public void insertCommImg(CommodityImg commodityImg) {
        dao.insertCommImg(commodityImg);
    }

}
