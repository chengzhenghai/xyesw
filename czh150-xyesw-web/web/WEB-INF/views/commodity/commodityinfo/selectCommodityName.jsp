<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询商品</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp"%>

<c:if test="${!empty name}">
    <h3 style="margin-left: 30px; margin-top: 20px">与" ${name} "相关的商品</h3>
</c:if>
<c:if test="${empty name}">
    <h3 style="margin-left: 30px; margin-top: 20px">所有商品</h3>
</c:if>

<hr>

<div>
    <c:if test="${empty commodity.list}">
        <div style="border: 1px solid yellow; width: 1000px; height: auto; margin: auto;">
            <h1 style="text-align: center; margin-top: 20px">没有这种商品！</h1>
        </div>
    </c:if>
    <c:if test="${!empty commodity.list}">
        <div style="border: 1px solid yellow; width: 1000px; height: auto; margin: auto;">
            <c:forEach items="${commodity.list}" var="comms">
                <a href="/commodityDetails?commid=${comms.commid}">
                    <c:if test="${comms.userid == sessionScope.users.userid}">
                        <div class="my-comm" style="border: 1px solid red; float: left; margin-left: 20px; margin-top: 20px; width: 220px; border-radius:10px 10px;">
                            <div style="width: auto; height: auto; text-align: center; margin-top: 10px">
                                <img style="max-width: 200px; height: 200px;" src="${comms.commimgpath}"/>
                            </div>
                            <div style="margin-left: 10px">${comms.commname}</div>
                            <div style="margin-left: 10px">￥ ${comms.commmoney}</div>
                        </div>
                    </c:if>
                    <c:if test="${comms.userid != sessionScope.users.userid}">
                        <div style="border: 1px solid greenyellow; float: left; margin-left: 20px; margin-top: 20px; width: 220px; border-radius:10px 10px;">
                            <div style="width: auto; height: auto; text-align: center; margin-top: 10px">
                                <img style="max-width: 200px; height: 200px;" src="${comms.commimgpath}"/>
                            </div>
                            <div style="margin-left: 10px">${comms.commname}</div>
                            <div style="margin-left: 10px">￥ ${comms.commmoney}</div>
                        </div>
                    </c:if>
                </a>
            </c:forEach>
            <div style="clear: both; margin-bottom: 20px"></div>
        </div>
        <div style="width: auto; height: auto; text-align: center">
            <ul class="pagination" style="text-align: center">
                <li><a href="/getCommodityName?pageNum=1&commname=${name}">首页</a></li>
                <li><a href="/getCommodityName?pageNum=${commodity.prePage}&commname=${name}">上一页</a></li>
                <c:forEach items="${commodity.navigatepageNums}" var="page">
                    <li><a href="/getCommodityName?pageNum=${page}&commname=${name}">${page}</a></li>
                </c:forEach>
                <li><a href="/getCommodityName?pageNum=${commodity.nextPage}&commname=${name}">下一页</a></li>
                <li><a href="/getCommodityName?pageNum=${commodity.pages}&commname=${name}">尾页</a></li>
            </ul>
        </div>
    </c:if>
</div>


<script>
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    });
</script>

</body>
</html>
