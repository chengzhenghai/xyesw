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
}
