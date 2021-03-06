<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>	
<%@page import="com.saturn.ph.FormManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@ include file="/app/pep/include/header.jsp"%>
	<title><%=title %></title>
	<%
		List<String> fv9LogistikStyle = new ArrayList<String>();
		List<String> fv9LogistikStatus = new ArrayList<String>(); 
		List<String> fv9LogistikStCom_GM = new ArrayList<String>(); 
		List<String> fv9LogistikStCom_CN = new ArrayList<String>();
		List<String> fv9LogistikMab_GM = new ArrayList<String>(); 
		List<String> fv9LogistikMab_CN = new ArrayList<String>();
		
		if(form.get("fv9LogistikStyle") != null){
			fv9LogistikStyle = (List<String>)form.get("fv9LogistikStyle");
		}
		if(form.get("fv9LogistikStatus") != null){
			fv9LogistikStatus = (List<String>)form.get("fv9LogistikStatus");
		}
		if(form.get("fv9LogistikStCom_GM") != null){
			fv9LogistikStCom_GM = (List<String>)form.get("fv9LogistikStCom_GM");
		}
		if(form.get("fv9LogistikStCom_CN") != null){
			fv9LogistikStCom_CN = (List<String>)form.get("fv9LogistikStCom_CN");
		}
		if(form.get("fv9LogistikMab_GM") != null){
			fv9LogistikMab_GM = (List<String>)form.get("fv9LogistikMab_GM");
		}
		if(form.get("fv9LogistikMab_CN") != null){
			fv9LogistikMab_CN = (List<String>)form.get("fv9LogistikMab_CN");
		}
		
	%>
</head>
<body>
	<div id="container">
		<div id="nr">
		<div id="top">
			<div class="fl"><%=status_left %></div>
			<div class="fr"><%=status_right %></div>
			<h1>
				<a href="javascript:changeChinese()" id="german"><%=title %></a>
				<a href="javascript:changeGerman()" id="china" style="display: none;"><%=title %></a>
			</h1>
		</div>
	    <div id="content" >
		    <div id="datatable1" style="width: 900px;margin:5px auto; margin-top: 30px; font-family: Arial; ">
			    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table" style="overflow: hidden;">
					  <tr>
					    <td width="239" class="pg">&nbsp;</td>
					    <td width="311" class="pg"><h2>Status</h2></td>
					    <td width="433" class="pg" style="font-size: 18px;">Naechste Schritte</td>
					  </tr>
					  <%
					  for(int i=0; i<fv9LogistikStyle.size(); i++){
						  %>
						  <tr>
						    <td valign="top" class="pgpg" style="width:239px; height: 125px;">
							    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
								  <tr>
						   			 <td valign="top" width="60%"><h2> <%=Web.replaceSpecial(fv9LogistikStyle.get(i)) %></h2></td>
								   	 <td>
								   		<% if(("绿").equals(fv9LogistikStatus.get(i))){%>
										    	<img src="<%=request.getContextPath()%>/app/pep/images/GreenLight.png" width="30" height="70" />
										<%} else if(("黄").equals(fv9LogistikStatus.get(i))){%>
										    	<img src="<%=request.getContextPath()%>/app/pep/images/YellowLight.png" width="30" height="70" />	
										<%} else if(("红").equals(fv9LogistikStatus.get(i))){%>
											   <img src="<%=request.getContextPath()%>/app/pep/images/RedLight.png" width="30" height="70" /> 
										<%}%>
								   	 </td>
								  </tr>
								</table>
							</td>
				    		<td width="60%" valign="top" class="pgpg" style="height: 125px;">
				    			<div class="tbnrr">
				    			<%if (fv9LogistikStCom_GM.get(i) != null && !"".equals(fv9LogistikStCom_GM.get(i))) {%>
				    				<%=Web.replaceSpecial(fv9LogistikStCom_GM.get(i)) %>
				    			<%} else {%>
			   	    				&nbsp;
			   	    			<%} %>
				    			</div>
						    </td>
				   			<td width="40%" valign="top" class="pgpg" style="height: 125px;">
				   			 	<div class="tbnrr">
				   			 	<%if (fv9LogistikMab_GM.get(i) != null && !"".equals(fv9LogistikMab_GM.get(i))) {%>
				    			<%=Web.replaceSpecial(fv9LogistikMab_GM.get(i)) %>
				    			<%} else {%>
			   	    				&nbsp;
			   	    			<%}%>
				   			 	</div>
							</td>
						</tr>
						  <% }%>
				</table>
			</div>
			
			<div id="datatable2" style="width: 900px; display: none;margin:5px auto; margin-top: 30px;">
			    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
					  <tr>
					    <td width="239" class="pg">&nbsp;</td>
					    <td width="311" class="pg"><h2>Status</h2></td>
					    <td width="433" class="pg" style="font-size: 18px;">Naechste Schritte</td>
					  </tr>
					  <%
					  for(int i=0; i<fv9LogistikStyle.size(); i++){
						  %>
						  <tr>
						    <td valign="top" class="pgpg" style="width:239px; height: 125px;">
							    <table width="220" border="0" cellspacing="0" cellpadding="0" style="margin:5px 5px 5px 0px;">
								  <tr>
						   			 <td valign="top" width="60%"><h2> <%=Web.replaceSpecial(fv9LogistikStyle.get(i)) %></h2></td>
								   	 <td>
								   		<% if(("绿").equals(fv9LogistikStatus.get(i))){%>
										    	<img src="<%=request.getContextPath()%>/app/pep/images/GreenLight.png" width="30" height="70" />
										<%} else if(("黄").equals(fv9LogistikStatus.get(i))){%>
										    	<img src="<%=request.getContextPath()%>/app/pep/images/YellowLight.png" width="30" height="70" />	
										<%} else if(("红").equals(fv9LogistikStatus.get(i))){%>
											   <img src="<%=request.getContextPath()%>/app/pep/images/RedLight.png" width="30" height="70" /> 
										<%}%>
								   	 </td>
								  </tr>
								</table>
							</td>
				    		<td width="60%" valign="top" class="pgpg" style="height: 125px;">
				    			<div class="tbnrr">
				    			<%if (fv9LogistikStCom_CN.get(i) != null && !"".equals(fv9LogistikStCom_CN.get(i))) {%>
				    				<%=Web.replaceSpecial(fv9LogistikStCom_CN.get(i)) %>
				    			<%} else {%>
			   	    				&nbsp;
			   	    			<%} %>
				    			</div>
						    </td>
				   			<td width="40%" valign="top" class="pgpg" style="height: 125px;">
				   			 	<div class="tbnrr">
				   			 	<%if (fv9LogistikMab_CN.get(i) != null && !"".equals(fv9LogistikMab_CN.get(i))) {%>
				    			<%=Web.replaceSpecial(fv9LogistikMab_CN.get(i)) %>
				    			<%} else {%>
			   	    				&nbsp;
			   	    			<%}%>
				   			 	</div>
							</td>
						</tr>
						  <% }%>
				</table>
			</div>
			
		</div>
	    <%@ include file="/app/pep/include/foot.jsp"%>
	</div>
</body>
</html>
