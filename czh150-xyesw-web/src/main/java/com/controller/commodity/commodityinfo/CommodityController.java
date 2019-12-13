package com.controller.commodity.commodityinfo;

import com.entity.commodity.Commodity;
import com.entity.commodity.CommodityImg;
import com.entity.commodity.Types;
import com.entity.user.Userinfo;
import com.entity.user.Users;
import com.github.pagehelper.PageInfo;
import com.service.commodity.commoditytype.CommTypesService;
import com.service.commodity.commodityinfo.CommodityService;
import com.service.users.userinfo.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

//商品相关，页面跳转相关
@Controller
public class CommodityController {

    @Autowired
    private CommodityService commodityService;

    @Autowired
    private CommTypesService commTypesService;

    @Autowired
    private UserInfoService userInfoService;

    //用户登入，查询所有商品，并跳转到主页
    @RequestMapping("/homepage")
    public String commodityAll(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "16") int pageSize,
            Model model, HttpSession session) {
        //判断用户是否登入
        Users users = (Users) session.getAttribute("users");
        if (users == null) {
            return "users/enter/enterUser";
        }
        //所有商品
        List<Commodity> commodityAll = commodityService.getCommodityAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(commodityAll);
        model.addAttribute("commall", pageInfo);
        //所有类型
        List<Types> commTypesAll = commTypesService.getCommTypesAll();
        model.addAttribute("typeall", commTypesAll);
        //登入用户信息
        Userinfo info = userInfoService.getInfo(users.getUserid());
        session.setAttribute("userinfo", info);
        //跳转到主页
        return "commodity/commodityhome/homepageUser";
    }

    //跳转到添加商品界面添加商品
    @RequestMapping("/insertComm")
    public String insertComm(Model model) {
        List<Types> commTypesAll = commTypesService.getCommTypesAll();
        model.addAttribute("commtype", commTypesAll);
        return "users/userstore/insertCommodity";
    }

    //跳转到修改商品界面修改商品
    @RequestMapping("/updateComm")
    public String updateComm(int commid, Model model) {
        //商品信息
        Commodity commodity = commodityService.getCommodity(commid);
        model.addAttribute("comm", commodity);
        //商品类型
        int typeid = commTypesService.commTypeid(commid);
        Types types = commTypesService.types(typeid);
        model.addAttribute("type", types);
        //所有商品类型
        List<Types> commTypesAll = commTypesService.getCommTypesAll();
        model.addAttribute("commtypes", commTypesAll);
        return "users/userstore/updateCommodity";
    }

    //跳转到商品图片界面
    @RequestMapping("/commImgs")
    public String insertCommImg(int commid, Model model, HttpSession session) {
        List<CommodityImg> commodityImg = commodityService.getCommodityImg(commid);
        model.addAttribute("commImgs", commodityImg);
        model.addAttribute("commid", commid);
        model.addAttribute("commimgpath", session.getAttribute("commimgpath"));
        return "users/userstore/commodityImgs";
    }

    //跳转到我联系商家界面
    @RequestMapping("/userRelation")
    public String userRelation(int commid, int userid, Model model) {
        //商品信息
        Commodity commodity = commodityService.getCommodity(commid);
        //商家信息
        Userinfo info = userInfoService.getInfo(userid);

        model.addAttribute("commodity", commodity);
        model.addAttribute("userinfo", info);
        return "users/usershopping/userRelation";
    }


}
