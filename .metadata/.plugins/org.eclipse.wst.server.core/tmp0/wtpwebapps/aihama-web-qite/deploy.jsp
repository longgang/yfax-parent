<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部署流程定义</title>
</head>
<script type="text/javascript">
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs
/jquery/1.4.0/jquery.min.js"></script>
<body >
	<form action="<%=request.getContextPath() %>/busi/workflow/deploy" method="post" enctype="multipart/form-data">
			流程类别：<input type="text" name="category" /><p/>
			流程名称：<input type="text" name="fileName" /><p/>
			流程文件：<input type="file" name="file" />  
			<input type="submit" value="上传流程"/> 
	</form>
	<hr>
	<h2>部署列表</h2>
	<c:if test="${not empty depList}">
		<table width="60%" border=1 bordercolor=#000000 style="border-collapse:collapse;text-align:center;">
			<tr><th>主键</th><th>流程名称</th><th>部署时间</th><th>操作</th>
		
		<c:forEach items="${depList}" var="deployment">
			<tr>
				<td>${deployment.id}</td>
				<td>${deployment.name}</td>
				<td>
				 <fmt:formatDate value="${deployment.deploymentTime}"   pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" />
				</td>
				<td>
					<a href="<%=request.getContextPath() %>/busi/workflow/getDiagramByDeployId?deployId=${deployment.id}" target="_Blank">查看流程图</a>
					<a href="#" onclick="delDeploy(${deployment.id})" target="_Blank">删除</a>
				</td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
	<hr>
	<h2>流程定义列表</h2>
	<c:if test="${not empty pdList}">
		<table width="60%" border=1 bordercolor=#000000 style="border-collapse:collapse;text-align:center;">
			<tr>
				<th>ID</th>
				<th>部署ID</th>
				<th>名称</th>
				<th>流程定义的KEY</th>
				<th>版本</th>
				<th>流程定义的规则文件名称</th>
				<th>流程定义的规则图片名称</th>
				<th>操作</th>
		<c:forEach items="${pdList}" var="pd">
			<tr>
				<td>${pd.id}</td>
				<td>${pd.deploymentId}</td>
				<td>${pd.name}</td>
				<td>${pd.key}</td>
				<td>${pd.version}</td>
				<td>${pd.resourceName}</td>
				<td>${pd.diagramResourceName}</td>
				<td></td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
</body>
<script type="text/javascript">
	function delDeploy(deploymentId){
		var URL = "delDeploy";
		$.post(URL,{"deploymentId":deploymentId},function(data,status){
			alert(data)
		});
		
	}
</script>
</html>