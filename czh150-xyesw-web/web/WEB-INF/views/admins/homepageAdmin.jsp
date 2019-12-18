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
                    <a onclick="studentList()" style="cursor:pointer;">学生管理</a>
                </li>
                <li class="layui-nav-item">
                    <a onclick="commodityList()" style="cursor:pointer;">商品管理</a>
                </li>
                <li class="layui-nav-item">
                    <a onclick="commentList()" style="cursor:pointer;">评论管理</a>
                </li>
                <li class="layui-nav-item">
                    <a  style="cursor:pointer;">发布公告</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <h1>XYESW后台管理系统</h1>
    </div>

    <div class="layui-footer">
        <div id="div1"></div>
    </div>
</div>

<script>
    //所有学生的信息
    function studentList() {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/studentList",
        }).done(function (res) {
            $(".layui-body").html(res);
        })
    }
    //所有商品信息
    function commodityList() {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/commodityList"
        }).done(function (res) {
            $(".layui-body").html(res);
        })
    }
    //查询所有评论
    function commentList() {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/commentList"
        }).done(function (res) {
            $(".layui-body").html(res);
        })
    }

    // 页面加载时要做的事情
    window.onload=function(){
        //studentList();

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
