<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table class="table table-hover">
    <tr>
        <th>编号</th>
        <th>用户id</th>
        <th>商品id</th>
        <th>评论内容</th>
        <th>评论时间</th>
    </tr>
    <c:forEach items="${entList.list}" var="ent">
        <tr>
            <td>${ent.commentid}</td>
            <td>${ent.userid}</td>
            <td>${ent.commid}</td>
            <td><p>${ent.commtext}</p></td>
            <td>${ent.commdate}</td>
        </tr>
    </c:forEach>
</table>

<div style="text-align: center">
    <ul class="pagination">
        <li><a id="1" class="comm-paging" style="cursor:pointer;">首页</a></li>
        <li><a id="${entList.prePage}" class="comm-paging" style="cursor:pointer;">上一页</a></li>
        <c:forEach items="${entList.navigatepageNums}" var="page">
            <li><a id="${page}" class="comm-paging" style="cursor:pointer;">${page}</a></li>
        </c:forEach>
        <li><a id="${entList.nextPage}" class="comm-paging" style="cursor:pointer;">下一页</a></li>
        <li><a id="${entList.pages}" class="comm-paging" style="cursor:pointer;">尾页</a></li>
    </ul>
</div>

<script>
    //分页
    $(".comm-paging").click(function () {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/commentList",
            data: {
                pageNum: $(this).attr("id")
            }
        }).done(function (res) {
            $(".layui-body").html(res);
        })
    });
</script>
