<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统公告</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp" %>

<h3 style="margin-left: 30px; margin-top: 20px">系统公告</h3>
<hr>

<div style="width: 1100px; height: auto; margin: auto">
    <table class="table table-hover">
        <tr>
            <th style="width: 200px;">发布时间</th>
            <th style="width: 250px;">公告图片</th>
            <th>公告详情</th>
        </tr>
        <c:forEach items="${anno.list}" var="a">
            <tr>
                <td><fmt:formatDate value="${a.onticedate}" pattern="yyyy-MM-dd hh-mm-ss"/></td>
                <td><img src="${a.onticeimg}" style="max-width: 250px; height: 100px;"/></td>
                <td>
                    <textarea class="form-control" style="height: 90px; resize: vertical;" readonly>${a.onticetext}</textarea>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div style="width: auto; height: auto; text-align: center">
    <ul class="pagination">
        <li><a href="/getAnnouncementAll?pageNum=1">首页</a></li>
        <li><a href="/getAnnouncementAll?pageNum=${anno.prePage}">上一页</a></li>
        <c:forEach items="${anno.navigatepageNums}" var="page">
            <li><a href="/getAnnouncementAll?pageNum=${page}">${page}</a></li>
        </c:forEach>
        <li><a href="/getAnnouncementAll?pageNum=${anno.nextPage}">下一页</a></li>
        <li><a href="/getAnnouncementAll?pageNum=${anno.pages}">尾页</a></li>
    </ul>
</div>

</body>
</html>
