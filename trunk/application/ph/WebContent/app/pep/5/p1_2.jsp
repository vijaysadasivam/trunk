<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="json.JSONArray"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
			Map form = (Map)request.getAttribute("form");	
			List<String> fv9KarosserStyle = (List<String>)form.get("fv9KarosserStyle");
			List<String> fv9KarosserStatus = (List<String>)form.get("fv9KarosserStatus");
			List<String> fv9KarossStCom_GM = (List<String>)form.get("fv9KarossStCom_GM");
			List<String> fv9KarossMab_GM = (List<String>)form.get("fv9KarossMab_GM");
			List<String> fv9KarossStCom_CN = (List<String>)form.get("fv9KarossStCom_CN");
			List<String> fv9KarossMab_CN = (List<String>)form.get("fv9KarossMab_CN");
		%>
	</head>

<body>
<div id="container">
	<div id="nr">
	<div id="top"><h1><%=title %></h1></div>
    <div id="content" style="margin-top:20px;font-size:12px">
    	<div id="datatable1" style="width: 800px;">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
				<tr>
					<td width="239" class="pg" colspan="2">&nbsp;</td>
					<td width="311" class="pg"><h2>Status</h2></td>
					<td width="433" class="pg"><h2>Maßnahmen</h2></td>
				</tr>
				  
				<%
				if (fv9KarosserStyle != null && fv9KarosserStyle.size() > 0) {
				  for(int i=0; i<fv9KarosserStyle.size(); i++){
				%>
				<tr>
					<td valign="top" class="pgpg" style="width: 200px;padding:5px">
						<h2> <%= fv9KarosserStyle.get(i) %></h2>
					</td>
					<td valign="top" class="pgpg" style="width: 39px;padding:5px">
						<% if(fv9KarosserStatus.get(i).equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9KarosserStatus.get(i).equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9KarosserStatus.get(i).equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg" style="padding:5px">
						<div>
						<%if (fv9KarossStCom_GM.get(i) != null && !"".equals(fv9KarossStCom_GM.get(i))) {
						%> <%=fv9KarossStCom_GM.get(i) %><br \><%=fv9KarossStCom_CN.get(i) %>
						</div>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div>
						<%if (fv9KarossMab_GM.get(i) != null && !"".equals(fv9KarossMab_GM.get(i))) {
						%> <%=fv9KarossMab_GM.get(i) %><br \><%=fv9KarossMab_CN.get(i) %></div>
						<%} else {%>
						&nbsp;
						<%}%>
						</div>
					</td>
				</tr>
				<% 
				  }
				}
				%>
			</table>
			<div style="width: 800px; height: 50px; overflow: hidden; text-align: center;">
				<input type="button" class="change" value="切换中文" onclick="changeChinese()" />
			</div>
		</div>
		
		<div id="datatable2" style="width: 800px; display: none;">
		    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
				<tr>
					<td width="239" class="pg" colspan="2">&nbsp;</td>
					<td width="311" class="pg"><h2>Status</h2></td>
					<td width="433" class="pg"><h2>Maßnahmen</h2></td>
				</tr>
				  
				<%
				if (fv9KarosserStyle != null && fv9KarosserStyle.size() > 0) {
				  for(int i=0; i<fv9KarosserStyle.size(); i++){
				%>
				<tr>
					<td valign="top" class="pgpg" style="width: 200px;padding:5px">
						<h2> <%= fv9KarosserStyle.get(i) %></h2>
					</td>
					<td valign="top" class="pgpg" style="width: 39px;padding:5px">
						<% if(fv9KarosserStatus.get(i).equals("绿")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
						<%} else if(fv9KarosserStatus.get(i).equals("黄")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
						<%} else if(fv9KarosserStatus.get(i).equals("红")){%>
						<img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
						<%}%>
					</td>
					<td valign="top" class="pgpg" style="padding:5px">
						<div>
						<%
						if (fv9KarossStCom_CN.get(i) != null && !"".equals(fv9KarossStCom_CN.get(i))) {
						%> 
						<%=fv9KarossStCom_CN.get(i) %>
						</div>
						<%} else {%>
						&nbsp;
						<%}%>
					</td>
					<td valign="top" class="pgpg">
						<div>
						<%
						if (fv9KarossMab_CN.get(i) != null && !"".equals(fv9KarossMab_CN.get(i))) {
						%> 
						<%=fv9KarossMab_CN.get(i) %>
						</div>
						<%} else {%>
						&nbsp;
						<%}%>
						</div>
					</td>
				</tr>
				<% 
				  }
				}
				%>
			</table>
			<div style="width: 800px; height: 50px; overflow: hidden; text-align: center;">
				<input type="button" class="change" value="切换德文" onclick="changeGerman()"/>
			</div>
		</div>
	</div>
    <%@ include file="/app/pep/include/foot.jsp"%>
</div>
</body>
</html>
