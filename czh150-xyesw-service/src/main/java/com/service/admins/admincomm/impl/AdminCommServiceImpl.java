package com.service.admins.admincomm.impl;

import com.dao.admins.admincomm.AdminCommDao;
import com.entity.commodity.Commodity;
import com.entity.user.Comment;
import com.service.admins.admincomm.AdminCommService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminCommServiceImpl implements AdminCommService {
    @Autowired
    private AdminCommDao dao;
    //查询所有商品+用户信息
    @Override
    public List<Commodity> commodityList(int pageNum, int pageSize) {
        return dao.commodityList(pageNum, pageSize);
    }

    @Override
    public List<Comment> commentList(int pageNum, int pageSize) {
        return dao.commentList(pageNum, pageSize);
    }


}
