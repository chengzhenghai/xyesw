<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3 style="margin-left: 30px; margin-top: 20px">添加学生</h3>
<hr>

<div style="border: 1px solid black; width: 600px; height: 350px; margin: auto; margin-top: 50px;">
    <form method="get" action="/insertStudent">
        <input type="hidden" name="userid" value="${sessionScope.users.userid}" readonly="readonly">
        <div style="margin: auto; margin-top: 40px; width: 400px;">
            <label>学生姓名：</label>
            <input type="text" class="form-control" placeholder="请输入学生姓名" name="username">
        </div>
        <div style="margin: auto; margin-top: 40px; width: 400px;">
            <label>手机号：</label>
            <input type="text" class="form-control" placeholder="请输入手机号" name="usernumber">
        </div>
        <button type="submit" class="btn btn-primary" style="margin-top: 50px; margin-left: 200px;">添加</button>
        <a href="/studentList">
            <button class="btn btn-primary" type="button" style="margin-top: 50px; margin-left: 100px;">取消</button>
        </a>
    </form>
</div>

