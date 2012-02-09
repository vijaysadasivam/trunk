<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		
		<%
		Map form = (Map)request.getAttribute("form");
		String kws = "[2,3,4,5,6,7,8,9,10]";
		String soll = "[2,7,0,6,2,1,6,8,5]";//Web.getNumberListStr(form.get("fv9AA"));
		String kumSoll = "[2,9,9,15,17,18,24,32,37]";//Web.getNumberListStr(form.get("fv9BB"));
		String lst = "[1,6,0,6,1,1,5,8,5]";//Web.getNumberListStr(form.get("fv9AA"));
		String kumLst = "[1,7,7,13,14,15,20,28,33]";//Web.getNumberListStr(form.get("fv9BB"));
			
		%>
		<script type="text/javascript">
		
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					zoomType: 'xy'
				},
				title: {
					text: 'Fahrzeugbauprogramm ZP8'
				},
				xAxis: {
					categories: <%=kws%>//[5,6,7,8,9,10,11]  
				},
				yAxis: {
					title: {
						text: 'Anzahl Fzg.',
						style: {
							color: '#333333'
						}
					}
				},
				tooltip: {
					formatter: function() {
						var s = ''+
								this.x  +'KW : '+ this.y;
						return s;
					}
				},
				plotOptions: {
					spline: {
						dataLabels: {
							enabled: true
						},
						enableMouseTracking: true
					},
					column: {
						dataLabels: {
							enabled: true
						},
						enableMouseTracking: true
					}
				},
				series: [{
					type: 'column',
					name: 'Soll',
					color: '#009C0E',
					data: <%=soll%>
				}, {
					type: 'column',
					name: 'Lst',
					color: '#0000FF',
					data:  <%=lst%>
				}, {
					type: 'spline',
					name: 'Kum Soll',
					color: '#009C0E',
					data: <%=kumSoll%>
				}, {
					type: 'spline',
					name: 'Kum Lst',
					color: '#0000FF',
					data:  <%=kumLst%>
				}]
			});
			
			
		});
		</script>
		
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1>1.5 Fahrzeugaufbaustatus</h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
