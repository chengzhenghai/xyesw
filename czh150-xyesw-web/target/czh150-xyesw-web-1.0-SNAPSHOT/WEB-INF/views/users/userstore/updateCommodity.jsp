<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改商品</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp"%>

<div style="margin-left: 30px; margin-top: 20px;">
    <span style="font-size: 25px">修改商品</span>
    <span>
        <a href="/userStore?userid=${sessionScope.users.userid}" style="text-decoration:none;">
            <button type="button" class="btn btn-primary">取消</button>
        </a>
    </span>
</div>
<hr>

<div style="margin: auto; width: 800px; height: auto;">
    <form method="post" action="/updateMyComm" enctype="multipart/form-data">
        <input type="hidden" name="commimgpath" value="${comm.commimgpath}" readonly="readonly">
        <input type="hidden" name="commid" value="${comm.commid}" readonly="readonly">
        <div class="form-group">
            <label for="exampleFormControlInput1">商品名称：</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="请输入商品名称" name="commname" value="${comm.commname}">
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput2">商品价格：</label>
            <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="请输入商品价格" name="commmoney" value="${comm.commmoney}">
        </div>
        <div class="form-group">
            <label for="exampleFormControlSelect3">商品类型：</label>
            <select class="form-control" id="exampleFormControlSelect3" name="typesid">
                <option value="${type.typesid}">${type.typestext}</option>
                <c:forEach items="${commtypes}" var="type">
                    <option value="${type.typesid}">${type.typestext}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="exampleFormControlTextarea4">商品简介：</label>
            <textarea class="form-control" id="exampleFormControlTextarea4" rows="3" name="commdrief" placeholder="请输入商品简介">${comm.commdrief}</textarea>
        </div>
        <div class="form-group">
            <label for="exampleFormControlFile5">商品图片：</label>
            <input type="file" class="form-control-file" id="exampleFormControlFile5" name="img">
        </div>
        <img id="exampleFormControlFile6" src="${comm.commimgpath}" style="width:200px; height:auto;"/>
        <button type="submit" class="btn btn-primary" style="float: right">修改</button>
    </form>
</div>

<script>
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
            , element = layui.element;
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
