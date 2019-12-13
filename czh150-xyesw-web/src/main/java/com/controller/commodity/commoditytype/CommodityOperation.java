package com.controller.commodity.commoditytype;

import com.entity.commodity.Commodity;
import com.entity.commodity.CommodityImg;
import com.entity.commodity.Commtype;
import com.entity.user.Userinfo;
import com.github.pagehelper.PageInfo;
import com.service.commodity.commoditytype.CommTypesService;
import com.service.commodity.commodityinfo.CommodityService;
import com.service.users.userinfo.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

//关于商品
@Controller
public class CommodityOperation {

    @Autowired
    private CommodityService commodityService;
    @Autowired
    private CommTypesService commTypesService;
    @Autowired
    private UserInfoService userInfoService;

    //按名称查询商品
    @RequestMapping("/getCommodityName")
    public String getCommodityName(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "16") int pageSize,
            String commname, Model model) {
        //指定商品信息
        List<Commodity> commodityName = commodityService.getCommodityName(pageNum, pageSize, commname);
        PageInfo pageInfo = new PageInfo(commodityName);
        model.addAttribute("commodity", pageInfo);
        model.addAttribute("name", commname);
        return "commodity/commodityinfo/selectCommodityName";
    }

    //查询商品详情
    @RequestMapping("/commodityDetails")
    public String commodityDetails(int commid, Model model) {
        //商品信息
        Commodity commodity = commodityService.getCommodity(commid);
        //商品图片
        List<CommodityImg> commodityImg = commodityService.getCommodityImg(commid);
        //用户信息
        int userid = commodity.getUserid();
        Userinfo info = userInfoService.getInfo(userid);

        model.addAttribute("commodityImg", commodityImg);
        model.addAttribute("commodity", commodity);
        model.addAttribute("userinfo", info);
        return "commodity/commodityinfo/commodityDetails";
    }

    //按类型查找商品
    @RequestMapping("/commType")
    public String commType(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "16") int pageSize,
            int typesid, Model model) {
        List<Commtype> commsType = commTypesService.getCommsType(typesid);
        if (commsType.size() > 0) {
            List<Commodity> commodityList = null;
            for (Commtype commtype : commsType) {
                commodityList = commodityService.getCommTypeAll(pageNum, pageSize, commtype.getCommid());
            }
            PageInfo pageInfo = new PageInfo(commodityList);
            model.addAttribute("commstype", pageInfo);
            model.addAttribute("typesid", typesid);
        } else {
            model.addAttribute("commstype", "");
        }
        return "commdoityAsynch/commTypes";
    }


}

