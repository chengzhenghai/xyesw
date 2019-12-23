package com.dao.admins.announcement;

import com.entity.user.Announcement;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnnouncementDao {
    //查询所有公告
    List<Announcement> getAnnouncementAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    //发布公告
    void insertAnnouncement(Announcement announcement);

    //删除公告
    void deleteAnnouncement(int onticeid);

    //修改公告
    void updateAnnouncement(Announcement announcement);
}
