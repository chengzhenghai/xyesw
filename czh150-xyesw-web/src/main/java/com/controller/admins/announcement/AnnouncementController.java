package com.controller.admins.announcement;

import com.entity.user.Announcement;
import com.github.pagehelper.PageInfo;
import com.service.admins.announcement.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AnnouncementController {
    @Autowired
    private AnnouncementService announcementService;

    //用户查询所有公告
    @RequestMapping("/getAnnouncementAll")
    public String getAnnouncementAll(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
            Model model) {
        List<Announcement> announcementAll = announcementService.getAnnouncementAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(announcementAll);
        model.addAttribute("anno", pageInfo);
        return "/users/announcementuser/announcementList";
    }

    //管理员查询所有公告
    @RequestMapping("/adminAnnouncementAll")
    public String adminAnnouncementAll(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
            Model model) {
        List<Announcement> announcementAll = announcementService.getAnnouncementAll(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(announcementAll);
        model.addAttribute("anno", pageInfo);
        return "/admins/announcement/announcementAdminList";
    }

}
