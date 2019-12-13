<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登入</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div>
    <h2>管理员登入</h2>
    <form method="post" action="/enterAdmin">
        账号：<input type="text" name="adminname"/><br>
        <span style="color: red;">${adminname}</span><br>
        密码：<input type="password" name="adminpass"/><br>
        <span style="color: red;">${adminpass}</span><br>
        <span style="color: red;">${error}</span><br>
        <input type="submit" value="登入"/><br>
    </form>
    <a href="/xyesw">用户登入</a>
</div>
</body>
</html>
