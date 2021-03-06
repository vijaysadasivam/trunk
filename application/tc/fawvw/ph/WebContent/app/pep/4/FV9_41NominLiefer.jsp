<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.web.Web"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %> </title>
		<%
			//左侧图表数据
			int fv9Nominiert = 0; //已定厂 
			if (!"".equals((String)form.get("fv9Nominiert"))) {
				fv9Nominiert = Integer.parseInt((String)form.get("fv9Nominiert"));
			}
			int fv9Nichtnominiert = 0; //未定厂
			if (!"".equals((String)form.get("fv9Nichtnominiert"))) {
				fv9Nichtnominiert = Integer.parseInt((String)form.get("fv9Nichtnominiert")); 
			}
			int Gesamt = fv9Nominiert + fv9Nichtnominiert;	
			
			//右侧图表数据
			int fv9KritischeNomini = 0; //风险件
			if (!"".equals((String)form.get("fv9KritischeNomini"))) {
				fv9KritischeNomini = Integer.parseInt((String)form.get("fv9KritischeNomini"));
			}
			List<String> fv9KWNo = (List<String>)form.get("fv9KWNo");	//周数
			List<String> fv9KWNum = (List<String>)form.get("fv9KWNumber");	//数量
			List<String> fv9KWCom = (List<String>)form.get("fv9KWCom");	//备注
			int[] fv9KWNumber = Web.getIntArrByStringlist(fv9KWNum);
			
			List<String> KW = new ArrayList(); //周数
			List<Integer> value = new ArrayList(); //y值
			List<Integer> low = new ArrayList(); //low值
			List<String> desc = new ArrayList(); //每个柱的描述
			//设置风险件
			KW.add("Kritische<br>Nominierungen");
			value.add(fv9KritischeNomini);
			low.add(0);
			desc.add("");
			
			//设置每周状态
			int max = fv9KritischeNomini;
			if (fv9KWNo != null && fv9KWNo.size() > 0) {
				for (int k=0; k<fv9KWNo.size(); k++){
					KW.add("KW" + fv9KWNo.get(k));
					value.add(Integer.parseInt((String)fv9KWNum.get(k)));
					low.add(max - Integer.parseInt((String)fv9KWNum.get(k)));
					
					if (!"".equals(fv9KWCom.get(k))) {
						
						desc.add(fv9KWCom.get(k).replaceAll("\n", "<br>").replaceAll("\"", "").replaceAll("\'", ""));
					} else {
						desc.add("");
					}
					
					max = max - Integer.parseInt((String)fv9KWNum.get(k));
				}
			}
			
			//设置spaeter
			KW.add("spaeter");
			value.add(max);
			low.add(0);
			String spaeterCom = "";
			if (form.get("fv9SpaeterCom") != null) {
				spaeterCom = ((String)form.get("fv9SpaeterCom")).replaceAll("\n", "<br>").replaceAll("\"", "").replaceAll("\'", "");
			}
			desc.add(spaeterCom);
			
			String categories = Web.getStrListStr(KW);
			
			
			StringBuffer sb = new StringBuffer();
			sb.append("[");
			if (KW !=null && KW.size() > 0) {
				if (KW.size() > 1) {
					for (int m=0; m<KW.size()-1; m++) {
						sb.append("{y:" + value.get(m) + ", low: " + low.get(m) + ", desc: '"+desc.get(m)+"', color: '#E53110' },");
					}
				}
				sb.append("{y:" + value.get(KW.size()-1) + ", low: " + low.get(KW.size()-1) + ", desc: '"+desc.get(KW.size()-1)+"', color: '#E53110' }");
			}
				
			sb.append("]");
			String data_str = sb.toString();
		%>
		<script type="text/javascript">
		var chart1;
		var chart2;
	
		$(document).ready(function() {
			chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart1',
					defaultSeriesType: 'column'
				},
				title: {
					text: 'Anzahl Teile nach TEVON',
					style:{
						color:'black',
						fontSize:'16px'
					}
				},
				xAxis: {
					lineColor:'black',
					lineWidth:2,
					tickWidth:0,
					labels:{
						y:20,
						style:{
							color:'black',
							fontSize:'14px'
						}
					},
					categories: ["Gesamt", "Nominiert", "Nicht<br>nominiert"]
				},
				yAxis: {
					min: 0,
					gridLineWidth:0,
					title: {
						text: ' '
					},
					labels:{
						enabled: false,
						style:{
							color:'black'
						}
					},
					stackLabels: {
						enabled: false,
						style: {
							fontWeight: 'bold',
							color:'black'
						}
					}
				},
				tooltip: {
					formatter: function() {
						return '<b>'+ this.x +' '+ this.series.name +': '+ this.y + '</b>';
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
					//	pointWidth:33,
						shadow: false,
						groupPadding:0.11,
						pointPadding:0.11,
						dataLabels: {
							enabled: false,
							style : {
								fontWeight: 'bold',
								fontSize:'10px',
								align:'top'
							},
							color: '#4C5258',
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
					name: '',
					showInLegend: false,
					data: [{ 
							y: <%=Gesamt%>, 
							low:0,
							color: '#CFD7D9'
						}, {
						 	y: <%=fv9Nominiert%>, 
						 	low:<%=fv9Nichtnominiert%>,
							color: '#333333'
						}, {
							y: <%=fv9Nichtnominiert%>,
							low:0,
							color: '#013C66'
						}],
					dataLabels: {
						enabled: true,
						style : {
							fontSize:'12px'
						},
						verticalAlign: 'top',
						color: 'black',
						y:-10
					}
				}]
			});
		
			chart2 = new Highcharts.Chart({
				chart: {
					renderTo: 'chart2',
					defaultSeriesType: 'column'
				},
				title: {
					text: ' '
				},
				xAxis: {
					lineColor:'black',
					lineWidth:2,
					tickWidth:0,
					labels:{
						y:20,
						style:{
							color:'black',
							fontSize:'14px'
						}
					},
					title: {
						text: 'Geplante Nominierungen',
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
					title: {
						text: ' '
					},
					labels:{
						enabled: false,
						style:{
							color:'black'
						}
					},
					stackLabels: {
						enabled: false,
						style: {
							fontWeight: 'bold',
							color: 'black'
						}
					}
				},
				tooltip: {
					borderColor: '#000000',
					borderRadius: 0,
					borderWidth: 1,
					 formatter: function() {
						return '<table width="200" height="100"><tr><td>'+ this.point.desc +'</td></tr><tr><td></td></tr><tr><td></td></tr></table>';
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						//pointWidth:40,
						shadow: false,
						groupPadding:0.11,
						pointPadding:0.11,
						dataLabels: {
							enabled: true,
							style : {
								fontWeight: 'bold',
								fontSize:'12px'
							},
							verticalAlign: 'top',
							color: 'black',
							y:-10
						}
					}
				},
			    series: [{
					name: '',
					showInLegend: false,
					data: <%=data_str%>
				}]
			});
		});
		
		//, 
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
				<div style="width: 50px; height: 400px; margin: 0 auto; float: left;"></div>
				<div id="chart1" style="width: 300px; height: 500px; margin: 0; float: left;margin-top:20px"></div>
				<div id="chart2" style="width: 640px; height: 500px; margin: 0;  float: left;margin-top:40px"></div>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
