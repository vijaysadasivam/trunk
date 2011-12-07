<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=WebUtils.getTitle(request) %></title>
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/shouye.css"/>
<link href="css/page.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin:0px; padding:0px;">
<%@ include file="include/top.jsp" %>
    
    <div id="content">
      <%@ include file="include/navigate.jsp" %>
      <div class="right">
      	<div class="nrbt">
        	<div class="biaoti"><%=__aname%></div>
        	<div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;<a href="<%=WebUtils.getLink(__cid, null)%>"><%=__cname %></a>&nbsp;|&nbsp;<%=__aname%></div>
        	<div class="clear"></div>
        </div>
        <div class="nrzj">
        	<div class="neirong">
        	  <table cellspacing="5" cellpadding="5" width="95%"  height="337px" align="center" border="0">
        	    <tbody>
        	    <%
        	    List all = Article.getByCid(__aid);
        		String indexStr = request.getParameter("index");
        		List articles = PaginationUtils.getPaginationList(all, indexStr);
				if (articles != null && !articles.isEmpty()) {
					
					for (int i = 0; i < articles.size(); ++i) {
						Article article = (Article)articles.get(i);
						
						String state = article.getStateName();
						if ("隐藏".equals(state)) {
							continue;
						}
						String title = article.getTitle();
						String type = article.getTypeName();
						String did = article.getId();
						String datetime = article.getCreateTime();
						if (datetime != null) {
							datetime = datetime.substring(0,10);
						}
						
						String typeShow = "";
						if ("article.state.recommand".equals(type)) {
							typeShow = "<img src=\"images/iecool_arrow_157.gif\" width=\"28\" height=\"11\" />";
						} else if ("article.state.top".equals(type)) {
							typeShow = "[置顶]";
						}
				%>
				 	<tr>
	        	        <td><div align="left"><img src="image/iecool_arrow_030.gif" width="11" height="11" />　<a href="detail.jsp?cid=<%=__cid%>&aid=<%=__aid%>&did=<%=did%>"><%=title%></a><%=typeShow%></div></td>
	        	        <td>[<%=datetime%>]</td>
	      	        </tr>
				<%
					}
					int last = 12 - articles.size();
					for (int i = 0; i < last; ++i) {
				%>
					 	<tr>
		        	        <td>&nbsp;</td>
		        	        <td>&nbsp;</td>
		      	        </tr>
				<%
					}
				}
				%>
      	      </tbody>
      	    </table>
      	      <div style="text-align: center"><%=PaginationUtils.getPagination("list.jsp?cid=" + __cid, indexStr, all) %></div>
        	</div>
        </div>
        <div class="nrdi"><img src="image/nr_xia.gif" /></div>
      </div><!--右铡-->
      <div class="clear"></div>
</div>
<%@ include file="include/foot.jsp" %>
</body>
</html>