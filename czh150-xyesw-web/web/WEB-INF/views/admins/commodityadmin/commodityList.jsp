<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <title>xyesw管理系统</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>

    <style>
        a:hover{text-decoration:none}
    </style>

</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">XYESW后台管理系统</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" style="text-decoration:none;">
                    欢迎管理员：${sessionScope.admin.adminname}
                </a>
            </li>
            <li class="layui-nav-item">
                <a href="/exitAdmin" style="text-decoration:none;">退出</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item">
                    <a href="/homepageAdmin" style="cursor:pointer;">主页</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/studentList" style="cursor:pointer;">学生管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/commodityList" style="cursor:pointer;">商品管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/commentList" style="cursor:pointer;">评论管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/adminAnnouncementAll" style="cursor:pointer;">系统公告</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">

        <h3 style="margin-left: 30px; margin-top: 10px;">商品管理</h3>
        <hr>

        <table class="table table-hover">
            <tr>
                <th>商品编号</th>
                <th>商品名</th>
                <th>商品价格</th>
                <th>商品图片</th>
                <th>商品简介</th>
                <th>商品状态</th>
                <th>商家</th>
            </tr>
            <c:forEach items="${commList.list}" var="s">
                <c:if test="${s.commstate == '在售中'}">
                    <tr>
                        <td>${s.commid}</td>
                        <td>${s.commname}</td>
                        <td>${s.commmoney}</td>
                        <td><img src="${s.commimgpath}" style="width: 50px; height: 50px"></td>
                        <td>${s.commdrief}</td>
                        <td>${s.commstate}</td>
                        <td>${s.username}</td>
                    </tr>
                </c:if>
            </c:forEach>
            <c:forEach items="${commList.list}" var="s">
                <c:if test="${s.commstate == '已出售'}">
                    <tr>
                        <td>${s.commid}</td>
                        <td>${s.commname}</td>
                        <td>${s.commmoney}</td>
                        <td><img src="${s.commimgpath}" style="width: 50px; height: 50px"></td>
                        <td>${s.commdrief}</td>
                        <td>${s.commstate}</td>
                        <td>${s.username}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>

        <div style="text-align: center">
            <ul class="pagination">
                <li><a id="1" class="comm-paging" style="cursor:pointer;">首页</a></li>
                <li><a id="${commList.prePage}" class="comm-paging" style="cursor:pointer;">上一页</a></li>
                <c:forEach items="${commList.navigatepageNums}" var="page">
                    <li><a id="${page}" class="comm-paging" style="cursor:pointer;">${page}</a></li>
                </c:forEach>
                <li><a id="${commList.nextPage}" class="comm-paging" style="cursor:pointer;">下一页</a></li>
                <li><a id="${commList.pages}" class="comm-paging" style="cursor:pointer;">尾页</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-footer">
        <div id="div1"></div>
    </div>
</div>


<script>
    //分页
    $(".comm-paging").click(function () {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/commodityList",
            data: {
                pageNum: $(this).attr("id")
            }
        }).done(function (res) {
            $(".layui-body").html(res);
        })
    });
</script>

<script>
    // 页面加载时要做的事情
    window.onload=function(){
        setInterval(function(){
            fnDate();
        },1000);
    };
</script>

<script>
    layui.use('element', function(){
        var element = layui.element;
    });
</script>

<script>
    //js 获取当前时间
    function fnDate(){
        var oDiv=document.getElementById("div1");
        var date=new Date();
        var year=date.getFullYear();//当前年份
        var month=date.getMonth();//当前月份
        var data=date.getDate();//天
        var hours=date.getHours();//小时
        var minute=date.getMinutes();//分
        var second=date.getSeconds();//秒
        var time=year+"-"+fnW((month+1))+"-"+fnW(data)+" "+fnW(hours)+":"+fnW(minute)+":"+fnW(second);
        oDiv.innerHTML=time;
    }
    //补位 当某个字段不是两位数时补0
    function fnW(str){
        var num;
        str>10?num=str:num="0"+str;
        return num;
    }
</script>
</body>
</html>
