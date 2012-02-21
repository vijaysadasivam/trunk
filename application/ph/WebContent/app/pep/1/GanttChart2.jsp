<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.saturn.ph.FormManager"%>	
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>New Page 1</title>
</head>
<script>
	function Task(from, to, task, resource, progress, level, project, type, mix) {
		var _from = new Date();	
		var _to = new Date();
		var _task = task;
		var _resource = resource;						
		var _progress = progress;
		var _level = level;
		var _project = project;
		var _type = type;
		var _fromStr = from;
		var _toStr = to;
		var _mix = mix;
		
		var dvArr = from.split('-');
		_from.setFullYear(parseInt(dvArr[0], 10), parseInt(dvArr[1], 10) - 1, parseInt(dvArr[2], 10));
		dvArr = to.split('-'); 
		_to.setFullYear(parseInt(dvArr[0], 10), parseInt(dvArr[1], 10) - 1, parseInt(dvArr[2], 10));		
		
		this.getFrom = function(){ return _from};
		this.getTo = function(){ return _to};
		this.getFromStr = function(){ return _fromStr};
		this.getToStr = function(){ return _toStr};
		this.getTask = function(){ return _task};
		this.getResource = function(){ return _resource};
		this.getProgress = function(){ return _progress};
		this.getLevel = function(){return _level};
		this.getProject = function(){ return _project};
		this.getMix = function(){ return _mix};
		this.getType = function(){return _type};
		this.getTypeLeft = function(){
			var left = 171;
			if ('VFF' == _type) {
				return left + '';
			} else if ('PVS' == _type) {
				return left + 65 + '';
			} else if ('0S' == _type) {
				return left + 130 + '';
			} else if ('SOP' == _type) {
				return left + 195 + '';
			} 
		};
	}
	
	function Gantt(gDiv) {
		var _GanttDiv = gDiv;
		var _taskList = new Array();	
			
		this.AddTaskDetail = function(value) {
			_taskList.push(value);
		}
		
		this.Draw = function(start, width) {
			var _offSet = 0;
			var _dateDiff = 0;
			var _currentDate = new Date();
			var _maxDate = new Date();
			var _minDate = new Date();	
			var _maxLevel = 0;
			var _dTemp = new Date();
			var _firstRowStr = "<table border=1 style='border-collapse:collapse;border:#000000 2px solid'><tr style='background-color:feffbe;text-align:center;'><td rowspan='3' width='50px' style='width:50px;font-size:9px'>Porjekt</td><td rowspan='3' width='80px' style='width:80px;font-size:9px'>DERIVAT</td><td rowspan='3' width='30px' style='width:30px;font-size:9px'>Stufe</td><td rowspan='3' width='60px' style='width:60px;font-size:9px'>VFF</td><td rowspan='3' width='60px' style='width:60px;font-size:9px'>PVS</td><td rowspan='3' width='60px' style='width:60px;font-size:9px'>OS</td><td rowspan='3' width='60px' style='width:60px;font-size:9px'>SOP</td><td rowspan='3' width='60px' style='width:60px;font-size:9px'>MIX</td>";
			var _secondRow = "";
			var _thirdRow = ""; 
			var _gStr = "";		
			var _colSpan = 0;
			var counter = 0;
			
			_currentDate.setFullYear(_currentDate.getFullYear(), _currentDate.getMonth(), _currentDate.getDate());
			if (_taskList.length > 0) {
				var task = _taskList[0];
				_maxDate.setFullYear(task.getTo().getFullYear(), task.getTo().getMonth(), task.getTo().getDate());
				_minDate.setFullYear(task.getFrom().getFullYear(), task.getFrom().getMonth(), task.getFrom().getDate());
				_maxLevel = task.getLevel();
				for (i = 0; i < _taskList.length; i++) {
					task = _taskList[i];
					if (Date.parse(task.getFrom()) < Date.parse(_minDate)) {
						_minDate.setFullYear(task.getFrom().getFullYear(), task.getFrom().getMonth(), task.getFrom().getDate());
					}
					
					if (Date.parse(task.getTo()) > Date.parse(_maxDate)) {
						_maxDate.setFullYear(task.getTo().getFullYear(), task.getTo().getMonth(), task.getTo().getDate());
					}		
					
					if (_maxLevel < task.getLevel()) {
						_maxLevel = task.getLevel();
					}				
				}
				
				//---- Fix _maxDate value for better displaying-----
				// Add at least 5 days
				
				if (_maxDate.getMonth() != 11) { //December 12&#26376;				
					_maxDate.setFullYear(_maxDate.getFullYear(), 11, 1); //The fifth day of next month will be used
				}
				
				if (_minDate.getMonth() == 11) {
					_minDate.setFullYear(_minDate.getFullYear(), _minDate.getMonth()-1, 1);
				}
				//--------------------------------------------------
				
				_gStr = "";
				_gStr += "<tr style='background-color:feffbe;text-align:center;'>";
				_secondRow = "<tr style='background-color:feffbe;text-align:center;'>";
				_thirdRow = "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>";
				_dTemp.setFullYear(_minDate.getFullYear(), _minDate.getMonth(), _minDate.getDate());
				
				while (Date.parse(_dTemp) <= Date.parse(_maxDate)) {	
					
					_gStr += "<td class='GDay'><div style='width:" + width + "px;'>" + (_dTemp.getMonth()+1) + "</div></td>";
					_secondRow += "<td class='GDay'><div style='width: + width + px;'>" + (start--) + "</div></td>";
					if (_dTemp.getFullYear() == _currentDate.getFullYear() && _dTemp.getMonth() == _currentDate.getMonth())	{					
						_thirdRow += "<td id='GC_" + (counter++) + "' class='GToDay' style='height:" + ((_maxLevel+1) * 26) + "'>&nbsp;</td>";
					} else {
						_thirdRow += "<td id='GC_" + (counter++) + "' class='GDay'style='height:" + ((_maxLevel+1) * 26) + "'>&nbsp;</td>";
					}
					
					_colSpan++;
				
					if (_dTemp.getMonth() == 11) { //December
						_firstRowStr += "<td class='GMonth' colspan='" + (_colSpan) + "'>" + _dTemp.getFullYear() + "</td>";
						_colSpan = 0;
						_dTemp.setFullYear(_dTemp.getFullYear() + 1, 0, 1);
					} else {
						_dTemp.setFullYear(_dTemp.getFullYear(), _dTemp.getMonth() + 1, 1);
					}
				}

				_thirdRow += "</tr>"; 	
				_firstRowStr += "</tr>";	
				_gStr += "</tr>";
				_secondRow += "</tr>"
				_gStr = _firstRowStr + _gStr + _secondRow + _thirdRow + "</table>";
					
				var offWidth = width + 3;
				
				for(i = 0; i < _taskList.length; i++)
				{	
					var task = _taskList[i];
					var _level = task.getLevel();
					
					_offSet = (task.getFrom().getFullYear() - _minDate.getFullYear()) * 12 + (task.getFrom().getMonth() - _minDate.getMonth());
					_dateDiff = (task.getTo().getFullYear() - task.getFrom().getFullYear()) * 12 + (task.getTo().getMonth() - task.getFrom().getMonth()) + 1;
					
					if (task.getType() == 'SOP') {
						_gStr += "<div style='position:absolute; top:" + (26 * (_level + 2) - 4) + "; left:" + (_offSet * offWidth + 485) + "; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' class='GTaska' style='float:left; width:" + (offWidth * _dateDiff - 1) + "px;'>" + task.getResource() + "</div></div>";
					
					} else {
						_gStr += "<div style='position:absolute; top:" + (26 * (_level + 2)) + "; left:" + (_offSet * offWidth + 485) + "; width:" + (offWidth * _dateDiff - 1 + 100) + "'><div title='" + task.getTask() + "' class='GTask' style='float:left; width:" + (offWidth * _dateDiff - 1) + "px;'>" + task.getResource() + "</div></div>";
					}
					_gStr += "<div style='position:absolute; top:" + (26 * (_level + 2) + 1) + "; left:5px'>" + task.getProject() + "</div>";
					_gStr += "<div style='position:absolute; top:" + (26 * (_level + 2) + 1) + "; left:60px'>" + task.getTask() + "</div>";
					_gStr += "<div style='position:absolute; top:" + (26 * (_level + 2) + 1) + "; left:145px'>" + task.getLevel() + "</div>";
					_gStr += "<div style='position:absolute; top:" + (26 * (_level + 2) + 1) + "; left:431px'>" + task.getMix() + "%</div>";
					if (task.getType() == 'PVS' || task.getType() == '0S' || task.getType() == 'SOP' || task.getType() == 'VFF' ) {
						_gStr += "<div style='position:absolute; top:" + (26 * (_level + 2) + 1) + "; left:" + task.getTypeLeft() + "px'>" + task.getFromStr() + "</div>";
					}
				}
				_GanttDiv.innerHTML = _gStr;
			}
		}
	}		
	
	function getProgressDiv(progress)
	{
		return "<div class='GProgress' style='width:" + progress + "%; overflow:hidden'></div>"
	}
	// GET NUMBER OF DAYS IN MONTH
	function getDaysInMonth(month, year)  
	{
		
		var days;		
		switch(month)
		{
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				days = 31;
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				days = 30;
				break;
			case 2:
				if (((year% 4)==0) && ((year% 100)!=0) || ((year% 400)==0))				
					days = 29;				
				else								
					days = 28;				
				break;
		}
		return (days);
	}				
	/*----- END OF MY CODE FOR Gantt CHART GENERATOR -----*/
</script>
<style>
	/*----- SICON GANTT CHART STYLE CLASSES --------------------------
	 * DESCRIPTION	: Theses class is required for SIcon Gantt Chart
	 * NOTE			: Should change the color, the text style only
	 *----------------------------------------------------------------*/
	.Gantt
	{
		font-family:tahoma, arial, verdana;
		font-size:11px;
	}
	
	.GTaskTitle
	{
		font-family:tahoma, arial, verdana;
		font-size:11px;
		font-weight:bold;
	}
	
	.GMonth
	{
		padding-left:5px;
		font-family:tahoma, arial, verdana;
		font-size:11px;
		font-weight:bold;	
	}
	
	.GToday
	{
		background-color: #f785f4;	
	}
	
	.GWeekend
	{
		font-family:tahoma, arial, verdana;
		font-size:11px;
		background-color:#F5F5F5;
		text-align:center;
	}
	
	.GDay
	{
		font-family:tahoma, arial, verdana;
		font-size:11px;
		text-align:center;
	}
	
	.GTask
	{
		height:14px;
		background-color:#4ba1ff;
		border:#000000 1px solid
	}
	
	.GTaska
	{
		height:19px;
		background-color:yellow;
		background:url(../images/bg2.gif) no-repeat 0 0;
		font-size:9px;
		text-align:center;
		font-weight:bold;
		line-height:24px;
		color:#FFF;
	}
	
	.GProgress
	{
		background-color:black;
		height:2px;
		overflow: hidden;
		margin-top:5px;
	}
</style>
<%
	String uid = request.getParameter("uid");
	Map form = FormManager.getFormValue(uid,true);

	List<String> fv9ProjectDerivat =(List<String>)form.get("fv9ProjectDerivat");
	List<String> fv9ProjectStufe =	(List<String>)form.get("fv9ProjectStufe");
	List<String> fv9ProjectPVS =(List<String>)form.get("fv9ProjectPVS");
	List<String> fv9ProjectVFF =(List<String>)form.get("fv9ProjectVFF");
	List<String> fv9Project0S =(List<String>)form.get("fv9Project0S");
	List<String> fv9ProjectSOP =(List<String>)form.get("fv9ProjectSOP");
	List<String> fv9ProjectMix =(List<String>)form.get("fv9ProjectMix");
%>
<body>	
	<div style="position:relative;width:800px" class="Gantt" id="GanttChart2"></div>
</body>
<script>
	var g2 = new Gantt(document.all.GanttChart2);
	
	<%
	for(int i=0; i<fv9ProjectDerivat.size(); i++){
		String projectDerivat = fv9ProjectDerivat.get(i);
		
		if(fv9ProjectPVS.get(i) != null && !"".equals(fv9ProjectPVS.get(i))){%>
			g2.AddTaskDetail(new Task('<%=fv9ProjectPVS.get(i)%>', '<%=fv9ProjectPVS.get(i)%>', '<b><%=projectDerivat%></b>', 'PVS', 50, <%=i%>, 'VW007', 'PVS', '<%=fv9ProjectMix.get(i)%>'));
			<%	}
		
		if(fv9ProjectVFF.get(i) != null && !"".equals(fv9ProjectVFF.get(i))){%>
			g2.AddTaskDetail(new Task('<%=fv9ProjectVFF.get(i)%>', '<%=fv9ProjectVFF.get(i)%>', '<b><%=projectDerivat%></b>', 'VFF', 50, <%=i%>, 'VW007', 'VFF', '<%=fv9ProjectMix.get(i)%>'));
			<%	}
		
		if(fv9Project0S.get(i) != null && !"".equals(fv9Project0S.get(i))){%>
			g2.AddTaskDetail(new Task('<%=fv9Project0S.get(i)%>', '<%=fv9Project0S.get(i)%>', '<b><%=projectDerivat%></b>', '0S', 50, <%=i%>, 'VW007', '0S', '<%=fv9ProjectMix.get(i)%>'));
			<%	}
		
		if(fv9ProjectSOP.get(i) != null && !"".equals(fv9ProjectSOP.get(i))){%>
			g2.AddTaskDetail(new Task('<%=fv9ProjectSOP.get(i)%>', '<%=fv9ProjectSOP.get(i)%>', '<b><%=projectDerivat%></b>', 'SOP', 50, <%=i%>, 'VW007', 'SOP', '<%=fv9ProjectMix.get(i)%>'));
			<%	}
	}	
	%>
/* 	g2.AddTaskDetail(new Task('01/01/2011', '01/01/2011', '<b>2/4-TÃ¼ren</b>', 'VFF', 50, 1, 'VW007', 'VFF'));
	g2.AddTaskDetail(new Task('03/01/2011', '03/01/2011', '<b>2/4-TÃ¼ren</b>', 'PVS', 50, 1, 'VW007', 'PVS'));
	g2.AddTaskDetail(new Task('06/01/2011', '06/01/2011', '<b>2/4-TÃ¼ren</b>', 'OS', 50, 1, 'VW007', 'OS'));
	g2.AddTaskDetail(new Task('08/01/2011', '08/01/2011', '<b>2/4-TÃ¼ren</b>', 'SOP', 50, 1, 'VW007', 'SOP'));
	
	g2.AddTaskDetail(new Task('05/01/2011', '05/01/2011', '<b>RL/4 Motion</b>', 'PVS', 50, 2, 'VW007', 'PVS'));
	g2.AddTaskDetail(new Task('08/01/2011', '08/01/2011', '<b>RL/4 Motion</b>', 'OS', 50, 2, 'VW007', 'OS'));
	g2.AddTaskDetail(new Task('11/01/2011', '11/01/2011', '<b>RL/4 Motion</b>', 'SOP', 50, 2, 'VW007', 'SOP'));
	
	g2.AddTaskDetail(new Task('06/01/2011', '06/01/2011', '<b>APR</b>', 'PVS', 50, 3, 'VW007', 'PVS'));
	g2.AddTaskDetail(new Task('10/01/2011', '10/01/2011', '<b>APR</b>', 'OS', 50, 3, 'VW007', 'OS'));
	g2.AddTaskDetail(new Task('01/01/2012', '01/01/2012', '<b>APR</b>', 'SOP', 50, 3, 'VW007', 'SOP'));
	
	g2.AddTaskDetail(new Task('10/01/2011', '10/01/2011', '<b>GTI/GTD</b>', 'PVS', 50, 4, 'VW007', 'PVS'));
	g2.AddTaskDetail(new Task('02/01/2012', '02/01/2012', '<b>GTI/GTD1</b>', 'OS', 50, 4, 'VW007', 'OS'));
	g2.AddTaskDetail(new Task('04/01/2012', '04/01/2012', '<b>GTI/GTD</b>', 'SOP', 50, 4, 'VW007', 'SOP'));
	
	g2.AddTaskDetail(new Task('01/01/2012', '01/01/2012', '<b>NAR</b>', 'PVS', 50, 5, 'VW007', 'PVS'));
	g2.AddTaskDetail(new Task('04/01/2012', '04/01/2012', '<b>NAR</b>', 'OS', 50, 5, 'VW007', 'OS'));
	g2.AddTaskDetail(new Task('06/01/2012', '06/01/2012', '<b>NAR</b>', 'SOP', 50, 5, 'VW007', 'SOP')); */
	
	g2.Draw(44, 24);
</script>
</html>