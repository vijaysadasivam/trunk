<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@page import="java.util.ArrayList"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<%@ include file="/app/pep/include/header.jsp"%>
		<title><%=title %></title>
		<%
			Map form = (Map)request.getAttribute("form");		
			List<String> fv9ErprobStyle = (List)form.get("fv9ErprobStyle"); //实验及路试
			List<String> fv9ErprobStatus = (List)form.get("fv9ErprobStatus"); //实验及路试状态
			List<String> fv9ErprobStCom_GM = (List)form.get("fv9ErprobStCom_GM"); //当前状态描述-德文
			List<String> fv9ErprobNachSch_GM = (List)form.get("fv9ErprobNachSch_GM"); //下一步工作描述-德文
		%>
	</head>
	<body>
		<div id="container">
			<div id="nr">
			<div id="top"><h1><%=title %></h1></div>
			<div id="contentt">
				<table width="96%" border="0" cellspacing="5" cellpadding="0" class="ed">
			        <tr>
			        	<td width="19%">&nbsp;</td>
			        	<td width="81%"  style="border-bottom:1px solid #424242;">
				        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
					            <tr>
						            <td>Aktueller Status</td>
						            <td>Nachste Status</td>
					            </tr>
				            </table>
				        </td>
			        </tr>
			        <%
						if (fv9ErprobStyle != null && fv9ErprobStyle.size() >0) {
							for (int i=0; i<fv9ErprobStyle.size(); i++){
								String Style = (String)fv9ErprobStyle.get(i);
								String status = (String)fv9ErprobStatus.get(i);
								String stcom_gm = (String)fv9ErprobStCom_GM.get(i);
								String nachsch_gm = (String)fv9ErprobNachSch_GM.get(i);
					%>
					 <tr>
			          <td width="19%">
				          <div class="kbg">
				          	<div class="he">
					          	<div class="wz"><h2><%=Style %></h2></div>
					          	<div class="tupian">
					          	<%
					          	if ("红".equals(status)) {
					          	%>
					          		<img src="../images/redStatus.png" />
					          	<%
					          	}
					          	if ("黄".equals(status)) {
					          	%>
					          		<img src="../images/yellowStatus.png" />
					          	<%
						        }
					          	if ("绿".equals(status)) {
					          	%>
					          		<img src="../images/greenStatus.png" />
					          	<%
					          	}
					          	%>
					          	</div>
					          	<div class="clear"></div>
					          </div>
				          </div>
			          </td>
			          <td width="81%" valign="top" class="xx"><table width="98%" border="0" cellspacing="2" cellpadding="0">
			            <tr>
			              <td height="25">
			              	<table width="98%" border="0" cellspacing="2" cellpadding="0">
					            <tr>
					              <td width="49%" height="25"><%=stcom_gm %></td>
					              <td width="51%" valign="top"><%=nachsch_gm %></td>
					            </tr>
					          </table>
			              </td>
			            </tr>
			          </table></td>
			        </tr>
					<%
							}
						}
			        %>		
			       
			      </table>
			</div>
			<%@ include file="/app/pep/include/foot.jsp"%>
		</div>	
	</body>
</html>
