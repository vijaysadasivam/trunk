<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE HTML>
<%@ include file="/app/pep/include/header.jsp"%>
<html>
	<%
		title = "1.5 Programmpunkte";
		Map<String, Object> form = new HashMap<String, Object>();//(Map<String, String>)request.getAttribute("form");
		
		form.put("fv9PPCOP", 120); //假数据
		form.put("fv9PPErste", 70);//假数据
		form.put("fv9PPNicht", 110);//假数据
		
		Integer fv9PPCOP = (Integer)form.get("fv9PPCOP");
		Integer fv9PPErste = (Integer)form.get("fv9PPErste");			
		Integer fv9PPNicht = (Integer)form.get("fv9PPNicht");
		Integer fv9Genehmigt = fv9PPCOP + fv9PPErste + fv9PPNicht;			
	%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'Modellpflegepunkte',
					style:{
						color:'black',
						fontSize:'26px',
						fontWeight: 'bold'
					}
				},
				xAxis: {
					tickWidth:1,
					tickColor:'gray',
					lineColor:'gray',
					labels:{
						y:30,
						style:{
							color:'black',
							fontSize:'16px'
						}
					},
					categories: ["Genehmigt MOP-Punkte zum ...(Fahrzeug)", "PP COP, Ersteinsatz in anderen Projekten", "PP Ersteinsatz...(Fahrzeug)", "PP nicht relevant oder Steuerungspunkte"] 
				},
				yAxis: {
					min: 0,
					max: 350,
					gridLineWidth:0,
					tickWidth:1,
					lineWidth:1,
					lineColor:'gray',
					tickColor:'gray',
					title: {
						text: ''
					},
					labels:{
						style:{
							color:'black',
							fontSize:'14px'
						}
					}
				},
				legend: {
					align: 'right',
					x: -100,
					verticalAlign: 'top',
					y: 20,
					floating: true,
					backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
					borderColor: '#CCC',
					borderWidth: 1,
					shadow: false
				},
				tooltip: {
					formatter: function() {
						return '<b>'+ this.x +'</b><br/>'+
							 this.series.name +': '+ this.y +'<br/>'+
							 'Total: '+ this.point.stackTotal;
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						borderWidth:2,
						borderColor:'black',
						shadow:false,
						dataLabels: {
							enabled: true,
							style:{
								fontWeight: 'bold',
								fontSize:'18px'
							},
							color:'black'
						}
					}
				},
			    series: [{
					name: '',
					showInLegend: false,
					data: [{  
							y: <%=fv9Genehmigt %>,
							low:0,
							color: '#0000FF'
						}, {
						 	y: <%=fv9PPCOP %>,
						 	low:0,
							color: '#AED4F8'
						}, {
							y: <%=fv9PPErste %>,
							low: <%=fv9PPCOP %>,
							color: '#AED4F8'
						}, {
							y: <%=fv9PPNicht %>,
							low: <%=fv9PPCOP + fv9PPErste %>,
							color: '#AED4F8'
						}]
				}]
			});
		});
		</script>
		<title><%=title %></title>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1><%=title %></h1></div>
			<div id="content">
				<div id="chart" style="width: 800px; height: 400px; margin: 0 auto"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>