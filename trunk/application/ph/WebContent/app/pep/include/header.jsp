<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Expires" content="-1">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.ph.FormManager"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/highcharts.src.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/pep/include/base.css">

<%
	String type = (String)request.getAttribute("type");
	String title = FormManager.getFormTitle(type);
%>
