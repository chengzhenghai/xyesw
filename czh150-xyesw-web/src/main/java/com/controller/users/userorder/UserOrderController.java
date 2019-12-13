package com.controller.users.userorder;

import com.entity.user.Users;
import com.service.users.userorder.UserOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

//用户订单
@Controller
public class UserOrderController {
    @Autowired
    private UserOrderService userOrderService;

    //我的订单
    @RequestMapping("/userOrder")
    public String userOrder(HttpSession session, Model model) {
        Users users = (Users) session.getAttribute("users");

        return "users/userorder/userOrder";
    }

}
