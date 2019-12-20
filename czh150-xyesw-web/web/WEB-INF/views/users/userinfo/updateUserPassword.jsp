<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h3 style="margin-top: 20px">修改密码</h3>
<hr>
<form action="/updateUserPass" method="get">
    <input type="hidden" class="form-control" name="userid" value="${userid}">
    <div class="form-group" style="width: 500px; margin: auto; margin-top: 30px;">
        <label>原密码：<span id="panduan"></span></label>
        <input type="text" class="form-control" id="userpass" onkeyup="judge()">
    </div>
    <div class="form-group" style="width: 500px; margin: auto; margin-top: 30px;">
        <label>新密码：<span id="tishi2"></span></label>
        <input type="password" class="form-control" id="pwd1">
    </div>
    <div class="form-group" style="width: 500px; margin: auto; margin-top: 30px;">
        <label>再次输入新密码：<span id="tishi"></span></label>
        <input type="password" class="form-control" name="userpass" id="pwd2" onkeyup="validate()">
    </div>
    <div style="width: 500px; margin: auto; margin-top: 30px; text-align: center">
        <button type="submit" class="btn btn-primary" id="submit">确定修改</button>
        <a href="/userInfo">
            <button type="button" class="btn btn-primary">取消修改</button>
        </a>
    </div>
</form>

<script>
    function validate() {
        var pwd1 = document.getElementById("pwd1").value;
        var pwd2 = document.getElementById("pwd2").value;
        <!-- 对比两次输入的密码 -->
        if (pwd1 === pwd2) {
            document.getElementById("tishi").innerHTML = "<font color='green'>两次密码相同</font>";
        } else {
            document.getElementById("tishi").innerHTML = "<font color='red'>两次密码不相同</font>";
        }
        var tishi2 = document.getElementById("tishi2").innerText;
        if(tishi2 !== '') {
            document.getElementById("tishi2").innerHTML = "<font color='red'></font>";
        }
    }

    function judge() {
        var pwd1 = document.getElementById("userpass").value;
        var pwd2 = '${sessionScope.users.userpass}';
        if (pwd1 === pwd2) {
            document.getElementById("panduan").innerHTML = "<font color='green'>正确</font>";
        } else {
            document.getElementById("panduan").innerHTML = "<font color='red'>错误</font>";
        }
    }

    $("#submit").click(function () {
        var panduan = document.getElementById("panduan").innerText;
        var tishi = document.getElementById("tishi").innerText;
        if(panduan === '正确' && tishi === '两次密码相同') {
            return true
        } else {
            document.getElementById("tishi2").innerHTML = "<font color='red'>请输入</font>";
            return false
        }
    })

</script>
