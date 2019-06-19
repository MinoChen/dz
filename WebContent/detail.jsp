<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="css/base.css" rel=stylesheet>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
<!--头部  -->
<%@ include file="head.jsp" %>

  <!--内容-->
	<div class="container container-bg">

		<div class="con-head">
			<div class="con-head-r">
				<a href="index.jsp">首页</a> - ${category.category_name }
			</div>
			<div class="con-head-l">
				<h2>${category.category_name }</h2>
			</div>
		</div>
		<div class="con-img">
			<img src="${basePath}InfoServlet?method=getImg&imgName=${info.info_picPath}" /> 
		</div>
		<div class="contents">
			<div align="center" style="color: rgb(51, 51, 51); font-size: 25px;">
				${info.info_title }</div>
			<div style="height: 10px;"></div>
			<div style="height: 15px;"></div>
			<p align="center" style="font-size: 13px;">
			${category.category_name }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${info.info_publishTime }</p>
			<div style="height: 4px;"></div>
			<div style="height: 2px; background-color: #E9E5DA;"></div><br />
			<p style="font-size: 17px;">${info.info_content }</p>
		</div>

	</div>

<div class="footclear"></div>
<!--底部-->
	<%@ include file="foot.jsp" %>
</body>
</html>