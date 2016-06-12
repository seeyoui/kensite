<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<html>
<head>
	<title>Kensite开发平台</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<link href="${ctx_script }/spreadjs/jquery.wijmo.wijspread.3.20142.13.css" rel="stylesheet" type="text/css" />
	<script src="${ctx_script }/spreadjs/jquery.wijmo.wijspread.all.3.20142.13.js" type="text/javascript"></script>
</head>
<body>
	<div id="KSreport" style="position:absolute; top:0px; bottom:0px; left:0px; right:0px; border: 1px solid gray"></div>
</body>
<script type="text/javascript">
	$(document).ready( $(function () {
		$.wijmo.wijspread.Culture("zh-CN");
		// SpreadJS 初始化
		$("#KSreport").wijspread({
			sheetCount: 1, //初始化为1个标签页
			newTabVisible: false, //隐藏新建标签页按钮
			AllowDragFill: true, //单元格拖动填充
			tabEditable: true
		});
		if ($.browser.msie && parseInt($.browser.version, 10) < 9) {
			//run for ie7/8
			var spread = $("#KSreport").wijspread("spread");
			spread.bind("SpreadsheetObjectLoaded", function () {
				initSpread();
			});
		} else {
			initSpread();
		}
	})
	);
	
	var sheet,table;
    var tableRow = 2;
    var tableCol = 1;
	var colChar = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
	function initSpread() {

	var spread = $("#KSreport").wijspread("spread");
		sheet = spread.getActiveSheet();
		sheet.setName("KS Report");
		//sheet.setRowCount(30, $.wijmo.wijspread.SheetArea.viewport);
		//sheet.setColumnCount(20, $.wijmo.wijspread.SheetArea.viewport);
		var source = [ {
			Course : "Calculus",
			Term : 1,
			Credit : 5,
			Score : 80,
			Teacher : "Nancy.Feehafer"
		}, {
			Course : "P.E.",
			Term : 1,
			Credit : 3.5,
			Score : 85,
			Teacher : "Andrew.Cencini"
		}, {
			Course : "Political Economics",
			Term : 1,
			Credit : 3.5,
			Score : 95,
			Teacher : "Jan.Kotas"
		}, {
			Course : "Basic of Computer",
			Term : 1,
			Credit : 2,
			Score : 85,
			Teacher : "Steven.Thorpe"
		}, {
			Course : "Micro-Economics",
			Term : 1,
			Credit : 4,
			Score : 62,
			Teacher : "Jan.Kotas"
		}, {
			Course : "Linear Algebra",
			Term : 2,
			Credit : 5,
			Score : 73,
			Teacher : "Nancy.Feehafer"
		}, {
			Course : "Accounting",
			Term : 2,
			Credit : 3.5,
			Score : 86,
			Teacher : "Nancy.Feehafer"
		}, {
			Course : "Statistics",
			Term : 2,
			Credit : 5,
			Score : 85,
			Teacher : "Robert.Zare"
		}, {
			Course : "Marketing",
			Term : 2,
			Credit : 4,
			Score : 70,
			Teacher : "Laura.Giussani"
		} ];
		spread.isPaintSuspended(true);
		table = sheet.addTableByDataSource("Table1", tableRow, tableCol, source);
		table.showFooter(true);
		table.showHeader(true);
		table.highlightFirstColumn(true);
		table.highlightLastColumn(false);
		
		table.setColumnFormula(2, "=SUM(" + colChar[tableCol + 2]
				+ (tableRow + 2) + ":" + colChar[tableCol + 2]
				+ (tableRow + 1 + source.length) + ")");
		table.setColumnFormula(3, "=SUM(" + colChar[tableCol + 3]
				+ (tableRow + 2) + ":" + colChar[tableCol + 3]
				+ (tableRow + 1 + source.length) + ")");
		table.setColumnValue(0, "Total");
		sheet.setColumnWidth(0, 20);
		sheet.setColumnWidth(1, 130);
		sheet.setColumnWidth(2, 70);
		sheet.setColumnWidth(3, 70);
		sheet.setColumnWidth(4, 70);
		sheet.setColumnWidth(5, 100);
		spread.isPaintSuspended(false);
	}
</script>
</html>
