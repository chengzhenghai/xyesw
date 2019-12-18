package com.controller.admins.admincomm;

import com.entity.commodity.Commodity;
import com.entity.user.Comment;
import com.github.pagehelper.PageInfo;
import com.service.admins.admincomm.AdminCommService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminCommodityController {
    @Autowired
    private AdminCommService adminCommService;

    //查询所有商品+用户信息
    @RequestMapping("/commodityList")
    public String commodityList(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
            Model model) {
        List<Commodity> commodityList = adminCommService.commodityList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(commodityList);
        model.addAttribute("commList", pageInfo);
        return "admins/commodityadmin/commodityList";
    }

    //查询所有商品评论
    @RequestMapping("/commentList")
    public String commentList(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
            Model model) {
        List<Comment> comments = adminCommService.commentList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(comments);
        model.addAttribute("entList", pageInfo);
        return "admins/commodityadmin/commentList";
    }


}
