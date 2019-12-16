<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的信息</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp" %>

<h3 style="margin-left: 30px; margin-top: 20px">我的信息</h3>
<hr>

<div style="border: 1px solid yellow; width: 800px; height: 500px; margin: auto">
    <div style="margin-top: 50px; margin-left: 50px; float: left;">
        <form action="/updateCommImg" method="post" enctype="multipart/form-data">
            <input type="hidden" name="userid" value="${info.userid}" readonly="readonly">
            <img src="${info.userimg}" style="width: 300px; height: 300px; border-radius:50%; "/>
        </form>
    </div>
    <div style="float: right; width: 400px; margin-top: 20px;">
        <form action="/updateInfo" method="get">
            <div class="form-group">
                <label>学号：</label>
                <input type="text" class="form-control" name="userid" value="${info.userid}" readonly="readonly">
            </div>
            <div class="form-group">
                <label>账号：</label>
                <input type="text" class="form-control" name="useraccount" value="${info.useraccount}" readonly="readonly">
            </div>
            <div class="form-group">
                <label>用户名：</label>
                <input type="text" class="form-control" name="username" value="${info.username}">
            </div>
            <div class="form-group">
                <label>手机号：</label>
                <input type="text" class="form-control" name="usernumber" value="${info.usernumber}">
            </div>
            <div class="form-group">
                <label>收件地址：</label>
                <input type="text" class="form-control" name="usershojian" value="${info.usershojian}">
            </div>
            <div class="form-group">
                <label>发件地址：</label>
                <input type="text" class="form-control" name="userfajian" value="${info.userfajian}">
            </div>
            <button type="submit" style="margin-left: 100px" class="btn btn-primary">修改信息</button>
        </form>
    </div>
</div>


<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element;
    });
</script>

</body>
</html>
