<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        <h3 style="margin-left: 30px; margin-top: 10px">系统公告</h3>
        <hr>
        <button type="button" class="btn btn-primary" id="insertStudent">发布公告</button>
        <table class="table table-hover">
            <tr>
                <th style="width: 200px;">发布时间</th>
                <th style="width: 250px;">公告图片</th>
                <th>公告详情</th>
                <th style="width: 100px;">操作</th>
            </tr>
            <c:forEach items="${anno.list}" var="a">
                <tr>
                    <td><fmt:formatDate value="${a.onticedate}" pattern="yyyy-MM-dd hh-mm-ss"/></td>
                    <td><img src="${a.onticeimg}" style="max-width: 250px; height: 100px;"/></td>
                    <td>
                        <textarea class="form-control" style="height: 90px; resize: vertical;" readonly>${a.onticetext}</textarea>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary">修改公告</button>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <div style="width: auto; height: auto; text-align: center">
            <ul class="pagination">
                <li><a href="/adminAnnouncementAll?pageNum=1">首页</a></li>
                <li><a href="/adminAnnouncementAll?pageNum=${anno.prePage}">上一页</a></li>
                <c:forEach items="${anno.navigatepageNums}" var="page">
                    <li><a href="/adminAnnouncementAll?pageNum=${page}">${page}</a></li>
                </c:forEach>
                <li><a href="/adminAnnouncementAll?pageNum=${anno.nextPage}">下一页</a></li>
                <li><a href="/adminAnnouncementAll?pageNum=${anno.pages}">尾页</a></li>
            </ul>
        </div>

    </div>

    <div class="layui-footer">
        <div id="div1"></div>
    </div>
</div>

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
