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
<title>修改信息类别</title>
<link href="${basePath }admin/css/style.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">信息管理</a></li>
			<li><a href="#">信息类别列表</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>修改信息类别</span>
		</div>
		<form action="${basePath }CategoryServlet?method=updateCategory" name="ff" method="post"
			onsubmit="return checkValue()">
			<ul class="forminfo">

				<li>
					<label style="width: 120px;">类别id：</label>
					<input id="category_id"	name="category_id" 
					value="${category.category_id}" type="text" class="dfinput" readonly="true" />
					<i>类别id为纯数字</i>
				</li>
				<li>
					<label style="width: 120px;">
						类别名称：
					</label>
					<input id="category_name" name="category_name" 
						value="${category.category_name}" type="text" class="dfinput" />
					<i>类别名称</i>
				</li>
				<li>
					<label>&nbsp;</label>
					<input name="" type="submit" class="btn" value="确认保存" /> 
					&nbsp;&nbsp;
					<input name="" type="button" onclick="goback();" class="btn" value="返回列表" />
				</li>

			</ul>
		</form>
	</div>
	<script>
		function goback() {
			window.location.href = "${basePath }CategoryServlet?method=findAllCategory";
		}
		function checkValue() {
			var str = document.getElementById("category_id").value;
			if (str.length < 1) {
				alert("请输入类别id");
				document.getElementById("category_id").focus();
				return false;
			}
			if (isNaN(str)) {
				alert("类别id应为数字");
				document.getElementById("category_id").value = "";
				document.getElementById("category_id").focus();
				return false;
			}
			str = document.getElementById("category_name").value;
			if (str.length < 1) {
				alert("请输入类别名称");
				document.getElementById("category_name").focus();
				return false;
			}
			if (str.length > 10) {
				alert("类别名称长度应小于等于10");
				document.getElementById("category_name").focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
