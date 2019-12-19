<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的店铺</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp" %>

<h3 style="margin-left: 30px; margin-top: 20px">我的店铺：在售商品</h3>
<hr>

<a href="/insertComm" style="text-decoration:none;">
    <button type="button" class="btn btn-primary">添加商品</button>
</a>

<div style="width: 1100px; height: auto; margin: auto">
    <table class="table table-hover" style="width: 1000px; table-layout:fixed;">
        <tr>
            <th style="width: 80px;">商品编号</th>
            <th style="width: 150px;">商品名称</th>
            <th style="width: 120px;">商品价格</th>
            <th style="width: 250px;">商品简介</th>
            <th style="width: 200px;">商品图片</th>
            <th style="width: 300px;">操作</th>
        </tr>
        <c:forEach items="${myComm.list}" var="mycomm">
            <c:if test="${mycomm.commstate == '在售中'}">
                <tr>
                    <td class="commid" data-id="${mycomm.commid}">${mycomm.commid}</td>
                    <td><textarea
                            style="width: 140px; height: 100px; resize:none; background: transparent; border-style: none;"
                            readonly="readonly">${mycomm.commname}</textarea></td>
                    <td>${mycomm.commmoney}</td>
                    <td><textarea
                            style="width: 240px; height: 100px; resize:none; background: transparent; border-style: none;"
                            readonly="readonly">${mycomm.commdrief}</textarea></td>
                    <td><img style="max-width: 200px; height: 100px" src="${mycomm.commimgpath}"/></td>
                    <td>
                        <a style="text-decoration:none;" href="/deleteMyComm?commid=${mycomm.commid}" onClick="return confirm('确定要删除吗？');">
                            <button type="button" class="btn btn-danger">删除</button>
                        </a>&nbsp;
                        <a style="text-decoration:none;" href="/updateComm?commid=${mycomm.commid}">
                            <button type="button" class="btn btn-primary">修改</button>
                        </a>&nbsp;
                        <a style="text-decoration:none;" href="/commImgs?commid=${mycomm.commid}">
                            <button type="button" class="btn btn-primary">更多商品图片</button>
                        </a><br>
                        <a href="/commodityDetails?commid=${mycomm.commid}">
                            <button type="button" class="btn btn-primary" style="margin-top: 10px">商品出售页面</button>
                        </a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</div>
<div style="width: auto; height: auto; text-align: center">
    <ul class="pagination">
        <li><a href="/userStore?pageNum=1">首页</a></li>
        <li><a href="/userStore?pageNum=${myComm.prePage}">上一页</a></li>
        <c:forEach items="${myComm.navigatepageNums}" var="page">
            <li><a href="/userStore?pageNum=${page}">${page}</a></li>
        </c:forEach>
        <li><a href="/userStore?pageNum=${myComm.nextPage}">下一页</a></li>
        <li><a href="/userStore?pageNum=${myComm.pages}">尾页</a></li>
    </ul>
</div>

<h3 style="margin-left: 30px; margin-top: 20px">已售商品</h3>
<hr>

<div style="width: 1100px; height: auto; margin: auto">
    <table class="table table-hover" style="width: 1000px; table-layout:fixed;">
        <tr>
            <th style="width: 80px;">商品编号</th>
            <th style="width: 150px;">商品名称</th>
            <th style="width: 120px;">商品价格</th>
            <th style="width: 250px;">商品简介</th>
            <th style="width: 200px;">商品图片</th>
            <th style="width: 300px;">操作</th>
        </tr>
        <c:forEach items="${myComm.list}" var="mycomm">
            <c:if test="${mycomm.commstate != '在售中'}">
                <tr>
                    <td class="commid" data-id="${mycomm.commid}">${mycomm.commid}</td>
                    <td><textarea
                            style="width: 140px; height: 100px; resize:none; background: transparent; border-style: none;"
                            readonly="readonly">${mycomm.commname}</textarea></td>
                    <td>${mycomm.commmoney}</td>
                    <td><textarea
                            style="width: 240px; height: 100px; resize:none; background: transparent; border-style: none;"
                            readonly="readonly">${mycomm.commdrief}</textarea></td>
                    <td><img style="max-width: 200px; height: 100px" src="${mycomm.commimgpath}"/></td>
                    <td>
                        <a style="text-decoration:none;" href=""
                           onClick="return confirm('确定要重新上架吗？');">
                            <button type="button" class="btn btn-danger">重新上架</button>
                        </a>
                    </td>
                </tr>
            </c:if>
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
