<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
  <meta name="robots" content="noindex,follow" />
  <title>畅享服务</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/video.css" media="screen">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/semantic.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/init.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleServer.css">
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/semantic1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/RGraph/RGraph.common.core.js"></script>
  <script src="${pageContext.request.contextPath}/js/RGraph/RGraph.line.js"></script>
  <script src="${pageContext.request.contextPath}/js/mediaelement-and-player.min.js"></script>
</head>
<body  onload="window_onload()">
<!--导航-->
<div id="nav">
  <ul class="daohang">
    <li><center><a href="${pageContext.request.contextPath}/index.action">畅享首页</a></center></li>
    <li><center><a href="${pageContext.request.contextPath}/equipmenttype_findByPage.action?page=1">畅享基地</a></center></li>
    <li><center><a href="http://139.199.97.82:8080/shop/index.action">畅享商城</a></center></li>
    <li class="act"><center><a href="${pageContext.request.contextPath}/data_data.action">畅享服务</a></center></li>
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
  <!--主要内容-->
  <div id="content">
    <img src="${pageContext.request.contextPath}/images/server/server.jpg" style="width:100%;height:600px;">
    <!--数据展示-->
    <div id="data">
      <div id="data_xianshi">
        <h1>一号大棚</h1>
        <h1>数据实时显示</h1>
        <canvas id="myCanvas" style="width:1000px;height:500px;"></canvas>
      </div>
      <div id="data_caozuo">
        <button class="ui orange button" onclick = "wendu()">温度显示</button>
        <button class="ui orange button" onclick = "shidu()">湿度显示</button>
        <button class="ui orange button">光照强度</button>
        <button class="ui orange button">二氧化碳浓度</button>
      </div>
    </div>
    <!--控制-->
    <div class="ui section divider" id="con">
    <div id="control">
      <h1>实现控制</h1>
      <div class="ui top attached tabular menu">
        <a class="active item" data-tab="first">温度</a>
        <a class="item" data-tab="second">湿度</a>
        <a class="item" data-tab="third">光照强度</a>
      </div>
      <div class="ui bottom attached active tab segment" data-tab="first">
        <p>温度加减控制</p>
        <div id="radius1">
          <p>当前温度<span id="zhi1">20</span>℃</p>
        </div>
        <div class="con_true">
          
          <button class="ui primary button jia" onclick="jia(document.getElementById('zhi1'))">＋</button>
          <button class="ui primary button jian" onclick="jian(document.getElementById('zhi1'))">－</button>
          <button class="ui primary button guan"  onclick="TClose()">关闭</button>
        </div>
      </div>
      <div class="ui bottom attached tab segment" data-tab="second">
        <p>湿度加减控制</p>
        <div id="radius2">
          <p>当前湿度<span id="zhi2">20</span>%rh</p>
        </div>
        <div class="con_true">
          <button class="ui primary button jia" onclick="jia(document.getElementById('zhi2'))">＋</button>
          <button class="ui primary button jian" onclick="jian(document.getElementById('zhi2'))">－</button>
          <button class="ui primary button guan" onclick="HClose()">关闭</button>
        </div>
      </div>
      <div class="ui bottom attached tab segment" data-tab="third">
        <p>光照强度加减控制</p>
        <div id="radius3">
          <p>当前光照强度<span id="zhi3">20</span>lx</p>
        </div>
        <div class="con_true">
          <button class="ui primary button jia" onclick="jia(document.getElementById('zhi3'))">＋</button>
          <button class="ui primary button jian" onclick="jian(document.getElementById('zhi3'))">－</button>
          <button class="ui primary button guan" onclick="LClose()">关闭</button>
        </div>
      </div>
    </div>
    <!--视频展示-->
    <div id="server_video" class="ui section divider">
      <h1>视频展示</h1>
      <div id="video_jieshao">
          <img src="${pageContext.request.contextPath}/images/server/video_jieshao.jpg">
          <p>通过视频流的传输，你可以看到任意一株高端花卉的培育过程</p>
          <p>她的一生只为你绽放，是你的专属</p>
          <p>通过视频流的传输，你可以看到任意一株高端花卉的培育过程</p>
          <p>她的一生只为你绽放，是你的专属</p>
          <p>通过视频流的传输，你可以看到任意一株高端花卉的培育过程</p>
          <p>她的一生只为你绽放，是你的专属</p>
      </div>
      <div id="server_div">
        <video style="height:267px;" poster="${pageContext.request.contextPath}/media/cars.png">
          <source src="${pageContext.request.contextPath}/media/cars.mp4" type="video/mp4">
        </video>
      </div>
    </div>
  </div>
    </div>
<!--底部-->
<div id="footer">
  <div class="jiathis_style_24x24">
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

  <script>
    var url = 'http://139.199.97.82:8080/hulianwang/data_findTNew.action';
    //var url = 'http://localhost:8080/hulianwang/data_findTNew.action';
    function window_onload(){
      d1 = [];//存放上部折线图使用数据的数组
      // 用null值填充数组
      for (var i=0; i< 30; ++i){
        d1.push(null);
        // d2.push(null);
      }
      function myCallback(){
        var data = JSON.parse(this.responseText);
        var arr = [];
        for(var key in data){
              if(key == 'T'){
                arr.push(data[key]);
              }   
        }
        //设置折线图属性
        function getGraph(id, d1){
          var graph = new RGraph.Line(id, d1);//获取折线图数据
          graph.Set('chart.gutter', 60);//设置标签文字使用空间
          graph.Set('chart.title.xaxis', '时间');//设置水平坐标轴标题
          graph.Set('chart.filled', false);//使用填充色填充折线区域
          graph.Set('chart.background.grid',false);
          //graph.Set('chart.fillstyle', [ 'white']);//指定上部折线区域与下部折线区域的填充色
          graph.Set('chart.colors', ['black']);//指定上部折线与下部折线的颜色
          graph.Set('chart.tickmarks','null');
          graph.Set('chart.linewidth', 0.3);//指定线宽
          graph.Set('chart.ymax', 50);//指定垂直坐标轴上的最大数值
          graph.Set('chart.xticks', 24);//指定水平坐标轴上的刻度线
          return graph;//返回设置好的折线图
        }
        //绘制折线图
        function drawGraph(e){
          //清除之前绘制的折线图
          RGraph.Clear(document.getElementById("myCanvas"));
          var graph = getGraph('myCanvas', d1);//获取设置好属性的折线图
          graph.Draw();//绘制折线图
          //使用随机数字填充折线图所使用的数据数组
//                    d1.push(RGraph.random(5, 10));

          d1 = [].concat(arr);
//                    console.log(d1);
          //d2.push(RGraph.random(5, 10));

          //如果数组已经填满，则移出数组中最前面的数字,并将数组中每个数字朝前移位
          if (d1.length > 30){
            d1 = RGraph.array_shift(d1);
            //d2 = RGraph.array_shift(d2);
          }
          //设置每250毫秒更新折线图
          
        
        }
        drawGraph();
        setTimeout(drawGraph,250);
        
      }
    	
      
      RGraph.AJAX(url, myCallback);
    }
	function test(){
		var aBtn = document.getElementById('data_caozuo').getElementsByTagName('button');
	    for(var i=0;i<aBtn.length;i++){
	      (function(i){   //使用闭包解决输出0,1,2,3...或直接输出4的问题。从而输出  0,1,2,3
	        aBtn[i].addEventListener('click',function(){
	            switch (i){
	              case 0:
	                url = 'http://139.199.97.82:8080/hulianwang/data_findTNew.action';
	                /* window_onload(); */
	                break;
	              case 1:
	                url = 'http://139.199.97.82:8080/hulianwang/data_findHNew.action';
	                /* window_onload(); */
	                break;
	              case 2:
	                url = 'http://139.199.97.82:8080/hulianwang/data_findTNew.action';
	               /*  window_onload(); */
	                break;
	              case 3:
	                url = 'http://139.199.97.82:8080/hulianwang/data_findTNew.action';
	                /* window_onload(); */
	                break;
	              
	            }
	            window_onload();

	        });
	      })(i);
	    }
	}
	function shidu(){
		url = 'http://139.199.97.82:8080/hulianwang/data_findHNew.action';
		//url = 'http://localhost:8080/hulianwang/data_findHNew.action';
		window_onload();
	}
	function wendu(){
		url = 'http://139.199.97.82:8080/hulianwang/data_findTNew.action';
		window_onload();
	}
    

    var btnJia = document.getElementsByClassName('jia');
    var btnJian = document.getElementsByClassName('jian');
    var btnGuan = document.getElementsByClassName('guan');
    var zhi = document.getElementById('zhi');
    function jia(zhi){
      zhi.innerHTML = parseInt(zhi.innerText)+1;
    }
    function jian(zhi){
      zhi.innerHTML = parseInt(zhi.innerText)-1;
    }
    function TClose(){
      for(var i=0;i<btnGuan.length;i++){
        var guanbi = btnGuan[i].innerText;
        if(guanbi=="关闭"){
          btnGuan[i].innerHTML = "已关闭";
          var request = new XMLHttpRequest();
          request.open("POST","http://139.199.97.82:8080/hulianwang/controller_tClose.action");
          request.setRequestHeader("Content-Type","text/plain;charset=UTF-8");
          request.send();
        }else{
          btnGuan[i].innerHTML = "关闭";
          var request = new XMLHttpRequest();
          request.open("POST","http://139.199.97.82:8080/hulianwang/controller_tOpen.action");
          request.setRequestHeader("Content-Type","text/plain;charset=UTF-8");
          request.send();
        }
      }
    }
    
    function HClose(){
        for(var i=0;i<btnGuan.length;i++){
          var guanbi = btnGuan[i].innerText;
          if(guanbi=="关闭"){
            btnGuan[i].innerHTML = "已关闭";
            var request = new XMLHttpRequest();
            request.open("POST","http://139.199.97.82:8080/hulianwang/controller_hClose.action");
            request.setRequestHeader("Content-Type","text/plain;charset=UTF-8");
            request.send();
          }else{
            btnGuan[i].innerHTML = "关闭";
            var request = new XMLHttpRequest();
            request.open("POST","http://139.199.97.82:8080/hulianwang/controller_hOpen.action");
            request.setRequestHeader("Content-Type","text/plain;charset=UTF-8");
            request.send();
          }
        }
      }
    
    function LClose(){
        for(var i=0;i<btnGuan.length;i++){
          var guanbi = btnGuan[i].innerText;
          if(guanbi=="关闭"){
            btnGuan[i].innerHTML = "已关闭";
            var request = new XMLHttpRequest();
            request.open("POST","http://139.199.97.82:8080/hulianwang/controller_lClose.action");
            request.setRequestHeader("Content-Type","text/plain;charset=UTF-8");
            request.send();
          }else{
            btnGuan[i].innerHTML = "关闭";
            var request = new XMLHttpRequest();
            request.open("POST","http://139.199.97.82:8080/hulianwang/controller_lOpen.action");
            request.setRequestHeader("Content-Type","text/plain;charset=UTF-8");
            request.send();
          }
        }
      }

    $(document).ready(function(){
      $('.menu .item').tab();
      $('video').mediaelementplayer({
        alwaysShowControls:false,
        videoVolume:'horizontal',
        features: ['playpause','progress','volume','fullscreen']
      });
      
    });
    
  </script>
</body>
</html>