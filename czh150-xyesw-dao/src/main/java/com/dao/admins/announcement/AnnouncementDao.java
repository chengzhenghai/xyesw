package com.dao.admins.announcement;

import com.entity.user.Announcement;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnnouncementDao {
    //查询所有公告
    List<Announcement> getAnnouncementAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

}
