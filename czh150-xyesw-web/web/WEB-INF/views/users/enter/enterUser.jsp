<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登入</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div style="text-align: center">
    <h2>用户登入</h2>
    <form method="post" action="/enterUser">
        账号：<input type="text" name="useraccount" value="1489572851"/><br>
        <span style="color: red;">${useraccount}</span><br>
        密码：<input type="password" name="userpass" value="czh14895"/><br>
        <span style="color: red;">${userpass}</span><br>
        <span style="color: red;">${error}</span><br>
        <input type="submit" value="登入"/><br>
    </form>
    <a href="/xyesws">管理员登入</a>
</div>
</body>
</html>
