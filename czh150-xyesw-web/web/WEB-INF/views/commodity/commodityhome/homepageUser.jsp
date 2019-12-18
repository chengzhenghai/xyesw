<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>xyesw首页</title>
    <script src="/static/js/jquery.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp" %>

<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" style="width: 950px; margin: auto">
    <ul class="layui-tab-title">
        <li class="layui-this"><a href="/homepage" style="text-decoration:none; font-size: 20px">所有商品</a></li>
        <c:forEach items="${typeall}" var="type">
            <li style="margin-left: 15px">
                <a class="comm-type" id="${type.typesid}" style="text-decoration:none; font-size: 20px">${type.typestext}</a>
            </li>
        </c:forEach>
    </ul>
</div>

<div class="comms" style="width: 1000px; height: auto; margin: auto;">
    <c:forEach items="${commall.list}" var="comms">
        <a href="/commodityDetails?commid=${comms.commid}">
            <c:if test="${comms.commstate == '在售中'}">
                <c:if test="${comms.userid == sessionScope.users.userid}">
                    <div class="my-comm" style="border: 1px solid red; float: left; margin-left: 20px; margin-top: 20px; width: 220px; border-radius:10px 10px;">
                        <div style="width: auto; height: auto; text-align: center; margin-top: 10px">
                            <img style="max-width: 200px; height: 200px;" src="${comms.commimgpath}"/>
                        </div>
                        <div style="margin-left: 10px; height: 20px;">${comms.commname}</div>
                        <div style="margin-left: 10px; height: 20px;">￥ ${comms.commmoney}</div>
                    </div>
                </c:if>
                <c:if test="${comms.userid != sessionScope.users.userid}">
                    <div style="border: 1px solid greenyellow; float: left; margin-left: 20px; margin-top: 20px; width: 220px; border-radius:10px 10px;">
                        <div style="width: auto; height: auto; text-align: center; margin-top: 10px">
                            <img style="max-width: 200px; height: 200px;" src="${comms.commimgpath}"/>
                        </div>
                        <div style="margin-left: 10px; height: 20px;">${comms.commname}</div>
                        <div style="margin-left: 10px; height: 20px;">￥ ${comms.commmoney}</div>
                    </div>
                </c:if>
            </c:if>
        </a>
    </c:forEach>
    <div style="clear: both; margin-bottom: 20px"></div>

    <div style="text-align: center">
        <ul class="pagination">
            <li><a href="/homepage?pageNum=1">首页</a></li>
            <li><a href="/homepage?pageNum=${commall.prePage}">上一页</a></li>
            <c:forEach items="${commall.navigatepageNums}" var="page">
                <li><a href="/homepage?pageNum=${page}">${page}</a></li>
            </c:forEach>
            <li><a href="/homepage?pageNum=${commall.nextPage}">下一页</a></li>
            <li><a href="/homepage?pageNum=${commall.pages}">尾页</a></li>
        </ul>
    </div>

</div>

<script>
    //商品类型异步
    $(".comm-type").click(function () {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/commType",
            data: {
                typesid: $(this).attr("id")
            }
        }).done(function (res) {
            $(".comms").html(res);
        })
    });

</script>

<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element;
    });
</script>

</body>
</html>
