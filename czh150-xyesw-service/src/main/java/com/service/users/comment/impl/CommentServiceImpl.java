package com.service.users.comment.impl;

import com.dao.users.comment.CommentDao;
import com.entity.user.Comment;
import com.service.users.comment.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao dao;

    //查询商品所有评论
    @Override
    public List<Comment> getCommentAll(int pageNum, int pageSize, int commid) {
        return dao.getCommentAll(pageNum, pageSize, commid);
    }

    @Override
    public void insertComment(Comment comment) {
        dao.insertComment(comment);
    }
}
