package com.service.users.comment;

import com.entity.user.Comment;

import java.util.List;

public interface CommentService {
    //查询商品所有评论
    List<Comment> getCommentAll(int pageNum, int pageSize, int commid);

    //添加评论
    void insertComment(Comment comment);
}
