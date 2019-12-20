package com.service.admins.announcement;

import com.entity.user.Announcement;

import java.util.List;

public interface AnnouncementService {
    //查询所有公告
    List<Announcement> getAnnouncementAll(int pageNum, int pageSize);


}
