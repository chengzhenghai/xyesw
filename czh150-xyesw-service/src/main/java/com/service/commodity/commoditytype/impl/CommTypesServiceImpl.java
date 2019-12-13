package com.service.commodity.commoditytype.impl;

import com.dao.commodity.commoditytype.CommTypesDao;
import com.entity.commodity.Commtype;
import com.entity.commodity.Types;
import com.service.commodity.commoditytype.CommTypesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommTypesServiceImpl implements CommTypesService {
    @Autowired
    private CommTypesDao dao;

    //查询所有商品分类
    @Override
    public List<Types> getCommTypesAll() {
        return dao.getCommTypesAll();
    }

    //按类型查询商品id
    @Override
    public List<Commtype> getCommsType(int typesid) {
        return dao.getCommsType(typesid);
    }

    //添加商品时给商品添加类型
    @Override
    public void insertCommtype(int commid, int typesid) {
        dao.insertCommtype(commid, typesid);
    }

    //最新添加的商品id
    @Override
    public int commTypeId() {
        return dao.commTypeId();
    }

    //删除分类
    @Override
    public void deleteCommtype(int commid) {
        dao.deleteCommtype(commid);
    }

    //修改商品的分类
    @Override
    public void updateCommtype(int typesid, int commid) {
        dao.updateCommtype(typesid, commid);
    }

    //查询某个商品分类id
    @Override
    public int commTypeid(int commid) {
        return dao.commTypeid(commid);
    }

    //通过分类id查询分类
    @Override
    public Types types(int typesid) {
        return dao.types(typesid);
    }


}
