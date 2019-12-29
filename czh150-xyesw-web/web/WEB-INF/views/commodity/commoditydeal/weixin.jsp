<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>微信支付</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<div style="width: 400px; height: 400px; margin: auto; margin-top: 100px">
    <form action="/insertOrder" method="get">
        <input type="hidden" value="${order.userid}" name="userid">
        <input type="hidden" value="${order.userids}" name="userids">
        <input type="hidden" value="${order.commid}" name="commid">
        支付：￥<input type="text" value="${order.ordertotal}" name="ordertotal" readonly="readonly">
        <input type="hidden" value="${order.orderstate}" name="orderstate">
        <img src="/static/system-img/weixin.png" style="width: 400px; height: 400px;">
        <button type="submit" class="btn btn-primary">支付</button>
        <a href="/commPayment?commid=${order.commid}&userid=${order.userid}">
            <button type="button" class="btn btn-danger">取消</button>
        </a>
    </form>
</div>

</body>
</html>
