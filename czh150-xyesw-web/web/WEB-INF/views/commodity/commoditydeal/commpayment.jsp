<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp" %>

<h3 style="margin-left: 30px; margin-top: 20px">支付详情
    <a href="/userRelation?commid=${comm.commid}&userid=${info.userid}">
        <button type="button" class="btn btn-primary">返回</button>
    </a>
</h3>
<hr>

<div style="border: 1px solid yellow; width: 600px; height: 350px; margin: auto;">
    <form>
        <div class="form-group">
            <label>商品名称：${comm.commname}</label>
        </div>
        <div class="form-group">
            <label>商品图片：</label>
            <img src="${comm.commimgpath}" style="width: auto; height: 100px; margin: auto;">
        </div>
        <div class="form-group">
            <label>商&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家：${info.username}</label>
        </div>
        <div class="form-group">
            <label>商品价格：￥ <span id="Commodity">${comm.commmoney}</span></label>
        </div>
        <div class="form-group">
            <label style="float: left">商品简介：</label>
            <textarea style="resize:none; width: 500px; height: 100px;" readonly>${comm.commmoney}</textarea>
        </div>
    </form>
</div>
<div style="border: 1px solid yellow; width: 600px; height: 200px; margin: auto;">
    <div style="float: left; width: 250px; height: auto; margin-top: 10px; margin-left: 20px;">
        <label>配送费：</label>
        <input type="text" class="form-control" value="￥2" readonly>

        <label>发件地址：</label>
        <input type="text" class="form-control" value="${info.userfajian}" readonly>

        <label>收件地址：<sapn id="tishi" style="color: red;"></sapn></label>
        <input type="text" class="form-control" id="sjdz" value="${sessionScope.userinfo.usershojian}">
    </div>
    <div style="width: 220px; float: left; margin-top: 10px; margin-left: 30px;">
        <label>实际价格：</label>
        <input type="text" class="form-control" id="money" value="${comm.commmoney + 2}" readonly>
    </div>
    <div style="float: left; width: 220px; height: 100px; margin-left: 100px; margin-top: 20px;">
        <a class="pd" href="/weixin?userid=${sessionScope.users.userid}&userids=${info.userid}&commid=${comm.commid}&ordertotal=${comm.commmoney + 2}&orderstate=已支付">
            <img src="/static/system-img/zhifubao.png" title="支付宝" style="width: 100px; height: 100px;">
        </a>
        <a class="pd" href="/zhufubao?userid=${sessionScope.users.userid}&userids=${info.userid}&commid=${comm.commid}&ordertotal=${comm.commmoney + 2}&orderstate=已支付">
            <img src="/static/system-img/weixin.jpg" title="微信" style="width: 100px; height: 100px;">
        </a>
    </div>
</div>

<script>

    $('.pd').click(function (e) {
        if($("#sjdz").val() === "") {
            alert("请填写收件地址！");
            document.getElementById('tishi').innerText = '请填写收件地址！';
            e.preventDefault()
        }
        return true
    });

</script>

</body>
</html>
