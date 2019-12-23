package com.service.admins.announcement;

import com.entity.user.Announcement;

import java.util.List;

public interface AnnouncementService {
    //查询所有公告
    List<Announcement> getAnnouncementAll(int pageNum, int pageSize);

    //发布公告
    void insertAnnouncement(Announcement announcement);

    //删除公告
    void deleteAnnouncement(int onticeid);

    //修改公告
    void updateAnnouncement(Announcement announcement);
}
