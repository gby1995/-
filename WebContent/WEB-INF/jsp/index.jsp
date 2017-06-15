<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
            <meta charset="utf-8" />  
            <title>畅享首页</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fullpage.css" />
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/test.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css">
            <link href="${pageContext.request.contextPath}/css/video-js.min.css" rel="stylesheet">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/init.css">
            <link rel="stylesheet" href="//cdn.bootcss.com/semantic-ui/2.1.8/semantic.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
        </head> 
<body>
<div id="nav">
                <ul class="daohang">
                    <li class="act"><center><a href="${pageContext.request.contextPath}/index.action">畅享首页</a></center></li>
                    <li><center><a href="${pageContext.request.contextPath}/equipmenttype_findByPage.action?page=1">畅享基地</a></center></li>
                    <li><center><a href="http://139.199.97.82:8080/shop/index.action">畅享商城</a></center></li>
                    <li><center><a href="${pageContext.request.contextPath}/data_data.action">畅享服务</a></center></li>
                    <li><center><a href="${pageContext.request.contextPath}//WEB-INF/jsp/app.jsp">App下载</a></center></li>
                </ul> 
                <ul class="daohang" id="tets">
                    
                    <s:if test="#session.existUser == null">
   					<li><center><a href="${pageContext.request.contextPath}/user_loginPage.action">登录</a></center></li>
   					<li><center><a href="${pageContext.request.contextPath}/user_registerPage.action">注册</a></center></li>
   					</s:if>
   					<s:else>
    				<li><center><a><s:property value="#session.existUser.username"/></a></center></li>
    				<li><center><a href="${pageContext.request.contextPath}/user_quit.action">退出</a></center></li>
   					</s:else>
                </ul>
            </div>
            
            <div id="fullpage">  
                <div id="page1" class="section">
                    <!--<h1 class="tlt">基于畅享物联云服务的高端花卉育产售一体化云平台</h1>-->
                </div>  
                <div id="page2" class="section">
                <center><h1 class="tlt1">移动设备控制自动化培育</h1></center>
                </div>  
                <!-- <div id="page3" class="section">
                    
                </div>  --> 
                <div id="page4" class="section">
                    
                    <center><video id="my_video_1" class="video-js vjs-default-skin vjs-big-play-centered" 
                        controls preload="auto" poster="${pageContext.request.contextPath}/images/bg.jpg" data-setup="{}"  >
                        <source src="http://7xt0gu.com1.z0.glb.clouddn.com/1.1 问题求解.mp4" type="video/mp4">
    
                    </video></center>
                    <!--<center><p>版权所有©畅享物联平台&nbsp&nbsp&nbsp地址:西安邮电大学通信与信息工程学院438&nbsp&nbsp&nbsp联系我们:573249453@qq.com</p></center>-->
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
                                <li><a href="#">网站首页</a></li>
                                <li><a href="#">联系我们</a></li>
                                <li><a href="#">企业合作</a></li>
                                <li><a href="#">人才招聘</a></li>
                                <li><a href="#">常见问题</a></li>
                                <li><a href="#">意见反馈</a></li>
                                <li><a href="#">友情链接</a></li>
                            </ul>
                        </div>
                        <p>Copyright ? 2017 xxx.com All Rights Reserved | xxxxx</p>
                    </div>
                </div>  
                
            </div>
            <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easings.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fullpage.js"></script>
            <script src="${pageContext.request.contextPath}/js/video.min.js"></script>
            <script src="//cdn.bootcss.com/semantic-ui/2.1.8/semantic.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/daohang.js"></script>
            <script>
                $(document).ready(function(){
                    $("#fullpage").fullpage({
                        navigation:true
                    });
                });
            </script>
</body>
</html>