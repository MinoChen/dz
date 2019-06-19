<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>大众汽车信息网</title>
<link href="css/style.css" rel=stylesheet>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script language="JavaScript" type="text/javascript" src="js/menu.js"></script>
<script language="JavaScript" type="text/javascript" src="js/jqselect.js"></script>
<script src="js/slides.min.jquery.js"></script>
<script>
$(function(){
			// Set starting slide to 1
			var startSlide = 1;
			// Get slide number if it exists
			if (window.location.hash) {
				startSlide = window.location.hash.replace('#','');
			}
			// Initialize Slides
			$('#slides').slides({
				preload: true,
				preloadImage: 'img/loading.gif',
				generatePagination: true,
				play: 0,
				pause: 2500,
				hoverPause: true,
				// Get the starting slide
				start: startSlide,
				animationComplete: function(current){
					// Set the slide number as a hash

					//window.location.hash = '#' + current;
				}
			});
		});
</script>

</head>

<body>
<div class="header">
  <div class="main">
    <div class="tel"><span>咨询热线</span>
      <p>132-1707-7713</p>
    </div>
  </div>
</div>

<div class="clear"></div>
<div class="banner">
  <div class="main_visual">
    <div class="notice">
          <div class="main">
          	<div class="menu">
          		<c:import var="data" url="/CategoryServlet?method=findNaviCategory" />
                  <ul>
                    <li class="top"><a href="index.jsp">首页</a></li>
                    <c:forEach items="${categoryList}" var="category" begin="0" end="2">
					<li>
					<a href='${basePath}PicServlet?method=findPicByCategory_id&category_id=${category.category_id}&currentPage=1'>
					${category.category_name}
					</a>
					</li>
					</c:forEach>
					<c:forEach items="${categoryList}" var="category" begin="3" end="7">
					<li>
					<a href='${basePath}InfoServlet?method=findInfoByCategory_id&category_id=${category.category_id}&currentPage=1'>
					${category.category_name}
					</a>
					</li>
					</c:forEach>
                  </ul>
            </div>
            <div class="noticecon"><b>网站公告：</b>
               <marquee scrollamount="2" scrolldelay="5" onMouseOut="this.start()" onMouseOver="this.stop()">大众汽车信息网,欢迎您的浏览!</marquee>
            </div>
           <div class="search">
                <input type="text" class="text" name="kws" id="key" placeholder="输入您要搜索的关键词"/>
                <button class="button" onclick="search()"></button>
            <script type="text/javascript">
				function search(){
					var key = document.getElementById("key").value;
					
					location.href="${basePath}InfoServlet?method=searchInfo&currentPage=1&key="+key;
				}
			</script>
            </div>
          </div>
    </div>
    
    <!--banner start-->
  <div class="banner">
	<ul class="slides">
		<li style="background:url(images/banner01.jpg) 50% 0 no-repeat;"></li>
		<li style="background:url(images/banner02.jpg) 50% 0 no-repeat;"></li>
	</ul>
</div>
  <!-- js调用部分begin -->
	
    <script src="js/jquery.flexslider-min.js"></script>
    <script>
    $(function(){
        $('.banner').flexslider({
            directionNav: true,
            pauseOnAction: false
        });
    });
    </script>
    <!-- js调用部分end -->
  <!--banner end-->
    
  </div>

</div>

<c:import var="data" url="/InfoServlet?method=findInfo" />
<c:import var="data" url="/PicServlet?method=findPic" />

<div class="activity">
    <p class="proname">CASE</p>
    <div class="kec"><p class="prona1">内饰</p></div>
    <div class="viewmore"><a href='${basePath}PicServlet?method=findPicByCategory_id&category_id=1&currentPage=1'>查看更多</a></div>
    <div class="clear"></div>
    <div id="container">
      <div id="example">
        <div id="slides">
          <div class="slides_container" >
            <div class="slide">
              <div class="qie01"></div>
              <div class="qie02">
                 <div class="fra">
                 	<c:forEach items="${NszsPic}" var="pic" begin="0" end="0">
	                 <em>${pic.pic_title }</em>
	                 <img src="${basePath}PicServlet?method=getImg&imgName=${pic.pic_path}" width="287" height="215"/>
	                 <a href="${basePath}PicServlet?method=findPicByPic_id&pic_id=${pic.pic_id}"></a>
	                 </c:forEach>
                 </div>
                 <div class="fra1">
	                 <c:forEach items="${NszsPic}" var="pic" begin="1" end="1">
		                 <em>${pic.pic_title }</em>
		                 <img src="${basePath}PicServlet?method=getImg&imgName=${pic.pic_path}" width="287" height="215"/>
		                 <a href="${basePath}PicServlet?method=findPicByPic_id&pic_id=${pic.pic_id}"></a>
		             </c:forEach>
                 </div>
                 <div class="fra2">
                 	<c:forEach items="${NszsPic}" var="pic" begin="2" end="2">
	                 <em>${pic.pic_title }</em>
	                 <img src="${basePath}PicServlet?method=getImg&imgName=${pic.pic_path}" width="287" height="215"/>
	                 <a href="${basePath}PicServlet?method=findPicByPic_id&pic_id=${pic.pic_id}"></a>
	                 </c:forEach>
                 </div>
                 <div class="fra3">
                 	<c:forEach items="${NszsPic}" var="pic" begin="3" end="3">
	                 <em>${pic.pic_title }</em>
	                 <img src="${basePath}PicServlet?method=getImg&imgName=${pic.pic_path}" width="287" height="215"/>
	                 <a href="${basePath}PicServlet?method=findPicByPic_id&pic_id=${pic.pic_id}"></a>
	                 </c:forEach>
                 </div>
              </div>
            </div>
            <div class="slide">
              <div class="qie01"></div>
              <div class="qie02">
                <div class="fra">
                 <c:forEach items="${NszsPic}" var="pic" begin="4" end="4">
	             <em>${pic.pic_title }</em>
	             <img src="${basePath}PicServlet?method=getImg&imgName=${pic.pic_path}" width="287" height="215"/>
	             <a href="${basePath}PicServlet?method=findPicByPic_id&pic_id=${pic.pic_id}"></a>
	             </c:forEach>
                </div>
                <div class="fra1">
                <c:forEach items="${NszsPic}" var="pic" begin="5" end="5">
	             <em>${pic.pic_title }</em>
	             <img src="${basePath}PicServlet?method=getImg&imgName=${pic.pic_path}" width="287" height="215"/>
	             <a href="${basePath}PicServlet?method=findPicByPic_id&pic_id=${pic.pic_id}"></a>
	             </c:forEach>
                </div>
                <div class="fra2">
                <c:forEach items="${NszsPic}" var="pic" begin="6" end="6">
	             <em>${pic.pic_title }</em>
	             <img src="${basePath}PicServlet?method=getImg&imgName=${pic.pic_path}" width="287" height="215"/>
	             <a href="${basePath}PicServlet?method=findPicByPic_id&pic_id=${pic.pic_id}"></a>
	             </c:forEach>
                </div>
                <div class="fra3">
                <c:forEach items="${NszsPic}" var="pic" begin="7" end="7">
	             <em>${pic.pic_title }</em>
	             <img src="${basePath}PicServlet?method=getImg&imgName=${pic.pic_path}" width="287" height="215"/>
	             <a href="${basePath}PicServlet?method=findPicByPic_id&pic_id=${pic.pic_id}"></a>
	             </c:forEach>
                </div>
              </div>

            </div>
          </div>

          <a href="#" class="prev" title="prev">&nbsp;&nbsp;</a><a href="#" class="next">&nbsp;</a> </div>

      </div>

    </div>

    <!--效果结束 end--> 

</div>

<div class="index_about">
  <p class="proname">ABOUT</p>
  <div class="kec"><p class="prona1">关于我们</p></div>
  <div class="viewmore">
  <div class="index_con w980 clearfix">
    <img class="fl" src="images/dzlogo.png" width="350" height="265"/>
    <p class="fr" style="font-size: 19px;">
    <span style="font-size: 15px;"></span>
    <c:forEach items="${GywmInfo}" var="info" begin="0" end="0">
    ${info.info_content }
    </p>
    </c:forEach>
  </div>
</div>

<div class="clear"></div>
<div class="case">
<div class="clear"></div>
  <p class="proname">products</p>
   <div class="kec"><p class="prona1"> 产品展示</p></div>
   <div class="viewmore"><a href='${basePath}PicServlet?method=findPicByCategory_id&category_id=2&currentPage=1'>查看更多</a></div>
<div class="track">

  <div class="profra">
    <div class="view-port">
    <c:forEach items="${CpzsPic}" var="pic" begin="0" end="7">
       <div class="limg">
       <a class="img" href="${basePath}PicServlet?method=findPicByPic_id&pic_id=${pic.pic_id}">
       <img src="${basePath}PicServlet?method=getImg&imgName=${pic.pic_path}" width="220" height="165"/>
       </a>
       <a class="wor" href="${basePath}PicServlet?method=findPicByPic_id&pic_id=${pic.pic_id}">
       ${pic.pic_title }
       </a>
       </div>
    </c:forEach>
    </div>
  </div>
</div>

</div>
<div class="newsfra">
<p class="proname">Industry knowledge</p>
   <div class="kec"><p class="prona1">行业知识</p></div>
   <div class="viewmore">
   <a href='${basePath}InfoServlet?method=findInfoByCategory_id&category_id=6&currentPage=1'>
   	查看更多
   </a>
   </div>
    <div class="news">
       <ul class="newsul">
        <c:forEach items="${HyzsInfo}" var="info" begin="0" end="3">
          <li>
            <img class="newsimg" src="${basePath}InfoServlet?method=getImg&imgName=${info.info_picPath}"  width="163" height="122" />
            <a href="${basePath}InfoServlet?method=findInfoByInfo_id&info_id=${info.info_id}">
               <div class="newsword">
                <p class="top">${info.info_title}</p>
                <div class="newscon">${info.info_content }</div>
				 <label>${info.info_publishTime}</label>
               </div>
            </a>
          </li>
        </c:forEach>
       </ul>
  </div>
</div>

<div class="newsframe">
  <div class="news_fra">
    <div class="news_fleft">
      <a href='${basePath}InfoServlet?method=findInfoByCategory_id&category_id=4&currentPage=1'>
      <P class="p1"><span>新闻资讯</span><label >查看更多资讯</label></P>
      </a>
      <p class="p2">The latest information</p>
      <ul class="news_ful">
      	<c:forEach items="${XwzxInfo}" var="info" begin="0" end="4">
      	<li>
		<a href="${basePath}InfoServlet?method=findInfoByInfo_id&info_id=${info.info_id}">
		<p>
		${info.info_title}
		</p>
		<span style="font-size: 12px;">${info.info_publishTime}</span>
		</a>
		</li>
		</c:forEach>
     </ul>
   </div>
   <div class="news_fright">
      <ul class="news_ful">
      <c:forEach items="${XwzxInfo}" var="info" begin="5" end="10">
      	<li>
		<a href="${basePath}InfoServlet?method=findInfoByInfo_id&info_id=${info.info_id}">
		<p>
		${info.info_title}
		</p>
		<span style="font-size: 12px;">${info.info_publishTime}</span>
		</a>
		</li>
		</c:forEach>
       </ul>
   </div>
    </div>
</div>

<div class="footclear"></div>
<div class="f_link">
  <div class="link w980">
  <span>友情链接</span>
  <a href="https://www.audi.cn/cn/web/zh.html" target="_blank">奥迪官网</a>
  <a href="http://www.vw.com.cn/cn.html" target="_blank">大众官网</a>
  </div>
</div>
<!--底部-->
	<%@ include file="foot.jsp"%>
</body>
</html>