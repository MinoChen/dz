<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style type="text/css">
.pagination {
	padding: 25px 0;
	text-align: center;
	font-size: 14px;
}

.pagination a {
	display: inline-block;
	margin: 0 5px;
	height: 30px;
	line-height: 30px;
	border: 1px solid #eee;
	padding: 0 5px;
	border-radius: 0.3rem;
}

.pagination a:hover {
	border: 1px solid #ddd;
	background-color: rgba(153, 153, 153, 0.02);
}

.pagination a.active {
	color: #cd0104;
	font-weight: 600;
	border-color: rgba(205, 1, 4, 0.1);
	background-color: rgba(205, 1, 4, 0.05);
}

.pagination a.disabled {
	color: #999999;
	border-color: rgba(153, 153, 153, 0.05);
	background-color: rgba(153, 153, 153, 0.05);
}
</style>
</head>
<body>
<!--头部  -->
<%@ include file="head.jsp" %>

<!--内容-->
	<div class="container container-bg">
		<div class="con-head">
			<div class="con-head-r">
				<a href="index.jsp">首页</a> - ${category.category_name}
			</div>
			<div class="con-head-l">
				<h2>${category.category_name}</h2>
			</div>
		</div>
		<div class="content list">
			<c:if test="${!empty pb.list}">
				<ul>
					<c:forEach items="${pb.list}" var="info" >
						<li>
						<span style="font-size: 16px;"><c:out value="${info.info_publishTime}" /></span> 
						<a href="${basePath}InfoServlet?method=findInfoByInfo_id
						&info_id=<c:out value="${info.info_id}"/>
						&category_id=<c:out value="${category.category_id}" />">
						<c:out value="${info.info_title}" />
						</a>
						</li>
					</c:forEach>
				</ul>
				<div class="pagination">
					共<c:out value="${pb.count}" />条信息
					<div style="height: 10px;"></div>
				</div>
			</c:if>
			<c:if test="${empty pb.list}">
				<div>
					<br /> 暂无信息 <br /> <br />
				</div>
			</c:if>
		</div>
	</div>

<div class="footclear"></div>
<!--底部  -->
<%@ include file="foot.jsp" %>
</body>
</html>