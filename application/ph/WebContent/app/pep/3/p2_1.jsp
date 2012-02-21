<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.saturn.web.Web"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title %></title>
	<%
		Map form = (Map)request.getAttribute("form");
	
		List<String> fv9FugRadName = (List<String>)form.get("fv9FugRadName"); //名称 
		List<String> fv9FugRadStatus = (List<String>)form.get("fv9FugRadStatus"); // 状态
		List<String> fv9FugRadCom_CN = (List<String>)form.get("fv9FugRadCom_CN");  //状态描述_中文
		List<String> fv9FugRadCom_GM = (List<String>)form.get("fv9FugRadCom_GM");  //状态描述_德文
		List<String> fv9FugRadMabnh_CN = (List<String>)form.get("fv9FugRadMabnh_CN");  //措施_中文
		List<String> fv9FugRadMabnh_GM = (List<String>)form.get("fv9FugRadMabnh_GM");  //措施_德文 
	
	%>
</head>
<body>
<div id="container">
	<div id="nr">
		<div id="top"><h1>3.2 Fugen und Radienplan</h1></div>
    	<div id="content">
    	<div id="datatable1" style="width: 800px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
			  <tr>
			    <td width="239" class="pg">&nbsp;</td>
			    <td width="311" class="pg"><h2>Status</h2></td>
			    <td width="433" class="pg"><h2>Maßnahmen</h2></td>
			  </tr>
			   <%
		  		for(int i=0; i<fv9FugRadName.size(); i++){
			  %>  
			  <tr>
			    <td valign="top" class="pgpg" style="width:239px;">
			    	<table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
				  		<tr>
				    		<td valign="top"><h2><%=fv9FugRadName.get(i) %> </h2></td>
				    		<td>
				    			<% if(("绿").equals(fv9FugRadStatus.get(i))){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
							<%} else if(("黄").equals(fv9FugRadStatus.get(i))){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
							<%} else if(("红").equals(fv9FugRadStatus.get(i))){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
							<%}%>
				    		</td>
				  		</tr>
					</table>
				</td>
			    <td valign="top" class="pgpg"><div class="tbnrr">
			    <%
   				if (fv9FugRadCom_GM.get(i) != null && !"".equals(fv9FugRadCom_GM.get(i))) {
    			%>
    				<%=fv9FugRadCom_GM.get(i) %>
    			<%
    				} else {
  					%>
  	    				&nbsp;
  	    			<%		
    				}
    			%>
			    </div></td>
			    <td valign="top" class="pgpg"><div class="tbnrr">
			    	<%
	    				if (fv9FugRadMabnh_GM.get(i) != null && !"".equals(fv9FugRadMabnh_GM.get(i))) {
	    			%>
	    				<%=fv9FugRadMabnh_GM.get(i) %>
	    			<%
	    				} else {
   					%>
   	    				&nbsp;
   	    			<%		
	    				}
	    			%>
			    </div></td>
			  </tr>
				<% 
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
			    <td width="239" class="pg">&nbsp;</td>
			    <td width="311" class="pg"><h2>Status</h2></td>
			    <td width="433" class="pg"><h2>Maßnahmen</h2></td>
			  </tr>
			   <%
		  		for(int i=0; i<fv9FugRadName.size(); i++){
			  %>  
			  <tr>
			    <td valign="top" class="pgpg" style="width:239px;">
			    	<table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
				  		<tr>
				    		<td valign="top"><h2><%=fv9FugRadName.get(i) %> </h2></td>
				    		<td>
				    			<% if(("绿").equals(fv9FugRadStatus.get(i))){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tud.jpg" width="30" height="70" />
							<%} else if(("黄").equals(fv9FugRadStatus.get(i))){%>
							    	<img src="<%=request.getContextPath()%>/app/pep/images/tu2.png" width="30" height="70" />	
							<%} else if(("红").equals(fv9FugRadStatus.get(i))){%>
								   <img src="<%=request.getContextPath()%>/app/pep/images/r3.png" width="30" height="70" /> 
							<%}%>
				    		</td>
				  		</tr>
					</table>
				</td>
			    <td valign="top" class="pgpg"><div class="tbnrr">
			    <%
   				if (fv9FugRadCom_CN.get(i) != null && !"".equals(fv9FugRadCom_CN.get(i))) {
    			%>
    				<%=fv9FugRadCom_CN.get(i) %>
    			<%
    				} else {
  					%>
  	    				&nbsp;
  	    			<%		
    				}
    			%>
			    </div></td>
			    <td valign="top" class="pgpg"><div class="tbnrr">
			    	<%
	    				if (fv9FugRadMabnh_CN.get(i) != null && !"".equals(fv9FugRadMabnh_CN.get(i))) {
	    			%>
	    				<%=fv9FugRadMabnh_CN.get(i) %>
	    			<%
	    				} else {
   					%>
   	    				&nbsp;
   	    			<%		
	    				}
	    			%>
			    </div></td>
			  </tr>
				<% 
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
