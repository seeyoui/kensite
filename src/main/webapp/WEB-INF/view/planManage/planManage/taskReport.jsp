<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp"%>
<html>
<head>
<title>Kensite开发平台</title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<%@ include file="/WEB-INF/view/taglib/easyui.jsp"%>
<%@ include file="/WEB-INF/view/taglib/layer.jsp"%>
<%@ include file="/WEB-INF/view/taglib/ksReport.jsp"%>
<style type="text/css">
#searchItem {
	margin: 5px;
}
.date-input {
    border: 1px solid #ddd;
    height: 22px;
}
</style>
</head>
<body>
	<div id="searchBox" style="position: absolute;top: 0px;height: 35px;left: 0px;right: 0px;border: 1px solid gray;background-color: rgb(245,245,245)">
		<div id="searchItem">
			<span>项目</span><input id="project" class="easyui-textbox" name="project" data-options="value:'${project }'"/>
			<span>负责人</span><input id="userName" class="easyui-textbox" name="userName" data-options="value:'${name }'"/>
			<span>开始日期</span><input onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="startDate" id="startDate" class="date-input" value="${startDate }"/>
			<span>结束日期</span><input onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="endDate" id="endDate" class="date-input" value="${endDate }"/>
			<span>任务状态</span><input id="status" class="easyui-combobox" name="status" data-options="editable:false, panelHeight:'auto', valueField:'value',textField:'label',url:'${ctx }/sys/dict/list/all?category=plan_task_status',icons: [{iconCls:'icon-clear',handler: function(e){$(e.data.target).combobox('clear');}}],value:'${status }'"/>
			<span>任务优先级</span><input id="sequence" class="easyui-combobox" name="sequence" data-options="editable:false, panelHeight:'auto', valueField:'value',textField:'label',url:'${ctx }/sys/dict/list/all?category=plan_task_seq',icons: [{iconCls:'icon-clear',handler: function(e){$(e.data.target).combobox('clear');}}],value:'${sequence }'"/>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="selectData()">查询</a>
		</div>
	</div>
	<div id="KSreport"
		style="position: absolute;top: 35px;bottom: 0px;left: 0px;right: 0px;border: 1px solid gray"></div>
</body>
<script type="text/javascript">
	$(document).ready($(function () {
		// SpreadJS 初始化
		$("#KSreport").wijspread({
			sheetCount: 1, //初始化为1个标签页
			newTabVisible: false, //隐藏新建标签页按钮
			AllowDragFill: false, //单元格拖动填充
			tabEditable: false
		});
		if ($.browser.msie && parseInt($.browser.version, 10) < 9) {
			//run for ie7/8
			var spread = $("#KSreport").wijspread("spread");
			spread.bind("SpreadsheetObjectLoaded", function () {
				initSpread();
			});
		}else {
			initSpread();
		}
	}));
	
	function initSpread() {
		var spread = $("#KSreport").wijspread("spread");
		var sheet = spread.getActiveSheet();
		sheet.setName("任务总览");
		sheet.isPaintSuspended(true);
        loadData();
        sheet.isPaintSuspended(false);
	}
	var bodyRows = ${taskList.size()};
	function loadData() {
        var spread = $("#KSreport").wijspread("spread");
        var sheet = spread.getActiveSheet();
        var startRow = 1, startCol = 1;

        if (sheet.getRowCount($.wijmo.wijspread.SheetArea.viewport) - startRow < 19 ||
            sheet.getColumnCount($.wijmo.wijspread.SheetArea.viewport) - startCol < 10) {
            return;
        }
		
        sheet.addSpan(startRow, startCol, 1, 12);//合并单元格
        sheet.setRowHeight(startRow, 30);//设置行高
        sheet.setColumnWidth(0, 21);//设置列宽
        for(var i=0; i<12; i++) {
        	sheet.setColumnWidth(startCol+i, 90);//设置列宽
        }
        var titleCells = sheet.getCells(startRow, startCol, startRow+1, startCol+11);
        /*
        <option value="SimSun">宋体</option>
		<option value="SimHei">黑体</option>
		<option value="Microsoft YaHei" selected="selected">微软雅黑</option>
		<option value="KaiTi">楷体</option>
		<option value="YouYuan">幼圆</option>
		<option value="FangSong">仿宋</option>
        */
        sheet.getCell(startRow, startCol).font("bold 20px SimHei");//设置字体--italic bold 30px arial
        titleCells.backColor("#bfe2f5");//设置背景色
        /*
        $.wijmo.wijspread.VerticalAlign.top;
        $.wijmo.wijspread.VerticalAlign.center;
        $.wijmo.wijspread.VerticalAlign.bottom;
        
        $.wijmo.wijspread.HorizontalAlign.left;
        $.wijmo.wijspread.HorizontalAlign.center;
        $.wijmo.wijspread.HorizontalAlign.right;
        */
        titleCells.vAlign($.wijmo.wijspread.VerticalAlign.center);
        titleCells.hAlign($.wijmo.wijspread.HorizontalAlign.center);
        //设置边框
        sheet.setBorder(new $.wijmo.wijspread.Range(startRow, startCol, 2, 12), new $.wijmo.wijspread.LineBorder("Black", $.wijmo.wijspread.LineStyle.thin), { all: true });
		//一级和二级标题
        sheet.setValue(startRow, startCol, "任务总览");//设置内容
        sheet.setValue(startRow+1, startCol, "项目");//设置内容
        sheet.setValue(startRow+1, startCol+1, "负责人");//设置内容
        sheet.setValue(startRow+1, startCol+2, "任务描述");//设置内容
        sheet.addSpan(startRow+1, startCol+2, 1, 3);
        sheet.setValue(startRow+1, startCol+5, "计划开始日期");//设置内容
        sheet.setValue(startRow+1, startCol+6, "计划完成日期");//设置内容
        sheet.setValue(startRow+1, startCol+7, "完成日期");//设置内容
        sheet.setValue(startRow+1, startCol+8, "状态");//设置内容
        sheet.setValue(startRow+1, startCol+9, "天数");//设置内容
        sheet.setValue(startRow+1, startCol+10, "延期次数");//设置内容
        sheet.setValue(startRow+1, startCol+11, "延期完成日期");//设置内容
        
        startRow = startRow + 2;
        //内容部分
        var bodyCells = sheet.getCells(startRow, startCol, startRow+bodyRows-1, startCol+11);
        sheet.getCells(startRow, startCol, startRow+bodyRows-1, startCol+1).backColor("#bfe2f5");//设置背景色
        bodyCells.vAlign($.wijmo.wijspread.VerticalAlign.center);
        bodyCells.hAlign($.wijmo.wijspread.HorizontalAlign.center);
        var describeCells = sheet.getCells(startRow, startCol+2, startRow+bodyRows-1, startCol+2);
		describeCells.hAlign($.wijmo.wijspread.HorizontalAlign.left);
        sheet.setBorder(new $.wijmo.wijspread.Range(startRow, startCol, bodyRows, 12), new $.wijmo.wijspread.LineBorder("Black", $.wijmo.wijspread.LineStyle.thin), { all: true });
		for(var i=0; i<bodyRows; i++) {
			sheet.addSpan(startRow+i, startCol+2, 1, 3);
		}
		fillData(sheet, startRow, startCol);
		spanSameVCells(sheet, startRow, 1);
		spanSameVCells(sheet, startRow, 2);
	}
	
	function fillData(sheet, startRow, startCol) {
		<c:forEach var="task" items="${taskList}" varStatus="status">
		sheet.setValue(startRow+${status.index}, startCol + 0, '${task.PROJECT}');
		sheet.setValue(startRow+${status.index}, startCol + 1, '${task.NAME}');
		sheet.setValue(startRow+${status.index}, startCol + 2, '${task.DESCRIBE}');
		sheet.setValue(startRow+${status.index}, startCol + 5, '${fn:substringBefore(task.START_DATE, " ")}');
		sheet.setValue(startRow+${status.index}, startCol + 6, '${fn:substringBefore(task.END_DATE, " ")}');
		sheet.setValue(startRow+${status.index}, startCol + 7, '${fn:substringBefore(task.FINISH_DATE, " ")}');
		<c:if test="${task.STATUS eq 'normal'}">
		sheet.setValue(startRow+${status.index}, startCol + 8, '正常进行');
		sheet.getCells(startRow+${status.index}, startCol + 2, startRow+${status.index}, startCol+11).backColor("#23C6C8");//设置背景色
		</c:if>
		<c:if test="${task.STATUS eq 'delay'}">
		sheet.setValue(startRow+${status.index}, startCol + 8, '延期进行');
		sheet.getCells(startRow+${status.index}, startCol + 2, startRow+${status.index}, startCol+11).backColor("#ED5565");//设置背景色
		</c:if>
		<c:if test="${task.STATUS eq 'finish'}">
		sheet.setValue(startRow+${status.index}, startCol + 8, '正常完成');
		sheet.getCells(startRow+${status.index}, startCol + 2, startRow+${status.index}, startCol+11).backColor("#1AB394");//设置背景色
		</c:if>
		<c:if test="${task.STATUS eq 'delay_finish'}">
		sheet.setValue(startRow+${status.index}, startCol + 8, '延期完成');
		sheet.getCells(startRow+${status.index}, startCol + 2, startRow+${status.index}, startCol+11).backColor("#F8AC59");//设置背景色
		</c:if>
		<c:if test="${task.STATUS eq 'normal'}">
		sheet.setValue(startRow+${status.index}, startCol + 9, '剩余${task.DAYS}天');
		</c:if>
		<c:if test="${task.STATUS ne 'normal'}">
		sheet.setValue(startRow+${status.index}, startCol + 9, '延期${task.DAYS}天');
		</c:if>
		var h = new $.wijmo.wijspread.HyperLinkCellType();
		h.text('${task.DELAY_COUNT}');
		h.linkToolTip('查看延期原因');
		sheet.setCellType(startRow+${status.index}, startCol + 10, h, $.wijmo.wijspread.SheetArea.viewport);
		sheet.getCell(startRow+${status.index}, startCol + 10, $.wijmo.wijspread.SheetArea.viewport).value("${ctx}/planManage/planTaskDelay/list?taskId=${task.ID}").hAlign($.wijmo.wijspread.HorizontalAlign.center);
		sheet.setValue(startRow+${status.index}, startCol + 11, '${fn:substringBefore(task.DELAY_DATE, " ")}');
		</c:forEach>
	}
	
	function spanSameVCells(sheet, startRow, startCol) {
		var cellContent = '';
		var rowStart = 0;
		var rowCount = 1;
		for(var i=0; i<=bodyRows; i++) {
			if(cellContent != sheet.getValue(startRow+i, startCol)) {
				if(cellContent != '') {
					sheet.addSpan(rowStart, startCol, rowCount, 1);
				}
				cellContent = sheet.getValue(startRow+i, startCol);
				rowStart = startRow+i;
				rowCount = 1;
			} else if(cellContent == sheet.getValue(startRow+i, startCol)) {
				rowCount++;
			}
		}
	}
	
	function selectData() {
		loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
		var url = '${ctx}/planManage/taskReport?1=1';
		var project = $('#project').textbox('getValue');
		if(project != null && project != '') {
			url += '&project='+project;
		}
		var userName = $('#userName').textbox('getValue');
		if(userName != null && userName != '') {
			url += '&name='+userName;
		}
		var startDate = $('#startDate').val();
		if(startDate != null && startDate != '') {
			url += '&startDate='+startDate;
		}
		var endDate = $('#endDate').val();
		if(endDate != null && endDate != '') {
			url += '&endDate='+endDate;
		}
		var status = $('#status').combobox('getValue');
		if(status != null && status != '') {
			url += '&status='+status;
		}
		var sequence = $('#sequence').combobox('getValue');
		if(sequence != null && sequence != '') {
			url += '&sequence='+sequence;
		}
		window.location.href=url;
	}
</script>
</html>
