<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<style>
body{
  background:url(${pageContext.request.contextPath}/images/bg.png) repeat-x;
  min-height: 600px;
  position: relative;

}

 *{font-family:"微软雅黑"; margin:0; padding:0; border:0; font-size:14px;color:white;}
  html,body{height:100%; width:100%;;}



.name,.pwd{            
  width: 310px;
  height: 44px;
  line-height: 44px;
  padding-left: 15px;
  outline: none;
  border-radius: 20px;
  background-color: #0A3C78;
  border: 1px solid #329BE0;
}
.name:hover,.pwd:hover,.name:focus,.pwd:focus{

	  background-color: #052b64;
}

#login{

  background: #3fb9ff;
  font-size: 18px;
  width: 150px;
  height: 44px;
  outline: none;
  color: white;
  background: -webkit-linear-gradient(#3fb9ff, #099be7, #229de3);
  background: -o-linear-gradient(#3fb9ff, #099be7, #229de3);
  background: -moz-linear-gradient(#3fb9ff, #099be7, #229de3);
  background: linear-gradient(#3fb9ff, #099be7, #229de3);
  border-radius: 20px;
  margin-right: 23px;
}
#login:hover{
  background: -webkit-linear-gradient(#229de3, #099be7,#3fb9ff);
  background: -o-linear-gradient(#229de3, #099be7,#3fb9ff);
  background: -moz-linear-gradient(#229de3, #099be7,#3fb9ff);
  background: linear-gradient(#229de3, #099be7,#3fb9ff);
}
#register{

  background: #3fb9ff;
  font-size: 18px;
  width: 150px;
  height: 44px;
  outline: none;
  color: white;
  background: -webkit-linear-gradient(#3fb9ff, #099be7, #229de3);
  background: -o-linear-gradient(#3fb9ff, #099be7, #229de3);
  background: -moz-linear-gradient(#3fb9ff, #099be7, #229de3);
  background: linear-gradient(#3fb9ff, #099be7, #229de3);
  border-radius: 20px;
}
#register:hover{
  background: -webkit-linear-gradient(#229de3, #099be7,#3fb9ff);
  background: -o-linear-gradient(#229de3, #099be7,#3fb9ff);
  background: -moz-linear-gradient(#229de3, #099be7,#3fb9ff);
  background: linear-gradient(#229de3, #099be7,#3fb9ff);
}


#head{
    height: 50px;
	padding-top: 25px;
	margin-left: 14px;
}
#middle{
  margin-top: 100px;
  /* height:600px; */

}

 #middle li {
 list-style-type:none;
 margin-top: 15px;
 }
 
#cloud{
  background: url(${pageContext.request.contextPath}/images/cloud.png) repeat;
  width: 100%;
  height: 356px;
  position: absolute;
  bottom: 0px;
  -webkit-animation: cloud 60s linear infinite alternate;
  -moz-animation: clouds 60s linear infinite alternate;
 
   
  z-index: -10;

}

 @-webkit-keyframes cloud { 
    0%{background-position:top left} 
    100%{background-position:top right} 
 }
 
 @-moz-keyframes clouds { 
    0%{background-position:top left} 
    100%{background-position:top right} 
 }
   
   #err{
     display:none;
     color:red;
   }
   #sky{
  background: url(${pageContext.request.contextPath}/images/sky.png) repeat;
  width: 100%;
  heigth: 462px;
  z-index: -20;
  height: 462px;
  position: absolute;
  top: 0px;
   }
   
   
</style>
</head>
<body>
<div id="sky"></div>
<div id="head"></div>
<div id="middle">
<form id="formd" action="${pageContext.request.contextPath }/user_login.action" method="post">
<ul style="text-align: center;">
<li style="font-size: 48px">畅享物联网平台</li>

<li><input class="name" name="username" placeholder="请输入用户名"></li>
<li><input type="password" name="password" class="pwd" placeholder="请输入密码"></li>
<li><button type="submit" id="login" onclick = "checkUsers();">登录</button><button type="button" id="register" onclick = "pleaseUser();">注册</button></li>
<li><span id="err" style="display: inline-block;"></span></li>
						
					

</ul>
</form>
</div>

<div id="cloud"></div>



  <script src="jquery.min.js" type="text/javascript" charset="UTF-8"></script>
 <script language='javascript' type='text/javascript'>
  $(document).ready(function() {
            checkUsers();
            pleaseUser();
          
 });

function pleaseUser(){
  // $('#register').onclick="javascript:window.location.href='index.html'";
  window.open("${pageContext.request.contextPath}/user_registerPage.action");
}

 </script>


</body>
</html>