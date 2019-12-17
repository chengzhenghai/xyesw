<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3 style="margin-left: 30px; margin-top: 20px">学生信息</h3>
<hr>
<button type="button" class="btn btn-primary" id="insertStudent">添加学生</button>

<table class="table table-hover">
    <tr>
        <th>学号</th>
        <th>头像</th>
        <th>名称</th>
        <th>手机号</th>
        <th>收件地址</th>
        <th>发件地址</th>
        <th>状态</th>
        <th>修改状态</th>
    </tr>
    <c:forEach items="${student.list}" var="s">
        <tr>
            <td>${s.userid}</td>
            <td><img src="${s.userimg}" style="width: 50px; height: 50px"></td>
            <td>${s.username}</td>
            <td>${s.usernumber}</td>
            <td>${s.usershojian}</td>
            <td>${s.userfajian}</td>
            <td>${s.userstate}</td>
            <td>
                <c:if test="${s.userstate == '正常'}">
                    <a href="" style="text-decoration:none;">
                        <button type="button" class="layui-btn layui-btn-danger" state="封禁" id="${s.userid}">封禁账号</button>
                    </a>
                </c:if>
                <c:if test="${s.userstate == '封禁'}">
                    <a href="" style="text-decoration:none;">
                        <button type="button" class="layui-btn" state="正常" id="${s.userid}">解除封禁</button>
                    </a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>

<div style="text-align: center">
    <ul class="pagination">
        <li><a id="1" class="comm-paging" style="cursor:pointer;">首页</a></li>
        <li><a id="${student.prePage}" class="comm-paging" style="cursor:pointer;">上一页</a></li>
        <c:forEach items="${student.navigatepageNums}" var="page">
            <li><a id="${page}" class="comm-paging" style="cursor:pointer;">${page}</a></li>
        </c:forEach>
        <li><a id="${student.nextPage}" class="comm-paging" style="cursor:pointer;">下一页</a></li>
        <li><a id="${student.pages}" class="comm-paging" style="cursor:pointer;">尾页</a></li>
    </ul>
</div>

<script>
    //分页
    $(".comm-paging").click(function () {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/studentList",
            data: {
                pageNum: $(this).attr("id")
            }
        }).done(function (res) {
            $(".layui-body").html(res);
        })
    });

    //添加用户
    $("#insertStudent").click(function () {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/skipStudent",
        }).done(function (res) {
            $(".layui-body").html(res);
        })
    });

    //修改用户
    $(".layui-btn").click(function () {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/updateStudentState",
            data: {
                userid: $(this).attr("id"),
                userstate: $(this).attr("state")
            }
        })
    });
</script>


