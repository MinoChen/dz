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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>

</head>

<body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    <img src="images/logo.png" title="系统首页" />
    </div>
            
    <div class="topright">    
    <ul>
	<li><a href="#">关于</a></li>
	<li><a href="${basePath }index.jsp" target="_top">回到首页</a></li>
    <li><a href="#" onclick="logout();">退出系统</a></li>
    </ul>
    <div class="user">
    <span>${user.user_name }</span>
    </div>    
    </div>
	<script type="text/javascript">
		function logout() {
			if (window.confirm("您确定要退出吗？")) {
				location.href = "${basePath }LogoutServlet";
			} else {
				return false;
			}
		}
	</script>
</body>
</html>
