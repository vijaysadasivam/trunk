<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
		String categories ="[]";
		String data = "[]";	
		List<String> fv9StyleName = new ArrayList<String>();
		List<String> fv9StyleNum = new ArrayList<String>(); 
		
		if(form.get("fv9StyleName") != null){
			 fv9StyleName = (List<String>)form.get("fv9StyleName");
		}
		
		if(form.get("fv9StyleNum") != null){
			fv9StyleNum = (List<String>)form.get("fv9StyleNum");
		}
		
		int total = 25;// TODO:计算total的值   
		int max = 0;
			
		if(fv9StyleName.size()>0 && fv9StyleNum.size()> 0 &&fv9StyleName.size() == fv9StyleNum.size()){
		
			int index1 = fv9StyleName.indexOf("Planungs durchlauf");
			int index2 = fv9StyleName.indexOf("Status 710");
			int index3 = fv9StyleName.indexOf("Status 485");
			int index4 = fv9StyleName.indexOf("Status 487/496");
			int index5 = fv9StyleName.indexOf("Status 800");
			int index6 = fv9StyleName.indexOf("VFF");
			int index7 = fv9StyleName.indexOf("PVS");
			int index8 = fv9StyleName.indexOf("0-Serie");
			int index9 = fv9StyleName.indexOf("SOP");
			int index10 = fv9StyleName.indexOf("Offen");
			
			
			int num1 = Integer.parseInt(fv9StyleNum.get(index1));
			int num2 = Integer.parseInt(fv9StyleNum.get(index2));
			int num3 = Integer.parseInt(fv9StyleNum.get(index3));
			int num4 = Integer.parseInt(fv9StyleNum.get(index4));
			int num5 = Integer.parseInt(fv9StyleNum.get(index5));
			int num6 = Integer.parseInt(fv9StyleNum.get(index6));
			int num7 = Integer.parseInt(fv9StyleNum.get(index7));
			int num8 = Integer.parseInt(fv9StyleNum.get(index8));
			int num9 = Integer.parseInt(fv9StyleNum.get(index9));
			int num10 = Integer.parseInt(fv9StyleNum.get(index10));
			
			
			String[] keys = new String[fv9StyleName.size() + 2];
			int[] lows = new int[fv9StyleName.size() + 2];
			int[] values = new int[fv9StyleName.size() + 2];
			String[] colors = {"'#0000FF'", "'#F9A700'", "'#339966'", "'#339966'", "'#339966'", "'#339966'", 
					"'#0000FF'", "'#00FF00'", "'#00CCFF'", "'#00CCFF'", "'#00CCFF'", "'#00CCFF'"};
			
			keys[0] = "Gesamt"; values[0] = num1+num2+num3+num4+num5; lows[0] = 0;
			keys[index1+1] = "Planungs durchlauf"; values[index1+1] = num1; lows[index1+1] = values[0]-values[index1+1];
			keys[index2+1] = "Status 710"; values[index2+1] = num2; lows[index2+1] = lows[index1+1]-values[index2+1];
			keys[index3+1] = "Status 485"; values[index3+1] = num3; lows[index3+1] = lows[index2+1]-values[index3+1];
			keys[index4+1] = "Status 487/496"; values[index4+1] = num4; lows[index4+1] = lows[index3+1]-values[index4+1];
			keys[index5+1] = "Status 800"; values[index5+1] = num5; lows[index5+1] = lows[index4+1]-values[index5+1];
			
			keys[6] = "genehmigt/ techn.i.O."; values[6] = num6+num7+num8+num9+num10; lows[6] = 0;
			keys[index6+2] = "VFF"; values[index6+2] = num6; lows[index6+2] = values[6] - values[index6+2];
			keys[index7+2] = "PVS"; values[index7+2] = num7; lows[index7+2] = lows[index6+2]-values[index7+2];
			keys[index8+2] = "0-Serie"; values[index8+2] = num8; lows[index8+2] = lows[index7+2]-values[index8+2];
			keys[index9+2] = "SOP"; values[index9+2] = num9; lows[index9+2] = lows[index8+2]-values[index9+2];
			keys[index10+2] = "Offen"; values[index10+2] = num10; lows[index10+2] = lows[index9+2]-values[index10+2];
			
			categories = Web.getStrFromStringArray(keys);
			data = "";	
			for(int i=0; i<keys.length-1; i++){
				data += "{ y:" + values[i] + ", low:" + lows[i] + ", color:" + colors[i] + "}, ";
			}
			data += "{ y:" + values[keys.length-1] + ", low:" + lows[keys.length-1] + ", color:" + colors[keys.length-1] + "}";
			total = values[0] + 5;
			
		}
		%>
		<script type="text/javascript">
		var chart;
		$(document).ready(function() {
			chart = new Highcharts.Chart({
				chart: {
					renderTo: 'chart',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'Anzahl Aenderungen',
					style:{
						color:'black',
						fontSize:'20px'
					},
					align:'left',
					y:10
				},
				xAxis: {
					lineWidth:2,
					tickWidth:0,
					labels:{
						y:30,
						style:{
							color:'black',
							fontSize:'14px'
						}
					},
					categories: <%=categories%>
				},
				yAxis: {
					min: 0,
					gridLineWidth:0,
					tickWidth:1,
					tickPosition:'inside',
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
					},
					stackLabels: {
						enabled: false,
						style: {
							fontSize:'14px',
							color: 'black'
						}
					}
				},
				legend: {
					align: 'right',
					verticalAlign: 'top',
					y: 20,
					floating: true,
					borderWidth: 1,
					shadow: false,
					enabled:false
				},
				tooltip: {
					formatter: function() {
						return '<b>'+ this.x +'</b><br/>'+
							 this.series.name +': '+ this.y +'<br/>';
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
				//		pointWidth:30,
						groupPadding:0.06,
						pointPadding:0.06,
						borderWidth:0,
						shadow:false,
						dataLabels: {
							enabled: true,
							color:'black',
							verticalAlign: 'top',
							y:-10,
							style:{
								fontSize:'14px'
							},
							formatter: function() {
								if (this.y == 0 || this.y == 0.0 || this.y == null) {
									return '';
								}
								return this.y + '';
							}
						}
					}
				},
			    series: [{
					name: 'Anzahl Aenderungen',
					data: [<%=data%>]
				},{
					data: [[5.5, 0], [ 5.501, <%=total%>]],
					color: '#5762A0',
					dashStyle: 'dash',
					lineWidth: 1,
					marker: {enabled: false},
					shadow: false,
					showInLegend: false,
					enableMouseTracking: false,
					type: 'line',
					name :"",
					dataLabels: {
						enabled: true,
						formatter: function() {
							return "<B></B>";
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
					<div class="fl"><%=status_left %></div>
					<div class="fr"><%=status_right %></div>
					<h1><%=title %></h1>
				</div>
				<div id="content">
					<div style="width: 900px; height: 80px; margin: 0px 0px auto; font-size: 18px; text-align: left; padding-top: 10px; padding-left: 650px;
						font-family: Arial;">
						Status 485&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;technisch i.O.  <br>
						Status 487/496&nbsp;&nbsp;&nbsp;&nbsp;genehmigt  <br>
						Status 800&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Terminfindung
					</div>
					<div id="chart" style="width: 900px; height: 470px; margin:0px 30px auto;"></div>
				</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
			</div>	
		</div>
	</body>
</html>
