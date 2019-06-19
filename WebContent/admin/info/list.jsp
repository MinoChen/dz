<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="${basePath }admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath }admin/js/jquery.js"></script>
<style type="text/css">
.pagination {
	padding: 15px 0 0 0;
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

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">信息列表</a></li>
		</ul>
	</div>
	<div class="rightinfo">
		<div class="tools">
			<ul class="toolbar">
				<li class="click"><a href="${basePath}InfoServlet?method=addInfoPage"><span><img
							src="${basePath}admin/images/t01.png" /></span>添加信息</a></li>
			</ul>
		</div>
		<form action="${basePath}InfoServlet?method=findInfoByPage&currentPage=1"
			id="infoListForm" name="ff" method="post">
			<ul class="seachform">
				<li><label>标题关键词</label><input name="keywords"
					value="${keywords}" type="text" style="width: 300px;"
					class="scinput" /></li>
				<li><label>&nbsp;</label><input name="" type="submit"
					class="scbtn" value="查询" /></li>
			</ul>
		</form>
		<table style="width: 100%;" class="tablelist">
			<thead>
				<tr>
					<th style="width: 100px;text-align: center;">信息id</th>
					<th style="width: 300px;text-align: center;">信息标题</th>
					<!--<th>类别</th>
					<th style="width: 100px;">排序</th>
					<th style="width: 100px;">是否发布</th> -->
					<th style="width: 160px;text-align: center;">发布时间</th>
					<th style="width: 100px;text-align: center;">所属类别</th>
					<th style="width: 100px;text-align: center;">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${!empty pb.list}">
						<c:forEach items="${pb.list}" var="info">
							<tr>
								<td style="text-align: center;"><c:out value="${info.info_id}" /></td>
								<td style="text-align: center;"><c:out value="${info.info_title}" /></td>
								<%-- <td><c:out value="${info.category.category_name}" /></td>
								<td><c:out value="${info.info_sort}"/></td>
								<td><c:choose>
										<c:when test="${info.info_publishStatus ==1}">
											是
			                    		</c:when>
										<c:otherwise>
			                    			否
			                    		</c:otherwise>
									</c:choose>
								</td> --%>
								<td style="text-align: center;"><c:out value="${info.info_publishTime}" /></td>
								<td style="text-align: center;"><c:out value="${info.category.category_name}" /></td>
								<td style="text-align: center;"><a
									href="${basePath}InfoServlet?method=editInfo&info_id=
									<c:out value="${info.info_id}" />">更新</a>
									&nbsp;|&nbsp; <a href='#'
									onclick="del(${info.info_id})">删除</a></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${empty pb.list}">
						<div>
							<tr>
								<td colspan="7" align="center">暂无信息</td>
							</tr>
						</div>
					</c:when>
				</c:choose>
				<tr>
					<td colspan="9" align="center">
						<div class="pagination">
							第
							<c:out value="${pb.currentPage}" />
							页 &nbsp;&nbsp; 共
							<c:out value="${pb.totalPage}" />
							页 &nbsp;&nbsp; 共
							<c:out value="${pb.count}" />
							条信息
							<div style="height: 10px;"></div>

							<c:choose>
								<c:when test="${pb.currentPage <= 1}"> 首页&nbsp;&nbsp;上一页 </c:when>
								<c:otherwise>
									<a href='#' onclick="dz(1)">首页</a>
									<a href='#'
										onclick="dz(<c:out value="${pb.currentPage - 1}"/>)">上一页</a>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${pb.currentPage < pb.totalPage}">
									<a href='#'
										onclick="dz(<c:out value="${pb.currentPage + 1}"/>)">下一页</a>
									<a href='#' onclick="dz(<c:out value="${pb.totalPage}"/>)">尾页</a>
								</c:when>
								<c:otherwise>
								下一页&nbsp;&nbsp;尾页
								</c:otherwise>
							</c:choose>
							&nbsp;&nbsp; 跳转至 <input type="text"
								style="height: 22px; border: 1px solid #888; width: 30px; border-radius: 0.2rem;"
								name="page" id="page"> 页 <a href='#'
								onclick="validate()">跳转</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<script type="text/javascript">
		
		 function dz(page)
        {
			 var form=document.getElementById("infoListForm");
			 form.action="${basePath }InfoServlet?method=findInfoByPage&currentPage=" + page ;
			 form.submit();
        }
		function validate()
        {
            var page = document.getElementById("page").value;
           
            	dz(page)
          
        }
	</script>
		<script type="text/javascript">
		function del(info_id){
			if(window.confirm("您确定要删除吗？"))
			{
			   location.href="${basePath }InfoServlet?method=delInfo&info_id="+info_id;
			 }
		}
	</script>
	</div>
	<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>



