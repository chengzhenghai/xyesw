package com.controller.users.enter;

import com.entity.user.Administrato;
import com.entity.user.Users;
import com.service.users.enter.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

//登入登出
@Controller
public class UsersController {
    @Autowired
    private UsersService usersService;

    //用户登入界面
    @RequestMapping("/xyesw")
    public String enterUser() {
        return "users/enter/enterUser";
    }

    //管理员登入界面
    @RequestMapping("/xyesws")
    public String enterAdmin() {
        return "users/enter/enterAdmin";
    }

    //用户登入判断
    @RequestMapping("/enterUser")
    public String enterUser(@Valid Users user, BindingResult bindingResult, HttpSession session, Model model) {
        if (bindingResult.hasErrors()) {
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError error : fieldErrors) {
                model.addAttribute(error.getField(), error.getDefaultMessage());
            }
        } else {
            Users users = usersService.getUsers(user);
            if (users == null) {
                model.addAttribute("error", "用户账号或密码错误！");
            } else if ("封禁".equals(users.getUserstate())) {
                model.addAttribute("error", "改账号已封禁！");
            } else {
                session.setAttribute("users", users);
                return "redirect:homepage";
            }
        }
        return "users/enter/enterUser";
    }

    //用户退出登入
    @RequestMapping("exitUser")
    public String exitUser(HttpSession session) {
        session.removeAttribute("users");
        return "users/enter/enterUser";
    }

    //管理员登入判断
    @RequestMapping("/enterAdmin")
    public String enterAdmin(@Valid Administrato admin, BindingResult bindingResult, HttpSession session, Model model) {
        if (bindingResult.hasErrors()) {
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError error : fieldErrors) {
                model.addAttribute(error.getField(), error.getDefaultMessage());
            }
        } else {
            Administrato administrato = usersService.getAdmins(admin);
            if (administrato == null) {
                model.addAttribute("error", "管理员账号或密码错误！");
            } else {
                session.setAttribute("admin", administrato);
                return "redirect:homepageAdmin";
            }
        }
        return "users/enter/enterAdmin";
    }

    //管理员登入，跳转到管理页面
    @RequestMapping("/homepageAdmin")
    public String homepageAdmin() {
        return "admins/homepageAdmin";
    }

    //管理员退出登入
    @RequestMapping("exitAdmin")
    public String exitAdmin(HttpSession session) {
        session.removeAttribute("admin");
        return "users/enter/enterAdmin";
    }

}
