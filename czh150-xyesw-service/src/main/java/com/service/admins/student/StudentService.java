package com.service.admins.student;

import com.entity.user.Userinfo;
import com.entity.user.Users;

import java.util.List;

public interface StudentService {
    //所有学生信息
    List<Userinfo> getStudentList(int pageNum, int pageSize);

    //添加学生
    void insertStudent(Userinfo userinfo);

    //添加学生信息
    void insertStudentInfo(Userinfo userinfo);

    //最新添加的用户id
    int getStudentId();

    //修改用户状态
    void updateStudentState(int userid, String userstate);
}
