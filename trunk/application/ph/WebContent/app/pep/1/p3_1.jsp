<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.ph.FormManager"%>
<%@page import="com.saturn.tc.utils.DatasetUtils"%>			
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/app/pep/include/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String uid = (String)request.getAttribute("uid");
	String src = DatasetUtils.getDatasetByUid(uid, request);
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title><%=title %> </title>
	
</head>
<body>
	<div id="container">
		<div id="nr">
		<div id="top">
			<div class="fl"> VW471 CN-Pilothalle VFF,20.10.2010</div>
			<div class="fr"> STATUS 19.10.2010</div>
			<h1><%=title %></h1>
		</div>
		<div id="content">
			<div id="chart" style="width: 800px; height: 400px; margin: 0 auto">
				<img src = "<%=src%>" width="800" height="400">
			</div>
		</div>
		<%@ include file="/app/pep/include/foot.jsp"%>
	</div>	
</body>
</html>