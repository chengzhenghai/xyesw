<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>xyesw管理系统</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>
<h2>xyesw管理系统</h2>
    <div>欢迎：${sessionScope.admin.adminname}</div>
<a href="/exitAdmin">---退出---</a>
</body>
</html>
