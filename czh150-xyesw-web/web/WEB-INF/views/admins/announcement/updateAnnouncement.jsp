<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3 style="margin-left: 30px; margin-top: 10px">修改公告</h3>
<hr>

<div style="width: 700px; height: auto; margin: auto; margin-top: 30px;">

    <form action="/updateAnnouncement" method="post" enctype="multipart/form-data">
        <input type="hidden" value="${onticeid}" name="onticeid">
        <div class="form-group">
            <label>图片：</label>
            <input type="file" class="form-control-file" id="exampleFormControlFile5" name="onticeimg">
        </div>
        <input type="hidden" value="${onticeimg}" name="img">
        <img id="exampleFormControlFile6" src="${onticeimg}" style="width:auto; height:100px;"/>
        <div class="form-group">
            <label>详情：</label>
            <textarea class="form-control" id="exampleFormControlTextarea4" name="onticetext" style="height: 250px; resize: vertical;" placeholder="请输入">${onticetext}</textarea>
        </div>
        <a href="/adminAnnouncementAll">
            <button type="button" class="btn btn-danger" style="float: right">取消</button>
        </a>
        <button type="submit" class="btn btn-primary" style="float: right">修改</button>
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
