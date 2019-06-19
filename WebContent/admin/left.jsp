<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset=utf-8">
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#fff3e1;">
	<div class="lefttop"><span></span>管理菜单</div>
    
    <dl class="leftmenu">
       
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>图片管理
    </div>
    <ul class="menuson">
        <li>
        	<div class="header">
        	<cite></cite>
        	<a href="${basePath }PicServlet?method=findPicByPage&currentPage=1" target="rightFrame">图片列表</a>
        	<i></i>
        	</div>
        </li>
		
		<%-- <li>
			<div class="header">
			<cite></cite>
			<a href="imglist.jsp" target="rightFrame">图片管理2</a>
			<i></i>
			</div>
		</li> --%>
        </ul>     
    </dd> 
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>信息管理
    </div>
    	<ul class="menuson">
        
        <li>
            <div class="header">
            <cite></cite>
            <a href="${basePath }InfoServlet?method=findInfoByPage&currentPage=1" target="rightFrame">信息列表</a>
            <i></i>
            </div>                
        </li>
		
		<li>
			<div class="header">
			<cite></cite>
			<a href="${basePath }CategoryServlet?method=findAllCategory" target="rightFrame">
			信息类别列表
			</a>
			<i></i>
			</div>     
		</li>
        </ul>    
    </dd>
   
    </dl>
    
</body>
</html>
