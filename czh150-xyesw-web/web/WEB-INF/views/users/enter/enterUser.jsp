<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登入</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<div style="width: 500px; height: 400px; border: 1px solid salmon; margin: auto; margin-top: 100px; border-radius:20px 20px;">
    <div style="border: 1px solid black; width: 400px; height: 300px; margin: auto; margin-top: 50px; border-radius:20px 20px;">
        <h2 style="text-align: center">用户登入</h2>
        <div style="width: 300px; margin: auto;">
            <form method="get" action="/enterUser">
                <div class="form-group">
                    <label>账号：<span style="color: red;">${useraccount}</span></label>
                    <input type="text" class="form-control" placeholder="请输入账号或学号" name="useraccount" style="width: 300px;" value="1489572851">
                </div>
                <div class="form-group">
                    <label>密码：<span style="color: red;">${userpass}</span></label>
                    <input type="password" class="form-control" placeholder="请输入密码" name="userpass" style="width: 300px;" value="czh14895">
                </div>
                <div style="text-align: center;">
                    <span style="color: red;">${error}</span><br>
                    <button type="submit" class="btn btn-primary">登入</button>
                </div>
            </form>
        </div>
        <a href="/xyesws">管理员登入</a>
    </div>
</div>

</body>
</html>
