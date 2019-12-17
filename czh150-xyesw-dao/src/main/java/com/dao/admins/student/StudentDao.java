package com.dao.admins.student;

import com.entity.user.Userinfo;
import com.entity.user.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

//学生管理
public interface StudentDao {
    //所有学生信息
    List<Userinfo> getStudentList(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

    //添加学生
    void insertStudent(Userinfo userinfo);

    //添加学生信息
    void insertStudentInfo(Userinfo userinfo);

    //最新添加的用户id
    int getStudentId();

    //修改用户状态
    void updateStudentState(@Param("userid") int userid,@Param("userstate") String userstate);
}
