<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付</title>
    <script src="/static/js/jquery-3.3.1.min.js"></script>
    <script src="/static/bootstrap/js/bootstrap.js"></script>
    <link href="/static/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/res/layui/css/layui.css"/>
    <script src="/static/res/layui/layui.js"></script>
</head>
<body>

<%@include file="../../navigationbar/navigationBar.jsp"%>

<h3 style="margin-left: 30px; margin-top: 20px">选择支付方式</h3>
<hr>

<div style="border: 1px solid yellow; width: 600px; height: 400px; margin: auto">
    <a href=""><img src="" title="微信" style="width: 200px; height: 200px; margin-top: 100px; margin-left: 50px"></a>
    <a href=""><img src="" title="支付宝" style="width: 200px; height: 200px; margin-top: 100px; margin-left: 100px"></a>
</div>


</body>
</html>
