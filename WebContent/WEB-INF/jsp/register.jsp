<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <style>


    </style>
</head>
<body>
<div id="sky"></div>
<div id="head"></div>
<div id="middle">
    <form id="formd" action="${pageContext.request.contextPath}/user_register.action" method="post">
        <ul style="text-align: center;">
            <li style="font-size: 48px">畅享物联网平台</li>
            <li><input id="username" class="name" name="username" type="text" minlength="2" placeholder="请输入用户名(最少的个字母)" required><span></span></li>
            <li><input id="email" class="name" name="email" type="email" placeholder="请输入邮箱" required><span></span></li>
            <li><input id="phone" class="name" name="phone" type="text" placeholder="请输入手机号码" required><span></span></li>
            <li><input id="password" type="password" name="password" class="pwd" placeholder="请输入密码(最少个字符)" required><span></span></li>
            <li><input id="confirm_password" type="password" name="rpassword" class="pwd" placeholder="请重复密码" required><span></span></li>
            <li>
                <button type="submit" id="login" onclick = "checkUsers();">取消</button>
                <button type="button" id="register" onclick = "pleaseUser();">确认</button>
            </li>
            <li><span id="err" style="display: inline-block;"></span></li>
        </ul>
    </form>
</div>

<div id="cloud"></div>



<script language='javascript' type='text/javascript'>


    function pleaseUser(){
        // $('#register').onclick="javascript:window.location.href='index.html'";
        window.open("login.html");
    }
    function checkUsers(){
        window.open("register.html");
    }
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/register.js"></script>
</body>
</html>