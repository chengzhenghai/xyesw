<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${commstype != ''}">
    <c:forEach items="${commstype.list}" var="comm">
        <a href="/commodityDetails?commid=${comm.commid}">
            <c:if test="${comm.commstate == '在售中'}">
                <c:if test="${comm.userid == sessionScope.users.userid}">
                    <div class="my-comm"
                         style="border: 1px solid red; float: left; margin-left: 20px; margin-top: 20px; width: 220px; border-radius:10px 10px;">
                        <div style="width: auto; height: auto; text-align: center; margin-top: 10px">
                            <img style="max-width: 200px; height: 200px;" src="${comm.commimgpath}"/>
                        </div>
                        <div style="margin-left: 10px">${comm.commname}</div>
                        <div style="margin-left: 10px">￥ ${comm.commmoney}</div>
                    </div>
                </c:if>
                <c:if test="${comm.userid != sessionScope.users.userid}">
                    <div style="border: 1px solid greenyellow; float: left; margin-left: 20px; margin-top: 20px; width: 220px; border-radius:10px 10px;">
                        <div style="width: auto; height: auto; text-align: center; margin-top: 10px">
                            <img style="max-width: 200px; height: 200px;" src="${comm.commimgpath}"/>
                        </div>
                        <div style="margin-left: 10px">${comm.commname}</div>
                        <div style="margin-left: 10px">￥ ${comm.commmoney}</div>
                    </div>
                </c:if>
            </c:if>
        </a>
    </c:forEach>
    <div style="clear: both; margin-bottom: 20px"></div>

    <div style="text-align: center" class="comm-fenye" id="${typesid}">
        <ul class="pagination">
            <li><a id="1" class="comm-paging" style="cursor:pointer;">首页</a></li>
            <li><a id="${commstype.prePage}" class="comm-paging" style="cursor:pointer;">上一页</a></li>
            <c:forEach items="${commstype.navigatepageNums}" var="page">
                <li><a id="${page}" class="comm-paging" style="cursor:pointer;">${page}</a></li>
            </c:forEach>
            <li><a id="${commstype.nextPage}" class="comm-paging" style="cursor:pointer;">下一页</a></li>
            <li><a id="${commstype.pages}" class="comm-paging" style="cursor:pointer;">尾页</a></li>
        </ul>
    </div>
</c:if>
<c:if test="${commstype == ''}">
    <h2 style="text-align: center; margin-top: 20px">没有这种类型的商品！</h2>
</c:if>

<script>
    //分页
    $(".comm-paging").click(function () {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/commType",
            data: {
                typesid: $(".comm-fenye").attr("id"),
                pageNum: $(this).attr("id")
            }
        }).done(function (res) {
            $(".comms").html(res);
        })
    });
</script>