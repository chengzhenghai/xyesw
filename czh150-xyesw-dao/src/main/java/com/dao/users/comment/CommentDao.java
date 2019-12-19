package com.dao.users.comment;

import com.entity.user.Comment;
import com.entity.user.Userinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentDao {
    //查询商品所有评论
    List<Comment> getCommentAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize, @Param("commid") int commid);
    //添加评论
    void insertComment(Comment comment);
    //删除评论
    void deleteComment(int commid);

}
