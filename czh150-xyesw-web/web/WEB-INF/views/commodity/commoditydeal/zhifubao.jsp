<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付宝支付</title>
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
        <button type="submit" class="btn btn-danger">支付</button>
    </form>
</div>

</body>
</html>
