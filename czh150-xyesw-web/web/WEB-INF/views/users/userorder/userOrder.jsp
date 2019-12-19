<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户订单</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp" %>

<h3 style="margin-left: 30px; margin-top: 30px">我的订单</h3>
<hr>

<h3 style="margin-left: 30px; margin-top: 30px">待发货的订单</h3>
<hr>
<div style="width: auto; height: auto; margin: auto">
    <table class="table table-hover" style="table-layout:fixed;">
        <tr>
            <td style="width: 200px;">订单编号</td>
            <td>订单时间</td>
            <td>商品</td>
            <td>商家</td>
            <td>订单总价</td>
            <td>订单状态</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${orderList}" var="order">
            <tr>
                <td>
                    <div style="width: 150px; word-break:break-all;">${order.orderid}</div>
                </td>
                <td><fmt:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd hh-mm-ss"/></td>
                <td><a href="/commodityDetails?commid=${order.commid}">${order.commname}</a></td>
                <td><a href="/elseUserStores?userid=${order.userids}">${order.username}</a></td>
                <td>￥ ${order.ordertotal}</td>
                <td>${order.orderstate}，代发货</td>
                <td>
                    <a href="/deleteOrder?orderid=${order.orderid}&commid=${order.commid}">
                        <button class="btn btn-primary">取消订单</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<h3 style="margin-left: 30px; margin-top: 30px">待收货的订单</h3>
<hr>
<div style="width: auto; height: auto; margin: auto">
    <table class="table table-hover" style="table-layout:fixed;">
        <tr>
            <td>订单编号</td>
            <td>订单时间</td>
            <td>商品</td>
            <td>商家</td>
            <td>订单总价</td>
            <td>订单状态</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${orderDeliverList}" var="order">
            <tr>
                <td>
                    <div style="width: 150px; word-break:break-all;">${order.orderid}</div>
                </td>
                <td><fmt:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd hh-mm-ss"/></td>
                <td><a href="/commodityDetails?commid=${order.commid}">${order.commname}</a></td>
                <td><a href="/elseUserStores?userid=${order.userids}">${order.username}</a></td>
                <td>￥ ${order.ordertotal}</td>
                <td>${order.orderstate}，待收货</td>
                <td>
                    <a href="/updateUserOrderState?orderid=${order.orderid}&orderstate=已完成">
                        <button class="btn btn-primary">确定收货</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>


<h3 style="margin-left: 30px; margin-top: 30px">已完成的订单</h3>
<hr>
<div style="width: auto; height: auto; margin: auto">
    <table class="table table-hover" style="table-layout:fixed;">
        <tr>
            <td>订单编号</td>
            <td>订单时间</td>
            <td>商品</td>
            <td>商家</td>
            <td>订单总价</td>
            <td>订单状态</td>
        </tr>
        <c:forEach items="${orderAccomplishList}" var="order">
            <tr>
                <td>
                    <div style="width: 150px; word-break:break-all;">${order.orderid}</div>
                </td>
                <td><fmt:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd hh-mm-ss"/></td>
                <td><a href="/commodityDetails?commid=${order.commid}">${order.commname}</a></td>
                <td><a href="/elseUserStores?userid=${order.userids}">${order.username}</a></td>
                <td>￥ ${order.ordertotal}</td>
                <td>${order.orderstate}</td>
<%--                <td>--%>
<%--                    <a href="/deleteOrder?orderid=${order.orderid}">--%>
<%--                        <button class="btn btn-primary">删除</button>--%>
<%--                    </a>--%>
<%--                </td>--%>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element;
    });
</script>

</body>
</html>
