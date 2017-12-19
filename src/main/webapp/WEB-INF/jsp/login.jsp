<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/15 0015
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>后台登录</title>

    <link href="login/css/login.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="select/dist/css/bootstrap-select.css">

</head>
<body>
<div style="padding-left: 15px;padding-right: 10px">
<div class="login">
    <div class="message" style="padding-bottom: 40px">
        <div style="float: left;font-size: 16px">教师职位</div>
        <div style="float: left;padding-bottom: 10px" >
             </div>

    </div>
    <div id="darkbannerwrap"></div>

    <form method="post" action="dologin">
        <input name="action" value="login" type="hidden">
        <input name="number" placeholder="用户名" required="" type="text">
        <hr class="hr15">
        <input name="password" placeholder="密码" required="" type="password">
        <hr class="hr15">
        <input value="登录" style="width:100%;" type="submit">
        <hr class="hr20">
        <!-- 帮助 <a onClick="alert('请联系管理员')">忘记密码</a> -->
    </form>



</div>
</div>
<script src="table/js/jquery.min.js"></script>
<script src="table/js/bootstrap.min.js"></script>
<script src="select/js/bootstrap-select.js"></script>
</body>
</html>
