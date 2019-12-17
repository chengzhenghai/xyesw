package com.service.admins.student.impl;

import com.dao.admins.student.StudentDao;
import com.entity.user.Userinfo;
import com.entity.user.Users;
import com.service.admins.student.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao dao;

    //所有学生信息
    @Override
    public List<Userinfo> getStudentList(int pageNum, int pageSize) {
        return dao.getStudentList(pageNum, pageSize);
    }

    //添加学生
    @Override
    public void insertStudent(Userinfo userinfo) {
        dao.insertStudent(userinfo);
    }

    //添加学生信息
    @Override
    public void insertStudentInfo(Userinfo userinfo) {
        dao.insertStudentInfo(userinfo);
    }

    //最新添加的用户id
    @Override
    public int getStudentId() {
        return dao.getStudentId();
    }

    @Override
    public void updateStudentState(int userid, String userstate) {
        dao.updateStudentState(userid, userstate);
    }

}
