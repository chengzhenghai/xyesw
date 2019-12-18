<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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