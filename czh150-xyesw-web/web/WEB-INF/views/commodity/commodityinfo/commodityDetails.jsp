<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${commodity.commname}</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>

    <style>
        .comm-details {
            margin-top: 10px;
        }
    </style>

</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp" %>

<h3 style="margin-left: 30px; margin-top: 20px">商品详情</h3>
<hr>

<div style="border: 1px solid yellow; width: 1000px; height: 550px; margin: auto">
    <div style="border: 1px solid salmon; width: 550px; height: 500px; float: left; margin-left: 30px; margin-top: 30px;">
        <div style="width: 550px; height: 350px; text-align: center">
            <img src="${commodity.commimgpath}" alt="" id="datu" style="max-width: 550px; height: 80%; margin-top: 40px"/>
        </div>
        <div style="width: 540px; height: 130px; margin: auto; overflow-x: auto; white-space: nowrap;">
            <img src="${commodity.commimgpath}" class="xiaotu" style="width: auto; height: 100px; margin-left: 10px; cursor:pointer;"/>
            <c:forEach items="${commodityImg}" var="img">
                <img src="${img.commimgpath}" class="xiaotu" style="width: auto; height: 100px; margin-left: 10px; cursor:pointer;"/>
            </c:forEach>
        </div>
    </div>
    <div style="border: 1px silver solid; width: 350px; height: 500px; float: right; margin-right: 30px; margin-top: 30px;">
        <h1 class="comm-details">${commodity.commname}</h1>
        <div class="comm-details">
            <span style="font-size: 20px">商品价格：￥</span>
            <span style="color: red; font-size: 25px">${commodity.commmoney}</span>
        </div>
        <c:if test="${sessionScope.users.userid == userinfo.userid}">
            <div class="comm-details">
                <span style="font-size: 20px">商&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家：</span>
                <span style="color: red; font-size: 20px"><a href="/userStore">${userinfo.username}</a></span>
            </div>
            <div class="comm-details">
                <span style="font-size: 20px">商品简介：</span>
                <textarea class="form-control" style="resize:none; background: rgba(0, 0, 0, 0); margin-top: 20px; height: 250px" readonly>${commodity.commdrief}</textarea>
            </div>
            <div class="comm-details" style="margin-left: 30px;">
                <a href="/userStore">
                    <button type="button" class="btn btn-primary">我的商品</button>
                </a>
            </div>
        </c:if>
        <c:if test="${sessionScope.users.userid != userinfo.userid}">
            <div class="comm-details">
                <span style="font-size: 20px">商&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家：</span>
                <span style="color: red; font-size: 20px">
                    <a href="/elseUserStores?userid=${userinfo.userid}">${userinfo.username}</a>
                </span>
            </div>
            <div class="comm-details">
                <label style="font-size: 20px;">商品简介：</label>
                <textarea class="form-control" style="resize:none; background: rgba(0, 0, 0, 0); margin-top: 20px; height: 250px" readonly>${commodity.commdrief}</textarea>
            </div>
            <c:if test="${userinfo.userstate == '封禁'}">
                <button type="button" class="layui-btn layui-btn-danger">该账号已封禁</button>
            </c:if>
            <c:if test="${userinfo.userstate == '正常'}">
                <c:if test="${commodity.commstate == '在售中'}">
                    <div class="comm-details" style="margin-left: 30px;">
                        <a href="/userRelation?commid=${commodity.commid}&userid=${userinfo.userid}">
                            <button type="button" class="btn btn-primary">我想要</button>
                        </a>
                    </div>
                </c:if>
                <c:if test="${commodity.commstate == '已出售'}">
                    <button type="button" class="layui-btn layui-btn-danger">已出售</button>
                </c:if>
            </c:if>
        </c:if>
    </div>
</div>

<div style="border: 1px solid yellow; width: 1000px; height: auto; margin: auto">
    <div style="width: 1000px; height: 90px; border-bottom: 1px solid yellow; margin-top: 10px;">
        <form method="get" action="/insertComment">
            <img src="${sessionScope.userinfo.userimg}"
                 style="width: 50px; height: 50px; float: left; margin-left: 20px">
            <div class="form-group">
                <textarea class="form-control" style="width: 830px; float: left; margin-left: 20px; resize:none;"
                          rows="3" name="commtext" placeholder="请输入评论。"></textarea>
            </div>
            <input type="hidden" name="userid" value="${sessionScope.users.userid}">
            <input type="hidden" name="commid" value="${commodity.commid}">
            <button type="submit" class="btn btn-primary" style="float: left; margin-left: 10px; margin-top: 38px">评论
            </button>
        </form>
    </div>
    <div style="width: 1000px; height: auto;">
        <c:forEach items="${comment.list}" var="ent">
            <div style="width: 800px; height: auto; border: 1px solid salmon; margin: auto; margin-top: 10px; border-radius:10px 10px;">
                <div style="width: auto; height: auto; float: left; margin-top: 25px; margin-left: 25px"
                     title="${ent.username}">
                    <a href="/userStore">
                        <img src="${ent.userimg}" style="width: 60px; height: 60px; border-radius:50%;">
                    </a>
                </div>
                <div style="width: 650px; height: auto; float: left; margin-top: 15px; margin-left: 25px">
                    <div class="form-group">
                        <c:if test="${userinfo.userid == ent.userid}">
                            <label>《商家》${ent.username}</label>
                        </c:if>
                        <c:if test="${userinfo.userid != ent.userid}">
                            <label>${ent.username}</label>
                        </c:if>
                        <textarea class="form-control" style="resize:none;" readonly>评论：${ent.commtext}</textarea>
                    </div>
                    <p>评论时间：<fmt:formatDate value="${ent.commdate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
                </div>
                <div style="clear: both; margin-bottom: 5px"></div>
            </div>
        </c:forEach>
        <div style="height: 20px"></div>
    </div>
</div>

<div style="text-align: center">
    <ul class="pagination">
        <li><a href="/commodityDetails?commid=${commodity.commid}&pageNum=1">首页</a></li>
        <li><a href="/commodityDetails?commid=${commodity.commid}&pageNum=${comment.prePage}">上一页</a></li>
        <c:forEach items="${comment.navigatepageNums}" var="page">
            <li><a href="/commodityDetails?commid=${commodity.commid}&pageNum=${page}">${page}</a></li>
        </c:forEach>
        <li><a href="/commodityDetails?commid=${commodity.commid}&pageNum=${comment.nextPage}">下一页</a></li>
        <li><a href="/commodityDetails?commid=${commodity.commid}&pageNum=${comment.pages}">尾页</a></li>
    </ul>
</div>


<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element;
    });
</script>

<script>
    $(".xiaotu").click(function () {
        var xiaotu = $(this)[0].src;
        $("#datu").attr('src',xiaotu);
    })
</script>

</body>
</html>
