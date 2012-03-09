<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>	

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
		
		String fv9KWNo = Web.getNumberListStr(form.get("fv9KWNo"));
		String fv9Montage = Web.getNumberListStr(form.get("fv9Montage"));
		String fv9Lack = Web.getNumberListStr(form.get("fv9Lack"));
		String fv9Kaufteile = Web.getNumberListStr(form.get("fv9Kaufteile"));
		String fv9Karosseriebau = Web.getNumberListStr(form.get("fv9Karosseriebau"));
		String fv9Presswerk = Web.getNumberListStr(form.get("fv9Presswerk"));
		String fv9Prognose = Web.getNumberListStr(form.get("fv9Prognose"));
		
		%>
		<script type="text/javascript">
		var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'chart'
					},
					title: {
						text: ' '
					},
					xAxis: {
						lineWidth:2,
						lineColor:'black',
						tickColor:'black',
						labels: {
							y:25,
							style: {
								color:'black',
								font_size:'12px'
							}
						},
						categories:  <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						lineWidth:2,
						gridLineWidth: 0,
						tickWidth:2,
						tickColor:'black',
						lineColor:'black',
						title: {
							rotation:0,
							text: 'Punkte',
							x:-12,
							y:-180,
							style: {
								color:'gray',
								fontSize:'12px'
							}
						},
						labels: {
							style: {
								color:'black'
							}
						},
						stackLabels: {
							enabled: true,
							y:-15,
							style: {
								color: 'black',
								fontSize:'12px'
							},
							formatter: function() {
								if (this.total == 0) {
									return '';
								}
								return this.total + '';
							}
						}
					},
					legend: {
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 60,
						borderWidth: 0,
						shadow:false
					},
					tooltip: {
						formatter: function() {
							return '<b>'+ this.x +'</b><br/>'+
								 this.series.name +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							pointWidth:28,
							shadow: false,
							borderColor:'black',
							borderWidth:0,
							dataLabels: {
								enabled: true,
								style : {
									fontSize:'11px'
								},
								color: 'white',
								formatter: function() {
									if (this.y == 0) {
										return '';
									}
									return this.y + '';
								}
							}
						}
					},

				    series: [{
						type: 'column',
						name: 'Presswerk',
						data: <%=fv9Presswerk%>,
						color: '#BBC2C5',
						dataLabels: {
							enabled: true,
							style : {
								fontSize:'11px'
							},
							color: 'black',
							formatter: function() {
								if (this.y == 0) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'column',
						name: 'Karosseriebau',
						data: <%=fv9Karosseriebau%>,
						color: '#AED4F8',
						dataLabels: {
							enabled:true,
							formatter: function() {
								if (this.y == 0) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'column',
						name: 'Kaufteil',
						data: <%=fv9Kaufteile%>,
						color: '#91AFFF',
						dataLabels: {
							enabled:true,
							formatter: function() {
								if (this.y == 0) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'column',
						name: 'Lack',
						data: <%=fv9Lack%>,
						color: '#BBC2C5',
						dataLabels: {
							enabled:true,
							formatter: function() {
								if (this.y == 0) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'column',
						name: 'Montage',
						data: <%=fv9Montage%>,
						color: '#00235A',
						dataLabels: {
							enabled:true,
							formatter: function() {
								if (this.y == 0) {
									return '';
								}
								return this.y + '';
							}
						}
					}, {
						type: 'spline',
						name: 'Prognose',
						data: <%=fv9Prognose%>,
						color: '#A6DD00',
						marker: {
							enabled: false,
							shadow:false,
							states: {
								hover: {
									enabled: true,
									symbol: 'circle',
									radius: 5,
									lineWidth: 1
								}
							}
						}
					}]
				});
			});
		</script>
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
				<div id="chart" style="width: 850px; height: 400px; margin: 50px auto"></div>
				<%
				if (Web.getListYesOrNo((List<String>)form.get("fv9KWNo"))) {
					int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
					
					double totalWidth = 628.0;
					Map<String,Double> lichenbeiPillarNum = Web.getLCBPillar(Web.getLCBNum(request, arr), arr, totalWidth);
					double value1 = lichenbeiPillarNum.get("vffPillar"); 
					double value2 = lichenbeiPillarNum.get("pvsPillar");
					double value3 = lichenbeiPillarNum.get("osPillar");
					double value4 = lichenbeiPillarNum.get("sopPillar");
					double sum = value1 + value2 + value3 + value4;
				%>
				<div id="meilsteinouter" style="width: 800px;">
					<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 105px; text-align: center; overflow: hidden; ">
						<div style=" width: <%=value1 %>px; height: 30px; float: left; background-color: #99FF99; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">VFF</span></div>
						<div style=" width: <%=value2 %>px; height: 30px; float: left; background-color: #33CC33; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">PVS</span></div>
						<div style=" width: <%=value3 %>px; height: 30px; float: left; background-color: #006600; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">0S</span></div>
						<div style=" width: <%=value4 %>px; height: 30px; float: left; background-color: #333333; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">SOP</span></div>
					</div>
				</div>
				<%
				}
				
				%>
				
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
