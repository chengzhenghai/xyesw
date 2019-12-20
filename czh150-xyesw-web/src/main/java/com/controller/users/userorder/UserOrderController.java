package com.controller.users.userorder;

import com.entity.order.Commorder;
import com.entity.user.Users;
import com.service.commodity.commodityinfo.CommodityService;
import com.service.users.userorder.UserOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

//用户订单
@Controller
public class UserOrderController {
    @Autowired
    private UserOrderService userOrderService;
    @Autowired
    private CommodityService commodityService;

    //已用户购买的所有订单
    @RequestMapping("/userOrder")
    public String userOrder(HttpSession session, Model model) {
        Users users = (Users) session.getAttribute("users");
        //已支付订单
        List<Commorder> commOrderAll1 = userOrderService.getCommOrderAll(users.getUserid(), "已支付");
        model.addAttribute("orderList", commOrderAll1);
        int orders1 = userOrderService.orders(users.getUserid(), "已支付");
        model.addAttribute("orders1", orders1);
        //已发货订单
        List<Commorder> commOrderAll2 = userOrderService.getCommOrderAll(users.getUserid(), "已发货");
        model.addAttribute("orderDeliverList", commOrderAll2);
        int orders2 = userOrderService.orders(users.getUserid(), "已发货");
        model.addAttribute("orders2", orders2);
        //已完成订单
        List<Commorder> commOrderAll = userOrderService.getCommOrderAll(users.getUserid(), "已完成");
        model.addAttribute("orderAccomplishList", commOrderAll);
        int orders3 = userOrderService.orders(users.getUserid(), "已完成");
        model.addAttribute("orders3", orders3);
        return "users/userorder/userOrder";
    }

    //修改购买订单状态:收货
    @RequestMapping("/updateUserOrderState")
    public String updateUserOrderState(Commorder commorder) {
        commorder.setOrderdate(new Date());
        userOrderService.updateOrderstate(commorder);
        return "redirect:userOrder";
    }

    //取消购买订单
    @RequestMapping("/deleteOrder")
    public String deleteOrder(String orderid, int commid) {
        userOrderService.deleteOrder(orderid);
        commodityService.updateCommState(commid, "在售中");
        return "redirect:userOrder";
    }

    //查询出售的所有的商品
    @RequestMapping("/userCommOrder")
    public String userCommOrder(HttpSession session, Model model) {
        Users users = (Users) session.getAttribute("users");
        //已支付的订单
        List<Commorder> commAll1 = userOrderService.getCommAll(users.getUserid(), "已支付");
        model.addAttribute("commList1", commAll1);
        int orders1 = userOrderService.ordersComm(users.getUserid(), "已支付");
        model.addAttribute("orders1", orders1);
        //已发货的订单
        List<Commorder> commAll2 = userOrderService.getCommAll(users.getUserid(), "已发货");
        model.addAttribute("commList2", commAll2);
        int orders2 = userOrderService.ordersComm(users.getUserid(), "已发货");
        model.addAttribute("orders2", orders2);
        //已完成的订单
        List<Commorder> commAll3 = userOrderService.getCommAll(users.getUserid(), "已完成");
        model.addAttribute("commList3", commAll3);
        int orders3 = userOrderService.ordersComm(users.getUserid(), "已完成");
        model.addAttribute("orders3", orders3);
        return "users/userorder/userCommOrder";
    }

    //修改出售订单状态：发货
    @RequestMapping("/updateCommOrderState")
    public String updateOrderState(Commorder commorder) {
        commorder.setOrderdate(new Date());
        userOrderService.updateOrderstate(commorder);
        return "redirect:userCommOrder";
    }

    //添加订单
    @RequestMapping("/insertOrder")
    public String insertOrder(Commorder commorder) {
        commorder.setOrderid(UUID.randomUUID().toString());
        commorder.setOrderdate(new Date());
        //添加订单
        userOrderService.insertOrder(commorder);
        //修改商品状态
        commodityService.updateCommState(commorder.getCommid(), "已出售");
        return "redirect:userOrder";
    }


}
