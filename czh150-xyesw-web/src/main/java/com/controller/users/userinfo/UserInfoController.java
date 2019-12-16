package com.controller.users.userinfo;

import com.entity.user.Userinfo;
import com.entity.user.Users;
import com.service.users.userinfo.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

//用户信息
@Controller
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;

    //查询用户信息
    @RequestMapping("/userInfo")
    public String userInfo(HttpSession session, Model model) {
        Users users = (Users) session.getAttribute("users");
        Userinfo info = userInfoService.getInfo(users.getUserid());
        model.addAttribute("info", info);
        return "users/userinfo/userInfo";
    }

    //修改用户信息
    @RequestMapping("/updateInfo")
    public String updateInfo(Userinfo userinfo) {
        userInfoService.updateInfo(userinfo);
        return "redirect:userInfo";
    }

    //修改用户头像
    @RequestMapping("/updateInfoImg")
    public String updateInfoImg(String userimg, int userid) {
        userInfoService.updateUserImg(userimg, userid);
        return "redirect:userInfo";
    }


}

