<%@page import="java.util.ArrayList"%>
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
		
		List<String> KWNo = (List)form.get("fv9KWNo");
		List<String> PresswerkNum = (List)form.get("fv9PresswerkNum");
		List<String> KonzernNum = (List)form.get("fv9KonzernNum");
		List<String> PrognoseNum = (List)form.get("fv9PrognoseNum");
		
		String fv9KWNo = Web.getNumberListStr(KWNo);
		String fv9PresswerkNum = Web.getNumberListStr(PresswerkNum);
		String fv9KonzernNum = Web.getNumberListStr(KonzernNum);
		String fv9PrognoseNum = Web.getNumberListStr(PrognoseNum);
		
		List<String> fv9KW = (List)form.get("fv9KW");
		List<String> fv9Name = (List)form.get("fv9Name");
		List<String> fv9Score = (List)form.get("fv9Score");
		List<String> fv9Option = (List)form.get("fv9Option");

		List<String> newPresswerk = new ArrayList();
		for(int i=0; i<PresswerkNum.size(); i++){
			String table = "<table border=\"1\" style=\"background-color: blue;\">";
			for(int k=0; k<fv9KW.size(); k++) {
				if ((!"".equals(fv9KW.get(k))) && (fv9KW.get(k).equals(KWNo.get(i)))) {
					table += "<tr>";
					table += "	<td style=\"width: 180px;height: 20px;\">" + fv9Name.get(k) + "</td>";
					table += "	<td style=\"width: 50px; height: 20px;\">" + fv9Score.get(k) + " Pkt.</td>";
					if ("Yes".equals(fv9Option.get(k))) {
						table += "	<td style=\"width: 28px; height: 20px;\">√</td>";
					}
					if ("No".equals(fv9Option.get(k))) {
						table += "	<td style=\"width: 28px; height: 20px;\">×</td>";
					}
					table += "</tr><br>";
				}
			}
			table += "</table>";
			newPresswerk.add(mergeTableAndNum(PresswerkNum.get(i), table));
		}
		
		String presswerk = Web.getStrListStr(newPresswerk);
		presswerk = presswerk.replaceAll("\"", "");
		
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
						tickLength: 0,
						lineColor:'black',
						lineWidth:2,
						labels: {
							x:-2,
							y:20,
							style: {
								 font: 'normal 12px Verdana, sans-serif',
								 color: 'black'
							}
					},
						categories: <%=fv9KWNo%>
					},
					yAxis: {
						min: 0,
						max: 260,
						gridLineWidth: 0,
						lineWidth: 2,
						lineColor: 'black',
						labels: {
							style: {
								padding: '5px',
								color: 'black'
							}
						},
						title: {
							rotation:0,
							text: 'Punkte',
							x:-15,
							y:-160,
							style: {
								color: 'black',
								fontSize:'14px'
							}
						}
					},
					legend: {
						layout: 'vertical',
						align: 'right',
						verticalAlign: 'top',
						x: -10,
						y: 100,
						borderWidth: 1,
						borderRadius: 0,
						shadow: false
					},
					tooltip: {
						/* formatter: function() {
			                return '<b>'+ this.series.name +'</b><br/>'+
							this.x +'<br/>'+ this.y;
						} */
						borderWidth: 0,
						shadow:false,
						 formatter: function() {
							return '<table style="border-collapse:collapse;border:solid 1px #000;" width="350" height="50" cellpadding="0" cellspacing="0"><tr><td width="50%" style="border-bottom:solid 1px #000;border-right:solid 1px #000;text-align:left;"> '+  this.series.name +'</td><td width="30%" style="border-bottom:solid 1px #000;border-right:solid 1px #000">'+ this.y +'</td><td width="25%" style="border-bottom:solid 1px #000;text-align:center">×</td></tr><tr><td style="border:solid 1px #000;border-bottom:none;border-left:none">'+  this.series.name +'</td><td style="border:solid 1px #000;border-bottom:none">'+ this.x +'</td><td style="border:solid 1px #000;border-bottom:none;border-right:none;text-align:center">√</td></tr></table>';
						}
					},
					plotOptions: {
						column: {
							stacking: 'normal',
							pointWidth:15,
							shadow: false,
							borderColor:'black',
							borderWidth:1,
							dataLabels: {
								enabled: true,
								style : {
									fontWeight: 'bold',
									fontSize:'12px'
								},
								color: 'white',
								rotation: -90,
								x:5,
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
						data: <%=presswerk%>,
						color: '#00235A'
					}, {
						type: 'spline',
						name: 'Prognose',
						data: <%=fv9PrognoseNum%>,
						color: '#99FF99',
						marker:{
							fillColor: '#FFFFFF',
			                lineWidth: 2,
			                lineColor: null,
			                radius: 3
						},
						enableMouseTracking: false
					}, {
						type: 'spline',
						name: 'Konzernziel',
						data: <%=fv9KonzernNum%>,
						color: '#E63110',
						marker:{
							fillColor: '#FFFFFF',
			                lineWidth: 2,
			                lineColor: null,
			                radius: 3
						},
						enableMouseTracking: false
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
				<div id="chart" style="width: 850px; height: 400px; margin: 0 auto;"></div>
					<%
					int[] arr = Web.getIntArrByStringlist( (List<String>)form.get("fv9KWNo"));
					
					int size = arr.length;//一共有多少个柱子 
					double pillar = 0.0;
					
					double value1 = 0 ; 
					double value2 = 0;
					double value3 = 0;
					double value4 = 0;
					if(size > 0){
						int maxKw = arr[size-1];
						int minKw = arr[0];
						//假定总长度是595.0px 先算出一共有多少个柱子，每个柱子的宽度 px
						double totalWidth = 596.0;//总长度是 750px 
						pillar = totalWidth/size;  //每个柱子的宽度 px
					
						String vff_start = "";
						String pvs_start = "";
						String os_start = "";
						String sop_start = "";
						String me_start = "";
						
						if(request.getSession().getAttribute("DATE_VFF") != null){
							vff_start = request.getSession().getAttribute("DATE_VFF").toString();
						}
						if(request.getSession().getAttribute("DATE_PVS") != null){
							pvs_start = request.getSession().getAttribute("DATE_PVS").toString();
						}
						if(request.getSession().getAttribute("DATE_0S") != null){
							os_start = request.getSession().getAttribute("DATE_0S").toString();
						}
						if(request.getSession().getAttribute("DATE_SOP") != null){
							sop_start = request.getSession().getAttribute("DATE_SOP").toString();
						}
						if(request.getSession().getAttribute("DATE_ME") != null){
							me_start = request.getSession().getAttribute("DATE_ME").toString();
						}
						
						int[] vffArr = Web.getMilepostArr(vff_start,pvs_start);
						int[] pvsArr = Web.getMilepostArr(pvs_start,os_start);
						int[] osArr = Web.getMilepostArr(os_start,sop_start);
						int[] sopArr = Web.getMilepostArr(sop_start,me_start);
						
						int vffPillarNum = Web.getNum(vffArr,arr);//柱子个数
						int pvsPillarNum =  Web.getNum(pvsArr,arr);;//柱子个数
						int osPillarNum =  Web.getNum(osArr,arr);;//柱子个数
						int sopPillarNum =  Web.getNum(sopArr,arr);;//柱子个数
						
						value1 = vffPillarNum * pillar ; 
						
						if(vffPillarNum > 0 && pvsPillarNum != 0){
							value2 = (pvsPillarNum - 1)* pillar ;
						} else {
							value2 = pvsPillarNum * pillar ;
						}
						
						if(pvsPillarNum > 0 && osPillarNum != 0){
							value3 = (osPillarNum - 1 )* pillar ;	
						} else {
							value3 = osPillarNum * pillar ;
						}
						
						if(osPillarNum > 0 && sopPillarNum != 0){
							value4 = (sopPillarNum - 1)* pillar ;			
						} else {
							value4 = sopPillarNum* pillar ;
						}
		
					}
					
					double sum = value1 + value2 + value3 + value4;
					%>
		<div id="meilsteinouter" style="width: 850px;">
				<div id="meilstein" style="width: <%=sum%>px; height: 30px; margin-left: 130px; text-align: center; overflow: hidden; ">
					<div style=" width: <%=value1 %>px; height: 30px; float: left; background-color: #99FF99; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">VFF</span></div>
					<div style=" width: <%=value2 %>px; height: 30px; float: left; background-color: #33CC33; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">PVS</span></div>
					<div style=" width: <%=value3 %>px; height: 30px; float: left; background-color: #006600; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">0S</span></div>
					<div style=" width: <%=value4 %>px; height: 30px; float: left; background-color: #333333; vertical-align: bottom; padding-top: 5px;"><span style="color: white;">SOP</span></div>
				</div>
		</div>		
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>