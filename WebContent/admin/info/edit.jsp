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
<title>修改信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link href="${basePath }admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath}js/jquery.js"></script>
</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">信息列表</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>修改信息</span>
		</div>
		<form action="${basePath }InfoServlet?method=updateInfo" name="ff" method="post" onsubmit="return checkValue()">
			<ul class="forminfo">
				<input id="info_id" name="info_id" value="${info.info_id}" type="hidden" />
				<li>
				<label style="width: 150px;">信息类别：</label>
				<select name="category_id" id="category_id" class="dfinput">
					<option value="">请选择</option>
						<c:forEach items="${categorylist}" var="c">
							<option value="${c.category_id }" <c:if test="${c.category_id eq info.category_id }">selected="selected"</c:if>>
								${c.category_name }
							</option>
						</c:forEach>
				</select>
				</li>
				<li>
				<label style="width: 150px;">标题：</label>
				<input id="info_title" name="info_title" value="${info.info_title}" type="text" class="dfinput" />
				</li>
				<li>
				<label style="width: 150px;">作者：</label>
				<input id="info_author" name="info_author" value="${info.info_author}" type="text" class="dfinput" />
				</li>
				<li>
				<label style="width: 150px;">信息内容：</label>
				<textarea id="info_content" name="info_content" cols="100" rows="8" style="width: 800px; height: 200px;" class="dfinput" />
					${info.info_content}
				</textarea>
				</li>
				<li>
				<label style="width: 150px;">排序：</label>
				<input id="info_sort" name="info_sort" type="text" value="${info.info_sort}" class="dfinput" />
				</li>
				<li>
				<label style="width: 150px;">图片（不可修改）：</label>
				<img src="${basePath }InfoServlet?method=getImg&imgName=${info.info_picPath}" id="info_pic" width="120px" border="0" />
				</li>
				<li><label style="width: 150px;">图片名称：</label>${info.info_picPath}</li>
				<li><label style="width: 150px;">是否发布：</label>
				<select id="info_publishStatus" name="info_publishStatus" class="dfinput">
					<option value="0" <c:if test="${info.info_publishStatus eq 0 }">selected="selected"</c:if>>
						否
					</option>
					<option value="1" <c:if test="${info.info_publishStatus eq 1 }">selected="selected"</c:if>>
						是
					</option>
				</select>
				</li>
				<li>
				<label style="width: 150px;">&nbsp;</label>
				<input name="" type="submit" class="btn" value="确认保存" />&nbsp;&nbsp;
				<input name="" type="button" onclick="goback();" class="btn" value="返回列表" />
				</li>
			</ul>
		</form>
	</div>
	<script>
		function goback() {			 
			window.location.href = "${basePath }InfoServlet?method=findInfoByPage&currentPage=1";
		}

		function checkValue() {
			var str = document.getElementById("info_title").value;
			if (str.length < 1) {
				alert("请输入信息标题");
				document.getElementById("info_title").focus();
				return false;
			}
			if (str.length > 50) {
				alert("信息标题长度应小于等于50");
				document.getElementById("info_title").focus();
				return false;
			}
			str = document.getElementById("category_id").value;
			if (str == 0) {
				alert("请选择信息类别");
				return false;
			}
			str = document.getElementById("info_content").value;
			if (str.length < 1) {
				alert("请输入信息内容");
				document.getElementById("info_content").focus();
				return false;
			}
			return true;
		}
	</script>


</body>
</html>

