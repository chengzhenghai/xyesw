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

<h3 style="margin-left: 30px; margin-top: 20px">支付详情</h3>
<hr>

<div style="border: 1px solid black; width: 600px; height: 350px; margin: auto;">
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
        <label>配送方式：</label>
        <select class="form-control" id="Select1">
            <option value="1">配送</option>
            <option value="2">自取</option>
        </select>

        <label>发件地址：</label>
        <input type="text" class="form-control" value="${info.userfajian}" readonly>

        <label>收件地址：</label>
        <input type="text" class="form-control" value="${sessionScope.userinfo.usershojian}">
    </div>
    <div style="width: 220px; float: left; margin-top: 10px; margin-left: 30px;">
        <label>实际价格：</label>
        <input type="text" class="form-control" id="money" value="${comm.commmoney + 2}" readonly>
    </div>
    <div style="float: left; width: 220px; height: 100px; margin-left: 100px; margin-top: 20px;">
        <a href=""><img src="/static/system-img/zhifubao.png" title="微信" style="width: 100px; height: 100px;"></a>
        <a href=""><img src="/static/system-img/weixin.jpg" title="支付宝" style="width: 100px; height: 100px;"></a>
    </div>
</div>

<script>
    $("#Select1").change(function () {
        var comm = document.getElementById("Commodity").innerHTML;
        var id = $("#Select1").val();
        var money = 0;
        if(id === '1') {
            money = parseInt(comm.trim()) + 2;
        }else if(id === '2') {
            money = comm;
        }
        $("#money").val(money);
    });
</script>

</body>
</html>
