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
<title></title>
<link href="${basePath }admin/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${basePath }admin/js/jquery.js"></script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">信息管理</a></li>
			<li><a href="#">信息类别列表</a></li>
		</ul>
	</div>
	<div class="rightinfo">
		<div class="tools">
			<ul class="toolbar">
				<li class="click"><a href="${basePath }admin/category/add.jsp"><span><img
							src="${basePath }admin/images/t01.png" /></span>添加信息类别</a></li>
			</ul>
		</div>
		<table style="width: 500px;" class="tablelist">
			<thead>
				<tr>
					<th style="width: 100px;text-align: center;">信息类别编号</th>
					<th style="width: 130px;text-align: center;">信息类别名称</th>
					<th style="width: 160px;text-align: center;">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="category">
					<tr>
						<td style="text-align: center;"><c:out value="${category.category_id}" /></td>
						<td style="text-align: center;"><c:out value="${category.category_name}" /></td>
						<td style="text-align: center;">
						<a href='${basePath }CategoryServlet?method=editCategory&category_id=${category.category_id}' class="tablelink">
						更新
						</a>
						<a href='#' onclick="del(${category.category_id})" class="tablelink">
						删除
						</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<script type="text/javascript">
			function del(category_id){
				if(window.confirm("您确定要删除吗？"))
				{
				   location.href="${basePath }CategoryServlet?method=delCategory&category_id="+category_id;
				 }
			}
		</script>
	</div>
	<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>


