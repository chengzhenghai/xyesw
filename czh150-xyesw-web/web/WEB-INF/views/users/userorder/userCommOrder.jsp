<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的出售</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp" %>

<h3 style="margin-left: 30px; margin-top: 30px">我的出售</h3>
<hr>

<h3 style="margin-left: 30px; margin-top: 30px">已支付的订单</h3>
<hr>
<div style="width: auto; height: auto; margin: auto">
    <table class="table table-hover" style="table-layout:fixed;">
        <tr>
            <td>商品名称</td>
            <td>商品价格</td>
            <td>下单时间</td>
            <td>订单状态</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${commList1}" var="order">
            <tr>
                <td>${order.commname}</td>
                <td>${order.ordertotal}</td>
                <td><fmt:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd hh-mm-ss"/></td>
                <td>${order.orderstate}</td>
                <td>
                    <a href="/updateCommOrderState?orderid=${order.orderid}&orderstate=已发货">
                        <button class="btn btn-primary">发货</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<h3 style="margin-left: 30px; margin-top: 30px">已发货的订单</h3>
<hr>
<div style="width: auto; height: auto; margin: auto">
    <table class="table table-hover" style="table-layout:fixed;">
        <tr>
            <td>商品名称</td>
            <td>商品价格</td>
            <td>下单时间</td>
            <td>订单状态</td>
        </tr>
        <c:forEach items="${commList2}" var="order">
            <tr>
                <td>${order.commname}</td>
                <td>${order.ordertotal}</td>
                <td><fmt:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd hh-mm-ss"/></td>
                <td>${order.orderstate}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<h3 style="margin-left: 30px; margin-top: 30px">已完成的订单</h3>
<hr>
<div style="width: auto; height: auto; margin: auto">
    <table class="table table-hover" style="table-layout:fixed;">
        <tr>
            <td>商品编号</td>
            <td>商品名称</td>
            <td>商品价格</td>
            <td>下单时间</td>
            <td>订单状态</td>
        </tr>
        <c:forEach items="${commList3}" var="order">
            <tr>
                <td>${order.commid}</td>
                <td>${order.commname}</td>
                <td>${order.ordertotal}</td>
                <td><fmt:formatDate value="${order.orderdate}" pattern="yyyy-MM-dd hh-mm-ss"/></td>
                <td>${order.orderstate}</td>
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
