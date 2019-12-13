<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品图片</title>
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
                    <input type="text" name="commname" lay-verify="title"  placeholder="请输入"
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
<a href="/userStore?userid=${sessionScope.users.userid}" style="text-decoration:none;">
    <button type="button" class="btn btn-primary">返回</button>
</a>
<h3 style="margin-left: 30px; margin-top: 20px">更多商品图片</h3>
<hr>
<h3 style="margin-left: 30px; margin-top: 20px">上传商品图片</h3>
<hr>
<div style="width:300px; height: auto; position:relative; margin-bottom: 10px">
    <form action="/insertCommImg" method="post" enctype="multipart/form-data">
        <input type="hidden" name="commid" value="${commid}" readonly="readonly">
        <div class="form-group">
            <label for="exampleFormControlFile5">商品图片：</label>
            <span style="color: red;">${commimgpath}</span>
            <input type="file" class="form-control-file" id="exampleFormControlFile5" name="commimgpath">
        </div>
        <img id="exampleFormControlFile6" src="" style="width:auto; height:100px;"/>
        <button type="submit" class="btn btn-primary" style="position: absolute; bottom: 0; right: 0">上传商品图片</button>
    </form>
</div>

<div style="text-align: center">
    <table class="table">
        <tr>
            <th style="text-align: center">图片</th>
            <th style="text-align: center">删除</th>
            <th style="text-align: center">修改</th>
        </tr>
        <c:forEach items="${commImgs}" var="img">
            <tr style="text-align: center">
                <td>
                    <img style="width: auto; height: 100px" src="${img.commimgpath}">
                </td>
                <td>
                    <a style="text-decoration:none;" href="/deleteCommImg?commimg=${img.commimg}&commid=${img.commid }" onClick="return confirm('确定要删除吗？');">
                        <button type="button" class="btn btn-primary">删除</button>
                    </a>&nbsp;
                </td>
                <td>
                    <div>
                        <form method="post" action="/updateCommImg" enctype="multipart/form-data">
                            <input type="hidden" name="commimg" value="${img.commimg}">
                            <input type="hidden" name="commid" value="${img.commid}">
                            <input style="margin: auto" type="file" name="commimgpath">
                            <input type="submit" class="btn btn-primary" value="更改">
                        </form>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
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
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    });
</script>

</body>
</html>
