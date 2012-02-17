<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/app/pep/include/header.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta>
	<title><%=title %></title>
	<%
	Map form = (Map)request.getAttribute("form");
	List<String> fv9FreigabeStyle = (List<String>)form.get("fv9FreigabeStyle");
	List<String> fv9FreigabeStatus = (List<String>)form.get("fv9FreigabeStatus");
	List<String> fv9AnzahlNum = (List<String>)form.get("fv9AnzahlNum");
	List<String> fv9FreigSollNum = (List<String>)form.get("fv9FreigSollNum");
	List<String> fv9FreiglstNum = (List<String>)form.get("fv9FreiglstNum");
	List<String> fv9FreigCom_CN = (List<String>)form.get("fv9FreigCom_CN");
	List<String> fv9FreigCom_GM = (List<String>)form.get("fv9FreigCom_GM");
	List<Integer> fv9OffenNum = new ArrayList<Integer>();
	for(int i=0; i<fv9AnzahlNum.size(); i++) {
		fv9OffenNum.add(Integer.parseInt(fv9FreigSollNum.get(i)) - Integer.parseInt(fv9FreiglstNum.get(i)));
	}
	%>
</head>
<body>
	<div id="container">
		<div id="nr">
		<div id="top"><h1><%=title %></h1></div>	
		<div id="content">
			<div id="datatable" style="width: 800px; height: 350px; margin: 0 auto;margin-top: 30px;">
				<table width="80%" cellspacing="2" rules="rows" >
					<tr style="border-bottom:2px solid #333333;">
						<td></td>
						<td>Kennzahlen</td>
						<td>Bemerkung</td>	
					</tr>
					<%
					for(int i=0; i<fv9FreigabeStyle.size(); i++) {
						String imagePath = "../images/";	
						if ("红".equals(fv9FreigabeStatus.get(i))) {
							imagePath += "light_red.jpg";
						}
						if ("黄".equals(fv9FreigabeStatus.get(i))) {
							imagePath += "light_yellow.jpg";
						}
						if ("绿".equals(fv9FreigabeStatus.get(i))) {
							imagePath += "light_green.jpg";
						}
					%>
					<tr border="2" style="border-collapse: collapse" bordercolor="#333333">
						<td  width="30%" ><%=fv9FreigabeStyle.get(i) %>
							<img src="<%=imagePath %>" align="right" border=0 width=50 height=56> 
						</td>
						<td  width="22%">
							<table>
								<tr><td>Anzahl</td><td>&nbsp;=&nbsp;</td><td><%=fv9AnzahlNum.get(i) %></td></tr>
								<tr><td>Soll</td><td>&nbsp;=&nbsp;</td><td><%=fv9FreigSollNum.get(i) %></td></tr>
								<tr><td>Ist</td><td>&nbsp;=&nbsp;</td><td><%=fv9FreiglstNum.get(i) %></td></tr>
								<tr><td>offen</td><td>&nbsp;=&nbsp;</td><td><%=fv9OffenNum.get(i)%></td></tr>
							</table>
						</td>
						<td  width="48%" >
							<%= fv9FreigCom_GM.get(i)%>
						</td>
					</tr>
					<%		
						}
					%>
					
				</table>
			</div>
		</div>
		
		<%@ include file="/app/pep/include/foot.jsp"%>
	</div>	
</body>
</html>