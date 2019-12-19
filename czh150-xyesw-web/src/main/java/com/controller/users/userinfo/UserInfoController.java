package com.controller.users.userinfo;

import com.entity.user.Userinfo;
import com.entity.user.Users;
import com.service.users.userinfo.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

//用户信息
@Controller
public class UserInfoController {
    //上传用户头像路径
    public static final String FILE_USER = "/static/user-img";
    //uuid
    public static String uuid = UUID.randomUUID().toString();

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
    public String updateInfoImg(MultipartFile userimg, int userid) {
        String filename = userimg.getOriginalFilename();
        String path = FILE_USER + File.separator + uuid + filename;
        File file = new File(path);
        try {
            userimg.transferTo(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        userInfoService.updateUserImg(path, userid);
        return "redirect:userInfo";
    }


}

