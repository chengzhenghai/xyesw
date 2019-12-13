<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>联系商家</title>
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

<h3 style="margin-left: 30px; margin-top: 20px">联系商家</h3>
<hr>

<div style="border: 1px solid wheat; width: 800px; height: 600px; margin: auto;">
    <div style="border: 1px solid yellow; width: 800px; height: 60px; position:relative;">
        <a href="/commodityDetails?commid=${commodity.commid}">
            <div style="float: left; width: 150px; overflow:hidden">
                <img src="${commodity.commimgpath}" style="width: 55px; height: 55px;">
                ${commodity.commname}
            </div>
        </a>
        <button class="btn btn-primary" style="position: absolute; bottom: 0; right: 0">立即购买</button>
    </div>
    <div style="border: 1px solid greenyellow; width: 800px; height: 450px;">
        <div style="width: 400px; height: auto; float: left; margin-left: 10px; margin-top: 10px">
            <a href="/elseUserStores?userid=${userinfo.userid}"><img src="${userinfo.userimg}" style="width: 50px; height: 50px; border-radius:50%; float: left;"></a>
            <textarea class="form-control" readonly="readonly" style="width: 340px; float: right; resize:none;">欢迎购买本商品。</textarea>
        </div>
    </div>
    <div style="width: 800px; height: 90px; border: 1px solid aliceblue">

    </div>
</div>

</body>
</html>
