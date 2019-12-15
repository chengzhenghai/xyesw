<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${elseInfo.username}的店铺</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp"%>

<h3 style="margin-left: 30px; margin-top: 20px">${elseInfo.username}的店铺</h3>
<hr>

<div style="border: 1px solid yellow; width: 1100px; height: auto; margin: auto">
    <table class="table" style="width: 1100px; table-layout:fixed;">
        <tr>
            <th style="width: 80px;">商品编号</th>
            <th style="width: 150px;">商品名称</th>
            <th style="width: 120px;">商品价格</th>
            <th style="width: 300px;">商品简介</th>
            <th style="width: 250px;">商品图片</th>
            <th style="width: 150px;">操作</th>
        </tr>
        <c:forEach items="${elseComm.list}" var="comm">
            <tr>
                <td class="commid" data-id="${comm.commid}">${comm.commid}</td>
                <td><textarea style="width: 140px; height: 100px; resize:none; border:0px;" readonly="readonly">${comm.commname}</textarea></td>
                <td>${comm.commmoney}</td>
                <td><textarea style="width: 290px; height: 100px; resize:none; border:0px;" readonly="readonly">${comm.commdrief}</textarea></td>
                <td><img style="width: auto; height: 100px" src="${comm.commimgpath}"/></td>
                <td><a style="text-decoration:none;" href="/commodityDetails?commid=${comm.commid}">
                        <button type="button" class="btn btn-primary">商品详情</button>
                </a></td>
            </tr>
        </c:forEach>
    </table>
</div>

<div style="width: auto; height: auto; text-align: center">
    <ul class="pagination">
        <li><a href="/userStore?pageNum=1">首页</a></li>
        <li><a href="/userStore?pageNum=${elseComm.prePage}">上一页</a></li>
        <c:forEach items="${elseComm.navigatepageNums}" var="page">
            <li><a href="/userStore?pageNum=${page}">${page}</a></li>
        </c:forEach>
        <li><a href="/userStore?pageNum=${elseComm.nextPage}">下一页</a></li>
        <li><a href="/userStore?pageNum=${elseComm.pages}">尾页</a></li>
    </ul>
</div>


<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    });
</script>

</body>
</html>
