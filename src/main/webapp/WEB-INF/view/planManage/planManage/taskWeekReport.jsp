<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp"%>
<html>
<head>
<title>Kensite开发平台</title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<%@ include file="/WEB-INF/view/taglib/easyui.jsp"%>
<script src="${ctx_script }/echarts/echarts.min.js"></script>
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
	var myChart,option;
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
		
		myChart = echarts.init(document.getElementById('main'));
		// 指定图表的配置项
		option = {
		    title : {
		        text: '某站点用户访问来源',
		        subtext: '纯属虚构',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
		    },
		    series : [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:335, name:'直接访问'},
		                {value:310, name:'邮件营销'},
		                {value:234, name:'联盟广告'},
		                {value:135, name:'视频广告'},
		                {value:1548, name:'搜索引擎'}
		            ],
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};

		myChart.setOption(option);
	}));
	
	function initSpread() {
		var spread = $("#KSreport").wijspread("spread");
		var sheet = spread.getActiveSheet();
		sheet.setName("任务总览");
		sheet.isPaintSuspended(true);
        loadData();
        sheet.isPaintSuspended(false);
	}
	function loadData() {
        var spread = $("#KSreport").wijspread("spread");
        var sheet = spread.getActiveSheet();
        var startRow = 1, startCol = 1;

        if (sheet.getRowCount($.wijmo.wijspread.SheetArea.viewport) - startRow < 19 ||
            sheet.getColumnCount($.wijmo.wijspread.SheetArea.viewport) - startCol < 10) {
            return;
        }
		
        var customFloatingObject = new $.wijmo.wijspread.CustomFloatingObject("f0");
        customFloatingObject.startRow(1);
        customFloatingObject.startColumn(1);
        customFloatingObject.endColumn(8);
        customFloatingObject.endRow(13);
        var div = document.createElement('div');
        div.innerHTML = "<div id='main' style='width: 435px; height: 240px;'></div>";
        $(div).css('background', '#F3F3F3');
        customFloatingObject.Content(div);
        sheet.addFloatingObject(customFloatingObject);
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
