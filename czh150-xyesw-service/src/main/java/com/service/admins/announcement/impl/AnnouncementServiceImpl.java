package com.service.admins.announcement.impl;

import com.dao.admins.announcement.AnnouncementDao;
import com.entity.user.Announcement;
import com.service.admins.announcement.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {
    @Autowired
    private AnnouncementDao dao;

    //查询所有公告
    @Override
    public List<Announcement> getAnnouncementAll(int pageNum, int pageSize) {
        return dao.getAnnouncementAll(pageNum, pageSize);
    }

    //添加
    @Override
    public void insertAnnouncement(Announcement announcement) {
        dao.insertAnnouncement(announcement);
    }

    //删除
    @Override
    public void deleteAnnouncement(int onticeid) {
        dao.deleteAnnouncement(onticeid);
    }

    //修改
    @Override
    public void updateAnnouncement(Announcement announcement) {
        dao.updateAnnouncement(announcement);
    }
}
