<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>APP下载</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/semantic.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/init.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleApp.css">
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/semantic.min.js"></script>
</head>
<body>
<!--导航-->
<div id="nav">
  <ul class="daohang">
    <li><center><a href="${pageContext.request.contextPath}/index.action">畅享首页</a></center></li>
    <li><center><a href="${pageContext.request.contextPath}/equipmenttype_findAll.action">畅享基地</a></center></li>
    <li><center><a href="http://139.199.97.82:8080/shop/index.action">畅享商城</a></center></li>
    <li><center><a href="${pageContext.request.contextPath}/data_data.action">畅享服务</a></center></li>
    <li class="act"><center><a href="#">App下载</a></center></li>
  </ul>
  <ul class="daohang" id="tets">
    <li><center><a href="login.html">登录</a></center></li>
    <li><center><a href="register.html">注册</a></center></li>
  </ul>
</div>
<!--主要内容-->
<div id="content">
  <div id="card">
    <div id="card_android">
      <p>Android 下载</p>
      <img src="${pageContext.request.contextPath}/images/base/shebei1.png">
    </div>
    <div id="card_ios">
      <p>ios 下载</p>
      <img src="${pageContext.request.contextPath}/images/base/shebei1.png">
    </div>
  </div>
</div>
<!--底部-->
<div id="footer">
  <div class="jiathis_style_24x24">
         <!-- <p class="pull-right"><a href="#">返回顶部</a></p> -->
         <a class="jiathis_button_qzone"></a>
         <a class="jiathis_button_tsina"></a>
         <a class="jiathis_button_tqq"></a>
         <a class="jiathis_button_weixin"></a>
         <a class="jiathis_button_renren"></a>
         <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
  </div>
  <div id="footer_link">
    <ul>
      <li><a href="test.html">网站首页</a></li>
      <li><a href="changxiangAbout.html#4">联系我们</a></li>
      <li><a href="changxiangAbout.html#6">企业合作</a></li>
      <li><a href="changxiangAbout.html#3">人才招聘</a></li>
      <li><a href="changxiangAbout.html">常见问题</a></li>
      <li><a href="changxiangAbout.html#5">意见反馈</a></li>
      <li><a href="changxiangAbout.html#7">友情链接</a></li>
    </ul>
  </div>
  <p>Copyright © 2017 xxx.com All Rights Reserved | xxxxx</p>
</div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>

</body>
</html>