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
		<form action="${basePath }PicServlet?method=updatePic" name="ff" method="post" onsubmit="return checkValue()">
			<ul class="forminfo">
				<input id="pic_id" name="pic_id" value="${pic.pic_id}" type="hidden" />
				<li>
				<label style="width: 150px;">图片信息类别：</label>
				<select name="category_id" id="category_id" class="dfinput">
					<option value="">请选择</option>
						<c:forEach items="${categorylist}" var="categorylist">
							<option value="${categorylist.category_id }" 
							<c:if test="${categorylist.category_id eq pic.category_id }">selected="selected"</c:if>>
								${categorylist.category_name }
							</option>
						</c:forEach>
				</select>
				</li>
				<li>
				<label style="width: 150px;">图片（不可修改）：</label>
				<img src="${basePath }PicServlet?method=getImg&imgName=${pic.pic_path}" id="pic_path" width="120px" border="0" />
				</li>
				<li><label style="width: 150px;">图片名称：</label>${pic.pic_path}</li>
				<li>
				<label style="width: 150px;">标题：</label>
				<input id="pic_title" name="pic_title" value="${pic.pic_title}" type="text" class="dfinput" />
				</li>
				<li>
				<label style="width: 150px;">作者：</label>
				<input id="pic_author" name="pic_author" value="${pic.pic_author}" type="text" class="dfinput" />
				</li>
				<li>
				<label style="width: 150px;">图片内容：</label>
				<textarea id="pic_content" name="pic_content" cols="100" rows="8" style="width: 800px; height: 200px;" class="dfinput" />
					${pic.pic_content}
				</textarea>
				</li>
				<li>
				<label style="width: 150px;">排序：</label>
				<input id="pic_sort" name="pic_sort" type="text" value="${pic.pic_sort}" class="dfinput" />
				</li>
				<li><label style="width: 150px;">是否发布：</label>
				<select id="pic_publishStatus" name="pic_publishStatus" class="dfinput">
					<option value="0" <c:if test="${pic.pic_publishStatus eq 0 }">selected="selected"</c:if>>
						否
					</option>
					<option value="1" <c:if test="${pic.pic_publishStatus eq 1 }">selected="selected"</c:if>>
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
			window.location.href = "${basePath }PicServlet?method=findPicByPage&currentPage=1";
		}

		function checkValue() {
			var str = document.getElementById("pic_title").value;
			if (str.length < 1) {
				alert("请输入图片标题");
				document.getElementById("pic_title").focus();
				return false;
			}
			if (str.length > 50) {
				alert("图片标题长度应小于等于50");
				document.getElementById("pic_title").focus();
				return false;
			}
			str = document.getElementById("category_id").value;
			if (str == 0) {
				alert("请选择图片类别");
				return false;
			}
			str = document.getElementById("pic_content").value;
			if (str.length < 1) {
				alert("请输入图片信息内容");
				document.getElementById("pic_content").focus();
				return false;
			}
			return true;
		}
	</script>


</body>
</html>

