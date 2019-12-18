package com.dao.admins.admincomm;

import com.entity.commodity.Commodity;
import com.entity.user.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminCommDao {
    //查询所有商品+用户信息
    List<Commodity> commodityList(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    //查询所有商品评论
    List<Comment> commentList(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

}
