<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>

    <style>
        .comm-details{
            margin-top: 10px;
        }
    </style>

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

<h3 style="margin-left: 30px; margin-top: 20px">商品详情</h3>
<hr>

<div style="border: 1px solid yellow; width: 1000px; height: 550px; margin: auto">
    <div style="border: 1px solid salmon; width: 550px; height: 500px; float: left; margin-left: 30px; margin-top: 30px;">
        <div style="width: 550px; height: 350px; text-align: center">
            <img src="${commodity.commimgpath}" style="width: auto; height: 80%; margin-top: 40px"/>
        </div>
        <div style="width: 540px; height: 130px; margin: auto; overflow-x: auto; white-space: nowrap;">
            <c:forEach items="${commodityImg}" var="img">
                <img src="${img.commimgpath}" style="width: auto; height: 100px; margin-left: 10px; "/>
            </c:forEach>
        </div>
    </div>
    <div style="border: 1px silver solid; width: 350px; height: 500px; float: right; margin-right: 30px; margin-top: 30px;">
        <h1 class="comm-details">${commodity.commname}</h1>
        <div class="comm-details">
            <span style="font-size: 20px">商品价格：￥</span>
            <span style="color: red; font-size: 25px">${commodity.commmoney}</span>
        </div>
        <c:if test="${sessionScope.users.userid == userinfo.userid}">
            <div class="comm-details">
                <span style="font-size: 20px">商&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家：</span>
                <span style="color: red; font-size: 20px"><a href="/userStore">${userinfo.username}</a></span>
            </div>
            <div class="comm-details"><span style="font-size: 20px">商品简介：</span><textarea style="width: 340px; height: 250px; margin-top: 10px; font-size: 20px">${commodity.commdrief}</textarea></div>
            <div class="comm-details"><a href="/userStore"><button type="button" class="btn btn-primary">我的商品</button></a></div>
        </c:if>
        <c:if test="${sessionScope.users.userid != userinfo.userid}">
            <div class="comm-details">
                <span style="font-size: 20px">商&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家：</span>
                <span style="color: red; font-size: 20px"><a href="/elseUserStores?userid=${userinfo.userid}">${userinfo.username}</a></span>
            </div>
            <div class="comm-details"><span style="font-size: 20px">商品简介：</span><textarea style="width: 340px; height: 250px; margin-top: 10px; font-size: 20px">${commodity.commdrief}</textarea></div>
            <div class="comm-details"><a href="/userRelation?commid=${commodity.commid}&userid=${userinfo.userid}"><button type="button" class="btn btn-primary">我想要</button></a></div>
        </c:if>
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
