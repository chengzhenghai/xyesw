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

<%@include file="../../navigationbar/navigationBar.jsp" %>

<h3 style="margin-left: 30px; margin-top: 20px">联系商家
    <a href="/commodityDetails?commid=${commodity.commid}">
        <button type="button" class="btn btn-primary">返回</button>
    </a>
</h3>
<hr>

<div style="width: 800px; height: auto; margin: auto;">
    <div style="border: 1px solid yellow; width: 800px; height: 60px; position:relative;">
        <a href="/commodityDetails?commid=${commodity.commid}">
            <div style="float: left; width: 150px; overflow:hidden">
                <img src="${commodity.commimgpath}" style="width: 55px; height: 55px;">
                ${commodity.commname}
            </div>
        </a>
        <a href="/commPayment?commid=${commodity.commid}&userid=${commodity.userid}">
            <button class="btn btn-primary" style="position: absolute; bottom: 0; right: 0">立即购买</button>
        </a>
    </div>
    <div style="border: 1px solid greenyellow; width: 800px; height: 400px;">
        <div style="width: 400px; height: auto; float: left; margin-left: 10px; margin-top: 10px">
            <a href="/elseUserStores?userid=${userinfo.userid}">
                <img src="${userinfo.userimg}" style="width: 50px; height: 50px; border-radius:50%; float: left;">
            </a>
            <textarea class="form-control" readonly="readonly" style="width: 340px; float: right; resize:none;">欢迎购买本商品。</textarea>
        </div>
    </div>
    <div style="width: 800px; height: 120px; border: 1px solid aqua">

            <div style="width: 720px; height: 110px; float: left;">
                <img src="${sessionScope.userinfo.userimg}" style="width: 50px; height: 50px; border-radius:50%; float: left; margin-left: 20px; margin-top: 10px;">
                <textarea name="" class="form-control" style="width: 620px; height: 100px; float: left; resize:none; margin-left: 20px; margin-top: 5px;" placeholder="请输入"></textarea>
            </div>
            <div style="width: auto; float: right; margin-top: 75px; margin-right: 20px;">
                <button class="btn btn-primary">发送</button>
            </div>

    </div>
</div>

</body>
</html>
