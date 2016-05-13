<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Kensite开发平台</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/exceldesign.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/jqueryui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/colorPicker.jsp" %>
	<style type="text/css">
	.splitTHead {
	    border-right: 1px solid #c1d3dc;
	    padding: 5px;
	}
	#borderColor .l-btn-icon {
		left: 50%;
	    margin: 0 0 0 -8px;
	    top: 1px;
	}
	#bgcolor .l-btn-icon {
		left: 50%;
	    margin: 0 0 0 -8px;
	    top: 1px;
	}
	</style>
</head>
<body>
	<div id="reportSet" style="position:absolute; top:0px; height:72px; left:0px; right:0px; background-color: rgb(245,245,245)">
		<table cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td class="splitTHead" colspan="2">
					<select id="fontfamily" name="fontfamily" class="easyui-combobox" data-options="panelHeight:140,editable:false" style="width:100px;height:26px;" title="字体">
						<option value="SimSun">宋体</option>
						<option value="SimHei">黑体</option>
						<option value="Microsoft YaHei" selected="selected">微软雅黑</option>
						<option value="KaiTi">楷体</option>
						<option value="YouYuan">幼圆</option>
						<option value="FangSong">仿宋</option>
					</select>
					<select id="fontsize" name="fontsize" class="easyui-combobox" data-options="panelHeight:140,editable:false" style="width:50px;height:26px;">
						<option value="6pt">6</option>
						<option value="8pt">8</option>
						<option value="9pt" selected="selected">9</option>
						<option value="10pt">10</option>
						<option value="11pt">11</option>
						<option value="12pt">12</option>
						<option value="14pt">14</option>
						<option value="16pt">16</option>
						<option value="20pt">20</option>
						<option value="22pt">22</option>
						<option value="24pt">24</option>
						<option value="26pt">26</option>
						<option value="28pt">28</option>
						<option value="32pt">32</option>
						<option value="48pt">48</option>
						<option value="72pt">72</option>
					</select>
				</td>
				<td class="splitTHead">
					<a id="topAlign" href="javascript:topAlign()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-topAlign',iconAlign:'top'"></a>
					<a id="middelAlign" href="javascript:middelAlign()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-middelAlign',iconAlign:'top'"></a>
					<a id="bottomAlign" href="javascript:bottomAlign()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-bottomAlign',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
					<a id="rightretract" href="javascript:rightretract()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-rightretract',iconAlign:'top'"></a>
					<a id="leftretract" href="javascript:leftretract()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-leftretract',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
					<a id="autowarp" href="javascript:autowarp()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-autowarp',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead" colspan="2">
					<input class="easyui-combobox" style="width:122px;height:26px" data-options="
						panelHeight:'auto',
						editable:false,
						showItemIcon: true,
						data: [
							{value:'bottom',text:'下框线',iconCls:'icon-menuBtn-BorderBottom'},
							{value:'top',text:'上框线',iconCls:'icon-menuBtn-BorderTop'},
							{value:'left',text:'左框线',iconCls:'icon-menuBtn-BorderLeft'},
							{value:'right',text:'右框线',iconCls:'icon-menuBtn-BorderRight'},
							{value:'none',text:'无框线',iconCls:'icon-menuBtn-BorderRemove',selected:true},
							{value:'all',text:'所有框线',iconCls:'icon-menuBtn-BorderAll'},
							{value:'outer',text:'外侧框线',iconCls:'icon-menuBtn-BorderOutline'},
							{value:'inner',text:'内侧框线',iconCls:'icon-menuBtn-BorderInside'},
							{value:'horizontal',text:'水平内框线',iconCls:'icon-menuBtn-BorderHorizontal'},
							{value:'vertical',text:'垂直内框线',iconCls:'icon-menuBtn-BorderVertical'}
						]
					"/>
				</td>
				<td class="splitTHead">
					<a id="rowInsert" href="javascript:rowInsert()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-rowInsert',iconAlign:'top'"></a>
					<a id="colInsert" href="javascript:colInsert()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-colInsert',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
					<a id="cleanContent" href="javascript:cleanContent()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-cleanContent',iconAlign:'top'"></a>
					<a id="cleanStyle" href="javascript:cleanStyle()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-cleanStyle',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
					<a id="showgridline" href="javascript:showgridline()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-showgridline',iconAlign:'top'"></a>
				</td>
			</tr>
			<tr>
				<td class="splitTHead">
					<a id="blod" href="javascript:blod()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-blod',iconAlign:'top'"></a>
					<a id="italic" href="javascript:italic()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-italic',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
					<a id="bgcolor" href="javascript:bgcolor()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-BackgroundColor',iconAlign:'top'"></a>
					<div id="bgcolorSelector" style="background-color: #000000; height: 5px; position: absolute; width: 20px; top: 60px; left: 75px;"></div>
					<a id="fontcolor" href="javascript:fontcolor()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-fontcolor',iconAlign:'top'"></a>
					<div id="fontcolorSelector" style="background-color: #000000; height: 5px; position: absolute; width: 20px; top: 60px; left: 105px;"></div>
					<a id="formatRush" href="javascript:formatRush()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-formatRush',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
					<a id="leftAlign" href="javascript:leftAlign()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-leftAlign',iconAlign:'top'"></a>
					<a id="centerAlign" href="javascript:centerAlign()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-centerAlign',iconAlign:'top'"></a>
					<a id="rightAlign" href="javascript:rightAlign()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-rightAlign',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
					<a id="mergeCell" href="javascript:mergeCell()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-MergenBx',iconAlign:'top'"></a>
					<a id="unMergeCell" href="javascript:unMergeCell()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-splitBx',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
				</td>
				<td class="splitTHead">
					<input class="easyui-combobox" style="width:60px;height:26px" data-options="
						panelHeight:'auto',
						editable:false,
						showItemIcon: true,
						data: [
							{value:'thin',text:'',iconCls:'icon-menuBtn-thin',selected:true},
							{value:'medium',text:'',iconCls:'icon-menuBtn-medium'},
							{value:'dashed',text:'',iconCls:'icon-menuBtn-dashed'},
							{value:'thick',text:'',iconCls:'icon-menuBtn-thick'},
							{value:'double',text:'',iconCls:'icon-menuBtn-double'},
							{value:'hair',text:'',iconCls:'icon-menuBtn-hair'},
							{value:'mediumdashed',text:'',iconCls:'icon-menuBtn-mediumdashed'}
						]
					"/>
				</td>
				<td class="splitTHead">
					<a id="borderColor" href="javascript:borderColor()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-BorderColor',iconAlign:'top'"></a>
					<div id="borderColorSelector" style="background-color: #000000; height: 5px; position: absolute; width: 20px; top: 60px; left: 445px;"></div>
					<a id="borderSet" href="javascript:borderSet()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-edit',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
					<a id="rowDelete" href="javascript:rowDelete()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-rowDelete',iconAlign:'top'"></a>
					<a id="colDelete" href="javascript:colDelete()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-colDelete',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
					<a id="cleanAll" href="javascript:cleanAll()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-cleanAll',iconAlign:'top'"></a>
					<a id="setting" href="javascript:setting()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-settingBx',iconAlign:'top'"></a>
				</td>
				<td class="splitTHead">
					<a id="showtitle" href="javascript:showtitle()" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-showtitle',iconAlign:'top'"></a>
				</td>
			</tr>
		</tbody>
		</table>
	</div>
	<div id="KSreport" style="position:absolute; top:72px; bottom:0px; left:0px; right:0px; border: 1px solid gray"></div>
</body>
<script type="text/javascript">
	$(document).ready( $(function () {
		// SpreadJS 初始化
		$("#KSreport").wijspread({
			sheetCount: 1, //初始化为1个标签页
			newTabVisible: false, //隐藏新建标签页按钮
			AllowDragFill: true //单元格拖动填充
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
	
	function initSpread() {
		var spread = $("#KSreport").wijspread("spread");
		var sheet = spread.getActiveSheet();
		sheet.setName("KS Report");
	}
	
	function getSheetData() {
		console.info($("#KSreport").data('spread').toJSON( { includeBindingSource: true } ));
	}
</script>
</html>
