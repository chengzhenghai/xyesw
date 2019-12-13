<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 40px; font-family: 楷体">XYESW</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/homepage" style="text-decoration:none;">首页</a></li>
            <li class="layui-nav-item"><a href="/userStore" style="text-decoration:none;">我的店铺</a></li>
            <li class="layui-nav-item"><a href="/userOrder" style="text-decoration:none;">我的订单</a></li>
            <li class="layui-nav-item"><a href="/userInfo" style="text-decoration:none;">我的信息</a></li>
        </ul>
        <form method="get" action="/getCommodityName">
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <input type="text" name="commname" lay-verify="title" placeholder="请输入"
                           class="layui-input">
                </li>
                <li class="layui-nav-item">
                    <input class="layui-btn" type="submit" value="查询">
                </li>
                <li class="layui-nav-item">
                    <a href="" style="text-decoration:none;">
                        <img src="${sessionScope.userinfo.userimg}" class="layui-nav-img">
                        ${sessionScope.userinfo.username}
                    </a>
                </li>
                <li class="layui-nav-item"><a href="/exitUser" style="text-decoration:none;">退出</a></li>
            </ul>
        </form>
    </div>
</div>

<div style="margin-left: 30px; margin-top: 20px; ">
    <span style="font-size: 25px">添加商品</span>
    <span>
        <a href="/userStore?userid=${sessionScope.users.userid}" style="text-decoration:none;">
            <button type="button" class="btn btn-primary">取消</button>
        </a>
    </span>
</div>
<hr>

<div style=" margin: auto; width: 800px; height: auto;">
    <form method="post" action="/insertMyComm" enctype="multipart/form-data">
        <input type="hidden" name="userid" value="${sessionScope.users.userid}" readonly="readonly">
        <div class="form-group">
            <label for="exampleFormControlInput1">商品名称：</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="请输入商品名称" name="commname">
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2">商品价格：</label>
            <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="请输入商品价格" name="commmoney">
        </div>
        <div class="form-group">
            <label for="exampleFormControlSelect3">商品类型：</label>
            <select class="form-control" id="exampleFormControlSelect3" name="typesid">
                <option value="">请选择商品类型</option>
                <c:forEach items="${commtype}" var="type">
                    <option value="${type.typesid}">${type.typestext}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleFormControlTextarea4">商品简介：</label>
            <textarea class="form-control" id="exampleFormControlTextarea4" rows="3" name="commdrief" placeholder="请输入商品简介"></textarea>
        </div>
        <div class="form-group">
            <label for="exampleFormControlFile5">商品图片：</label>
            <input type="file" class="form-control-file" id="exampleFormControlFile5" name="img">
        </div>
        <img id="exampleFormControlFile6" src="" style="width:200px; height:auto;"/>
        <button type="submit" class="btn btn-primary" style="float: right">添加</button>
    </form>
</div>

<script>
    //显示图片
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#exampleFormControlFile6').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#exampleFormControlFile5").change(function () {
        readURL(this);
    });
</script>

<script>
    layui.use('element', function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    });
</script>

<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
</script>

</body>
</html>
