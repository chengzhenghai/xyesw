package com.controller.admins;

import com.entity.user.Userinfo;
import com.github.pagehelper.PageInfo;
import com.service.admins.student.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

//管理员
@Controller
public class StudentController {
    @Autowired
    private StudentService studentService;

    //查询所有学生信息
    @RequestMapping("/studentList")
    public String getStudentList(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
            Model model) {
        List<Userinfo> studentList = studentService.getStudentList(pageNum, pageSize);
        PageInfo pageInfo = new PageInfo(studentList);
        model.addAttribute("student", pageInfo);
        return "admins/student/studentList";
    }

    //跳转添加学生页面
    @RequestMapping("/skipStudent")
    public String skipStudent() {
        return "admins/student/insertStudent";
    }

    //添加学生
    @RequestMapping("/insertStudent")
    public String insertStudent(Userinfo userinfo) {
        userinfo.setUseraccount(userinfo.getUsernumber());//账号
        userinfo.setUserpass("123456");//密码默认
        userinfo.setUserstate("正常");//状态默认
        studentService.insertStudent(userinfo);
        userinfo.setUserid(studentService.getStudentId());//用户id
        userinfo.setUserimg("/static/system-img/yonghutoxiang.jpg");//头像默认
        studentService.insertStudentInfo(userinfo);
        return "redirect:homepageAdmin";
    }

    //修改学生状态
    @RequestMapping("/updateStudentState")
    public String updateStudentState(int userid, String userstate) {
        studentService.updateStudentState(userid, userstate);
        return "redirect:homepageAdmin";
    }



}
