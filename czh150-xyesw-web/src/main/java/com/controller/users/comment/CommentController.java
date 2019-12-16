package com.controller.users.comment;

import com.entity.user.Comment;
import com.service.users.comment.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

    //添加评论
    @RequestMapping("/insertComment")
    public String insertComment(Comment comment) {
        comment.setCommdate(new Date());
        commentService.insertComment(comment);
        return "redirect:commodityDetails?commid="+comment.getCommid();
    }



}
