<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<style type="text/css">
* {
	margin:0;
	padding:0;
	list-style:none;
	color:#999;
}
</style>
</head>
<body>
<center>
<form id="" name="" action="" method="post">
	<div style="font-size:50px;margin-top:200px;height: 250px;
	width: 800px;margin-right: auto;
	margin-left: auto;">
		兽药真假查询<br><br>
		批准文号：<input name="textfield" type="text" value="" style="font-size:30px;line-height: 38px;width:250px;height:34px;cursor: pointer;"/>
		&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="查询" onclick="javascript:location.href='<%=request.getContextPath() %>/app/animal/drug/show.jsp'" style="border-width:0px;font-size:26px;line-height: 48px;width:120px;height:40px"/>
	</div>
</form>
</center>
</body>
</html>