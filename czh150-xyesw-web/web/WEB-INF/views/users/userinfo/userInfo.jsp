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

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 40px; font-family: 楷体">XYESW</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/homepage" style="text-decoration:none;">首页</a></li>
            <li class="layui-nav-item"><a href="/userStore" style="text-decoration:none;">我的店铺</a></li>
            <li class="layui-nav-item"><a href="/userOrder" style="text-decoration:none;">我的订单</a></li>
            <li class="layui-nav-item"><a href="/userInfo" style="text-decoration:none;">我的信息</a></li>
        </ul>
        <form method="get" action="/getCommodityName">
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <input type="text" name="commname" lay-verify="title" placeholder="请输入"
                           class="layui-input">
                </li>
                <li class="layui-nav-item">
                    <input class="layui-btn" type="submit" value="查询">
                </li>
                <li class="layui-nav-item">
                    <a href="" style="text-decoration:none;">
                        <img src="${sessionScope.userinfo.userimg}" class="layui-nav-img">
                        ${sessionScope.userinfo.username}
                    </a>
                </li>
                <li class="layui-nav-item"><a href="/exitUser" style="text-decoration:none;">退出</a></li>
            </ul>
        </form>
    </div>
</div>

<h3 style="margin-left: 30px; margin-top: 20px">我的信息</h3>
<hr>

<div style="border: 1px solid yellow; width: 800px; height: 400px; margin: auto">
    <div style="margin-top: 50px; margin-left: 50px; float: left;">
        <img src="${info.userimg}" style="width: 300px; height: 300px; border-radius:50%; "/>
    </div>
    <div style="float: right; width: 400px">
        <form>
            <div class="form-group">
                <label for="exampleFormControlInput1">用户名：</label>
                <input type="email" class="form-control" id="exampleFormControlInput1" value="${info.username}">
            </div>
            <div class="form-group">
                <label for="exampleFormControlInput2">账号：</label>
                <input type="email" class="form-control" id="exampleFormControlInput2" value="${info.userid}">
            </div>
            <div class="form-group">
                <label for="exampleFormControlInput3">手机号：</label>
                <input type="email" class="form-control" id="exampleFormControlInput3" value="${info.usernumber}">
            </div>
            <div class="form-group">
                <label for="exampleFormControlInput4">收件地址：</label>
                <input type="email" class="form-control" id="exampleFormControlInput4" value="${info.usershojian}">
            </div>
            <div class="form-group">
                <label for="exampleFormControlInput5">发件地址：</label>
                <input type="email" class="form-control" id="exampleFormControlInput5" value="${info.userfajian}">
            </div>
        </form>
    </div>
</div>


<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    });
</script>

</body>
</html>
