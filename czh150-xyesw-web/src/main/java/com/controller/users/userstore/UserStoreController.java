package com.controller.users.userstore;

import com.entity.commodity.Commodity;
import com.entity.commodity.CommodityImg;
import com.entity.user.Userinfo;
import com.entity.user.Users;
import com.github.pagehelper.PageInfo;
import com.service.commodity.commodityinfo.CommodityService;
import com.service.commodity.commoditytype.CommTypesService;
import com.service.users.userinfo.UserInfoService;
import com.service.users.userstore.UserStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

//用户店铺
@Controller
public class UserStoreController {
    //上传图片路径
    public static final String FILE_DIRECTORY = "/static/commodity-img";
    //uuid
    public static String uuid = UUID.randomUUID().toString();

    @Autowired
    private UserStoreService userStoreService;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    private CommTypesService commTypesService;

    //我的店铺
    @RequestMapping("/userStore")
    public String userStore(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
            HttpSession session, Model model) {
        Users users = (Users) session.getAttribute("users");
        List<Commodity> myCommodity = userStoreService.getMyCommodity(pageNum, pageSize, users.getUserid());
        PageInfo pageInfo = new PageInfo(myCommodity);
        model.addAttribute("myComm", pageInfo);
        return "users/userstore/userStore";
    }

    //别人的店铺
    @RequestMapping("/elseUserStores")
    public String elseUserStores(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
            int userid, Model model) {
        //商品信息
        List<Commodity> myCommodity = userStoreService.getMyCommodity(pageNum, pageSize, userid);
        PageInfo pageInfo = new PageInfo(myCommodity);
        //用户信息
        Userinfo info = userInfoService.getInfo(userid);

        model.addAttribute("elseComm", pageInfo);
        model.addAttribute("elseInfo", info);
        return "users/userstore/elseUserStore";
    }

    //添加商品
    @PostMapping("/insertMyComm")
    @Transactional
    public String insertMyComm(Commodity commodity, MultipartFile img, int typesid) {
        String filename = img.getOriginalFilename();
        String path = FILE_DIRECTORY + File.separator + uuid + filename;
        File file = new File(path);
        try {
            img.transferTo(file);
            commodity.setCommimgpath(path);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //添加商品
        userStoreService.insertMyComm(commodity);
        //获取到最新添加的商品id
        int typeCommId = commTypesService.commTypeId();
        //添加商品分类
        commTypesService.insertCommtype(typeCommId, typesid);
        return "redirect:userStore";
    }

    //删除商品
    @RequestMapping("/deleteMyComm")
    @Transactional
    public String deleteMyComm(int commid) {
        //删除商品图片
        userStoreService.deleteCommodityImg(commid);
        //删除商品分类
        commTypesService.deleteCommtype(commid);
        //删除商品
        userStoreService.deleteMyComm(commid);
        return "redirect:userStore";
    }

    //修改商品
    @PostMapping("/updateMyComm")
    @Transactional
    public String updateMyComm(Commodity commodity, MultipartFile img, int typesid) {
        String filename = img.getOriginalFilename();
        String path = FILE_DIRECTORY + File.separator + uuid + filename;
        if ("".equals(filename)) {
            //图片为空则不修改
        } else {
            File file = new File(path);
            try {
                img.transferTo(file);
                commodity.setCommimgpath(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //修改商品
        userStoreService.updateMyComm(commodity);
        //修改类型
        Integer commid = commodity.getCommid();
        commTypesService.updateCommtype(typesid, commid);
        return "redirect:userStore";
    }

    //删除商品图片
    @RequestMapping("/deleteCommImg")
    public String deleteCommImg(int commimg, int commid) {
        userStoreService.deleteCommodityImg(commimg);
        return "redirect:commImgs?commid=" + commid;
    }

    //上传商品图片
    @RequestMapping("/insertCommImg")
    public String insertCommImg(CommodityImg commodityImg, MultipartFile commimgpath, HttpSession session) {
        String filename = commimgpath.getOriginalFilename();
        if ("".equals(filename)) {
            session.setAttribute("commimgpath", "请选择图片！");
        } else {
            String path = FILE_DIRECTORY + File.separator + uuid + filename;
            File files = new File(path);
            try {
                commimgpath.transferTo(files);
                commodityImg.setCommimgpath(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
            session.removeAttribute("commimgpath");
            userStoreService.insertCommImg(commodityImg);
        }
        return "redirect:commImgs?commid=" + commodityImg.getCommid();
    }

    //修改商品图片
    @RequestMapping("/updateCommImg")
    public String updateCommImg(MultipartFile commimgpath, int commimg, int commid, HttpSession session) {
        String filename = commimgpath.getOriginalFilename();
        String path = FILE_DIRECTORY + File.separator + uuid + filename;
        if ("".equals(filename)) {

        } else {
            File file = new File(path);
            try {
                commimgpath.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            userStoreService.updateCommodityImg(path, commimg);
        }
        return "redirect:commImgs?commid=" + commid;
    }

}
