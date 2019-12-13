package com.entity.user;

import lombok.Data;

//管理员发布公告表
@Data
public class Announcement {
    private Integer onticeid;//公告编号
    private String onticetext;//公告内容
    private String onticeimg;//公告图片
}
