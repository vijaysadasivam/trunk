<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.ph.FormManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Date"%>	
<%@page import="java.text.SimpleDateFormat"%>	
<%@page import="java.text.DateFormat"%>	
<%@page import="com.saturn.tc.utils.DateUtils"%>    
<%@page import="com.saturn.ph.ReportPage"%>    
<html>
<head>
	<title>Pilothallengesprch Print</title>

	<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/highcharts.src.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/pep/include/base.css">
</head>

<body>
	<center>
	<%
		List<ReportPage> indexes = (List<ReportPage>)request.getSession().getAttribute("indexes");
	
	
		for (int i = 0; i < indexes.size(); ++i) {
			String url = ((ReportPage)indexes.get(i)).getPath();
			if (i > 0) {
				url += "&pageNo=" + (i+1);
			}
			System.out.println(url);     
			%>
				<iframe scrolling="no" frameborder="0" src="<%=request.getContextPath()%><%=url %>" style="width:1000px;height:750px;"></iframe>
			<%
		}
	%>
	</center>
</body>

</html> 