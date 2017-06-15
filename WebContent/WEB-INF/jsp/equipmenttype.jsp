<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/semantic.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/init.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleBase.css">
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/semantic.min.js"></script>
  <title>畅享基地</title>
</head>
<div id="nav">
  <ul class="daohang">
    <li><center><a href="${pageContext.request.contextPath}/index.action">畅享首页</a></center></li>
    <li class="act"><center><a href="${pageContext.request.contextPath}/equipmenttype_findByPage.action?page=1">畅享基地</a></center></li>
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
   <!--介绍平台设备-->
   <div id="shebei">
     <img src="${pageContext.request.contextPath}/images/base/cxjd_banner.jpg" style="width:100%;height:600px;">
     <h1 class="ui header">设备介绍</h1>
     <div class="ui cards" id="shebei_list">
      <div class="box">
        <ul>
     
          <s:iterator var="p" value="pageBean.list">
				<li>
						<img src="${pageContext.request.contextPath}/<s:property value="#p.name"/>"/>
											 
						<div class="dask">
                            <p><s:property value="#p.equipmenttype"/></p>
                        </div>
											 
					
				</li>
			</s:iterator>	
        </ul>
      </div>
	<span class="pagination" style="display:block;width:110px;margin:0 auto;">
			<span class="di">第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/> 页</span>
		
			<s:if test="pageBean.page != 1">
				<a href="${ pageContext.request.contextPath }/product_findByPage.action?page=1" class="firstPage">&nbsp;</a>
				<a href="${ pageContext.request.contextPath }/product_findByPage.action?page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
			</s:if>
			
			<s:iterator var="i" begin="1" end="pageBean.totalPage">
				<s:if test="pageBean.page != #i">
					<a href="${ pageContext.request.contextPath }/product_findByPage.action?page=<s:property value="#i"/>"><s:property value="#i"/></a>
				</s:if>
				<s:else>
					<span class="currentPage"><s:property value="#i"/></span>
				</s:else>
			</s:iterator>
			
			<s:if test="pageBean.page != pageBean.totalPage">	
				<a class="nextPage" href="${ pageContext.request.contextPath }/product_findByPage.action?page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
				<a class="lastPage" href="${ pageContext.request.contextPath }/product_findByPage.action?page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
			</s:if>
		
	</span>
     </div>
   </div>
   
   <!--加盟我们-->
   <div class="joinus">
     <div id="base_hz">
       <img src="${pageContext.request.contextPath}/images/base/base_hz.png">
     </div>
     <div id="base_hzzi">
       <h1 style="color:red;">加盟我们 合作共赢 互惠互利</h1>
       <p>
         由总部提供品牌形象、系统的设备、技术支持、经营指导等使用权，并且全力支持合作者永续经营。
         <br/>
         合作者需付出相应资金和管理经营，双方维持良好互动的合作关系，共同打造绿色健康社区。
       </p>
     </div>
     <div id="base_hzlc">
       <div class="ui section divider">
          <h1 class="ui header">合作流程</h1>
          <img src="${pageContext.request.contextPath}/images/base/base_hzlc.png">
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
<script>
  $(function () {
    $(".box ul li ").hover(
            function () {
              $(this).find(".dask").stop().delay(50).animate({"top":0,opacity:0.8},300)
            },
            function () {
              $(this).find(".dask").stop().animate({"top":-200,opacity:0},300)
            }
    )
  })
</script>
   <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
</body>
</html>