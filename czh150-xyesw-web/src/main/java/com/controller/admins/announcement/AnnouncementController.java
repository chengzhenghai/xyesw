package com.controller.admins.announcement;

import com.entity.user.Announcement;
import com.github.pagehelper.PageInfo;
import com.service.admins.announcement.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class AnnouncementController {
    //上传图片路径
    public static final String FILE_DIRECTORY = "/static/announcement-img";
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

    //跳转到添加公告页面
    @RequestMapping("/skipInsertAnnouncement")
    public String skipInsertAnnouncement() {
        return "/admins/announcement/insertAnnouncement";
    }

    //跳转到添加公告页面
    @RequestMapping("/skipUpdateAnnouncement")
    public String skipUpdateAnnouncement(int onticeid, String onticeimg, String onticetext, Model model) {
        model.addAttribute("onticeid", onticeid);
        model.addAttribute("onticeimg", onticeimg);
        model.addAttribute("onticetext", onticetext);
        return "/admins/announcement/updateAnnouncement";
    }

    //添加公告
    @RequestMapping("/insertAnnouncement")
    public String insertAnnouncement(Announcement announcement, MultipartFile onticeimg) {
        announcement.setOnticedate(new Date());//当前时间
        String filename = onticeimg.getOriginalFilename();
        String path = FILE_DIRECTORY + File.separator + UUID.randomUUID().toString() + filename;
        File files = new File(path);
        try {
            onticeimg.transferTo(files);
            announcement.setOnticeimg(path);//图片
        } catch (IOException e) {
            e.printStackTrace();
        }
        announcementService.insertAnnouncement(announcement);
        return "redirect:adminAnnouncementAll";
    }

    //删除公告
    @RequestMapping("/deleteAnnouncement")
    public String deleteAnnouncement(int onticeid) {
        announcementService.deleteAnnouncement(onticeid);
        return "redirect:adminAnnouncementAll";
    }

    //修改公告
    @RequestMapping("/updateAnnouncement")
    public String updateAnnouncement(Announcement announcement, String img, MultipartFile onticeimg) {
        announcement.setOnticedate(new Date());//当前时间
        String filename = onticeimg.getOriginalFilename();
        if ("".equals(filename)) {
            announcement.setOnticeimg(img);
        } else {
            String path = FILE_DIRECTORY + File.separator + UUID.randomUUID().toString() + filename;
            File files = new File(path);
            try {
                onticeimg.transferTo(files);
                announcement.setOnticeimg(path);//图片
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        announcementService.updateAnnouncement(announcement);
        return "redirect:adminAnnouncementAll";
    }

}
