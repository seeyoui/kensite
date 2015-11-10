<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>数据建模</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<style type="text/css">
		body{ font-size:14px;}
		input{ vertical-align:middle; margin:0; padding:0}
		.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
		.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;}
	</style>
  </head>
<body>
	<div id="configTab" class="easyui-tabs" data-options="plain: true, narrow: false, pill: true, tabPosition: 'left', headerWidth: 120, tools:'#tab-tools'" style="width:100%;height:280px">
		<div id="textbox" title="单行" data-options="iconCls:'icon-uicomponent-text'" style="padding:10px">
			背景字<input id="prompt" type="text" class="txt"/>
		</div>
		<div id="numberbox" title="数值" data-options="iconCls:'icon-uicomponent-number'" style="padding:10px">
			上限<input id="max" type="text" class="txt"/><br/><br/>
			下限<input id="min" type="text" class="txt"/><br/><br/>
			精度<input id="precision" type="text" class="txt"/>
		</div>
		<div id="combobox" title="列表" data-options="iconCls:'icon-uicomponent-combox'" style="padding:10px">
			<div id="comboboxTab" class="easyui-tabs" data-options="plain: false, narrow: false, pill: true" style="width:100%;height:120px">
				<div id="string" title="常量" data-options="iconCls:'icon-uicomponent-text'" style="padding:10px">
					选项<input id="config" type="text" class="txt"/><br/><br/>
					<span>&gt;&gt;value1[:label1]|value2[:label2]&lt;&lt;</span>
				</div>
				<div id="sql" title="SQL" data-options="iconCls:'icon-uicomponent-text'" style="padding:10px">
					SQL语句<input id="sqlStr" type="text" class="txt"/><br/><br/>
					VALUE列<input id="valueStr" type="text" class="txt" style="width:60px;"/>
					LABEL列<input id="labelStr" type="text" class="txt" style="width:60px;"/>
				</div>
				<div id="dict" title="字典" data-options="iconCls:'icon-uicomponent-text'" style="padding:10px">
					系统字典<input id="dictStr" class="easyui-combotree" style="width:160px;" url="${ctx}/sys/dict/getTreeJson.do"/>
				</div>
			</div>
		</div>
		<div id="radiobox" title="单选" data-options="iconCls:'icon-uicomponent-radio'" style="padding:10px">
			<div id="radioboxTab" class="easyui-tabs" data-options="plain: false, narrow: false, pill: true" style="width:100%;height:120px">
				<div id="string" title="常量" data-options="iconCls:'icon-uicomponent-text'" style="padding:10px">
					选项<input id="config" type="text" class="txt"/><br/><br/>
					<span>&gt;&gt;value1[:label1]|value2[:label2]&lt;&lt;</span>
				</div>
				<div id="sql" title="SQL" data-options="iconCls:'icon-uicomponent-text'" style="padding:10px">
					SQL语句<input id="sqlStr" type="text" class="txt"/><br/><br/>
					VALUE列<input id="valueStr" type="text" class="txt" style="width:60px;"/>
					LABEL列<input id="labelStr" type="text" class="txt" style="width:60px;"/>
				</div>
				<div id="dict" title="字典" data-options="iconCls:'icon-uicomponent-text'" style="padding:10px">
					系统字典<input id="dictStr" class="easyui-combotree" style="width:160px;" url="${ctx}/sys/dict/getTreeJson.do"/>
				</div>
			</div>
		</div>
		<div id="checkbox" title="多选" data-options="iconCls:'icon-uicomponent-check'" style="padding:10px">
			<div id="checkboxTab" class="easyui-tabs" data-options="plain: false, narrow: false, pill: true" style="width:100%;height:120px">
				<div id="string" title="常量" data-options="iconCls:'icon-uicomponent-text'" style="padding:10px">
					选项<input id="config" type="text" class="txt"/><br/><br/>
					<span>&gt;&gt;value1[:label1]|value2[:label2]&lt;&lt;</span>
				</div>
				<div id="sql" title="SQL" data-options="iconCls:'icon-uicomponent-text'" style="padding:10px">
					SQL语句<input id="sqlStr" type="text" class="txt"/><br/><br/>
					VALUE列<input id="valueStr" type="text" class="txt" style="width:60px;"/>
					LABEL列<input id="labelStr" type="text" class="txt" style="width:60px;"/>
				</div>
				<div id="dict" title="字典" data-options="iconCls:'icon-uicomponent-text'" style="padding:10px">
					系统字典<input id="dictStr" class="easyui-combotree" style="width:160px;" url="${ctx}/sys/dict/getTreeJson.do"/>
				</div>
			</div>
		</div>
		<div id="datebox" title="日期" data-options="iconCls:'icon-uicomponent-date'" style="padding:10px">
			格式<input id="config" type="text" class="txt" value="yyyy-MM-dd HH:mm:ss"/>
		</div>
		<div id="textarea" title="多行" data-options="iconCls:'icon-uicomponent-textArea'" style="padding:10px">
			背景字<input id="prompt" type="text" class="txt"/>
		</div>
		<div id="htmldesign" title="HTML" data-options="iconCls:'icon-uicomponent-htmlEditor'" style="padding:10px">
			固定高度<input id="config" type="text" class="txt"/>
		</div>
	</div>
	<div id="tab-tools">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-4336'" onclick="save()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-5571'" onclick="run()">运行</a>
	</div>
	<div style="position:absolute;left:130px;right:0px;bottom:0px;height:150px;">
		<div class="easyui-panel" title="展示区" style="width:100%;height:140px;padding:10px;">
			<div id="showComponent"></div>
		</div>
	</div>
	<script type="text/javascript">
		var componentType = "textbox";
		var componentConfig = "";
		$(document).ready(function(){
			initData();
			$('#configTab').tabs({
				onSelect: function(title,index){
					if(title == "单行") {
						componentType = "textbox";
					}
					if(title == "数值") {
						componentType = "numberbox";
					}
					if(title == "列表") {
						componentType = "combobox";
					}
					if(title == "单选") {
						componentType = "radiobox";
					}
					if(title == "多选") {
						componentType = "checkbox";
					}
					if(title == "日期") {
						componentType = "datebox";
					}
					if(title == "多行") {
						componentType = "textarea";
					}
					if(title == "HTML") {
						componentType = "htmldesign";
					}
				}
			});
		});
		
		function initData() {
			componentType = parent.$('#category').combobox('getValue');
			var componentConfig = parent.$('#settings').textbox('getValue');
			if(componentType=="textbox") {
				$('#'+componentType+' #prompt').val(componentConfig.replace("prompt:'", "").replace("'",""));
				$('#configTab').tabs('select', 0);
			}
			if(componentType=="numberbox") {
				var numberArr = componentConfig.split(",");
				$('#'+componentType+' #max').val(numberArr[0].replace("max:", "").replace("'",""));
				$('#'+componentType+' #min').val(numberArr[1].replace("min:", "").replace("'",""));
				$('#'+componentType+' #precision').val(numberArr[2].replace("precision:", "").replace("'",""));
				$('#configTab').tabs('select', 1);
			}
			if(componentType=="textarea") {
				$('#'+componentType+' #prompt').val(componentConfig.replace("multiline:true,prompt:'", "").replace("'",""));
				$('#configTab').tabs('select', 6);
			}
			if(componentType=="datebox") {
				$('#'+componentType+' #config').val(componentConfig.replace("dateFmt:'", "").replace("'",""));
				$('#configTab').tabs('select', 5);
			}
			if(componentType=="htmldesign") {
				$('#'+componentType+' #config').val(componentConfig);
				$('#configTab').tabs('select', 7);
			}
			if(componentType=="combobox") {
				$('#configTab').tabs('select', 2);
				if(componentConfig.indexOf("SQL>") != -1) {
					var sqlArr = componentConfig.split("|");
					$('#'+componentType+' #sql #sqlStr').val(sqlArr[0].replace("SQL>", ""));
					$('#'+componentType+' #sql #valueStr').val(sqlArr[1]);
					$('#'+componentType+' #sql #labelStr').val(sqlArr[2]);
					$('#'+componentType+'Tab').tabs('select', 1);
				} else if(componentConfig.indexOf("DICT>") != -1) {
					$('#'+componentType+' #dict #dictStr').combotree('setValue', componentConfig.replace("DICT>", ""));
					$('#'+componentType+'Tab').tabs('select', 2);
				} else {
					$('#'+componentType+' #string #config').val(componentConfig);
					$('#'+componentType+'Tab').tabs('select', 0);
				}
			}
			if(componentType=="radiobox") {
				$('#configTab').tabs('select', 3);
				if(componentConfig.indexOf("SQL>") != -1) {
					var sqlArr = componentConfig.split("|");
					$('#'+componentType+' #sql #sqlStr').val(sqlArr[0].replace("SQL>", ""));
					$('#'+componentType+' #sql #valueStr').val(sqlArr[1]);
					$('#'+componentType+' #sql #labelStr').val(sqlArr[2]);
					$('#'+componentType+'Tab').tabs('select', 1);
				} else if(componentConfig.indexOf("DICT>") != -1) {
					$('#'+componentType+' #dict #dictStr').combotree('setValue', componentConfig.replace("DICT>", ""));
					$('#'+componentType+'Tab').tabs('select', 2);
				}  else {
					$('#'+componentType+' #string #config').val(componentConfig);
					$('#'+componentType+'Tab').tabs('select', 0);
				}
			}
			if(componentType=="checkbox") {
				$('#configTab').tabs('select', 4);
				if(componentConfig.indexOf("SQL>") != -1) {
					var sqlArr = componentConfig.split("|");
					$('#'+componentType+' #sql #sqlStr').val(sqlArr[0].replace("SQL>", ""));
					$('#'+componentType+' #sql #valueStr').val(sqlArr[1]);
					$('#'+componentType+' #sql #labelStr').val(sqlArr[2]);
					$('#'+componentType+'Tab').tabs('select', 1);
				} else if(componentConfig.indexOf("DICT>") != -1) {
					$('#'+componentType+' #dict #dictStr').combotree('setValue', componentConfig.replace("DICT>", ""));
					$('#'+componentType+'Tab').tabs('select', 2);
				}  else {
					$('#'+componentType+' #string #config').val(componentConfig);
					$('#'+componentType+'Tab').tabs('select', 0);
				}
			}
		}
		
		function save() {
			if(componentType=="textbox") {
				componentConfig = "prompt:'"+$('#'+componentType+' #prompt').val()+"'";
			}
			if(componentType=="textarea") {
				componentConfig = "multiline:true,prompt:'"+$('#'+componentType+' #prompt').val()+"'";
			}
			if(componentType=="datebox") {
				componentConfig = "dateFmt:'"+$('#'+componentType+' #config').val()+"'";
			}
			if(componentType=="numberbox") {
				var max = $('#'+componentType+' #max').val();
				if(max == null || max == "") {
					max = "99999999";
				}
				var min = $('#'+componentType+' #min').val();
				if(min == null || min == "") {
					min = "-99999999";
				}
				var precision = $('#'+componentType+' #precision').val();
				if(precision == null || precision == "") {
					precision = 0;
				}
				componentConfig = "max:"+parseInt(max)+",min:"+parseInt(min)+",precision:"+precision;
			}
			if(componentType=="htmldesign") {
				componentConfig = $('#'+componentType+' #config').val();
			}
			if(componentType=="combobox" || componentType=="radiobox" || componentType=="checkbox") {
				var tab = $('#'+componentType+'Tab').tabs('getSelected');
				var index = $('#'+componentType+'Tab').tabs('getTabIndex', tab);
				if(index == 0) {
					componentConfig = $('#'+componentType+' #string #config').val();
				}
				if(index == 1) {
					componentConfig = "SQL>"+$('#'+componentType+' #sql #sqlStr').val()+"|"+$('#'+componentType+' #sql #valueStr').val()+"|"+$('#'+componentType+' #sql #labelStr').val();
				}
				if(index == 2) {
					componentConfig = "DICT>"+$('#'+componentType+' #dict #dictStr').combotree('getValue');
				}
			}
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
			parent.$('#category').combobox('setValue', componentType);
			alert(componentConfig);
			parent.$('#settings').textbox('setValue', componentConfig);
			parent.layer.close(index);
		}
		
		function run() {
			var componentObj = "";
			if(componentType=="textbox" || componentType=="textarea") {
				if(componentType=="textbox") {
					componentObj = "<input id=\"show\" class=\"easyui-textbox\">";
					$('#showComponent').html(componentObj);
					$('#show').textbox({
						prompt:$('#'+componentType+' #prompt').val()
					});
				}
				if(componentType=="textarea") {
					componentObj = "<input id=\"show\" class=\"easyui-textbox\" style=\"width:230px;height:90px\">";
					$('#showComponent').html(componentObj);
					$('#show').textbox({
						multiline:true,
						prompt:$('#'+componentType+' #prompt').val()
					});
				}
			}
			if(componentType=="datebox") {
				componentObj = "<input id=\"show\" class=\"easyui-textbox\" onClick=\"WdatePicker({dateFmt:'"+$('#'+componentType+' #config').val()+"'})\"/>";
				$('#showComponent').html(componentObj);
				/* $('#show').textbox({
					prompt:'请选择'
				}); */
			}
			if(componentType=="numberbox") {
				componentObj = "<input id=\"show\" class=\"easyui-numberbox\"/>";
				$('#showComponent').html(componentObj);
				var max = $('#'+componentType+' #max').val();
				if(max == null || max == "") {
					max = "99999999";
				}
				var min = $('#'+componentType+' #min').val();
				if(min == null || min == "") {
					min = "-99999999";
				}
				var precision = $('#'+componentType+' #precision').val();
				if(precision == null || precision == "") {
					precision = 0;
				}
				$('#show').numberbox({
					max: parseInt(max),
					min: parseInt(min),
					precision: precision
				});
			}
			if(componentType=="htmldesign") {
				
			}
			if(componentType=="combobox" || componentType=="radiobox" || componentType=="checkbox") {
				var tab = $('#'+componentType+'Tab').tabs('getSelected');
				var index = $('#'+componentType+'Tab').tabs('getTabIndex', tab);
				if(index == 0) {
					var config = $('#'+componentType+' #string #config').val();
					if(componentType=="combobox") {
						var configs = config.split("|");
						componentObj = "<select id=\"show\" class=\"easyui-combobox\" name=\"dept\" style=\"width:200px;\">";
						for(var i=0; i<configs.length; i++) {
							var con = configs[i];
							if(con.indexOf(":") != -1) {
								var cons = con.split(":");
								componentObj += "<option value=\""+cons[0]+"\">"+cons[1]+"</option>";
							} else {
								componentObj += "<option value=\""+con+"\">"+con+"</option>";
							}
						}
						componentObj += "</select>";
						$('#showComponent').html(componentObj);
						$('#show').combobox({
							panelHeight : 80
						});
					}
					if(componentType=="radiobox") {
						var configs = config.split("|");
						componentObj = "";
						for(var i=0; i<configs.length; i++) {
							var con = configs[i];
							if(con.indexOf(":") != -1) {
								var cons = con.split(":");
								componentObj += "<input name=\"show\" type=\"radio\" value=\""+cons[0]+"\"/>"+cons[1];
							} else {
								componentObj += "<input name=\"show\" type=\"radio\" value=\""+con+"\"/>"+con;
							}
						}
						$('#showComponent').html(componentObj);
					}
					if(componentType=="checkbox") {
						var configs = config.split("|");
						componentObj = "";
						for(var i=0; i<configs.length; i++) {
							var con = configs[i];
							if(con.indexOf(":") != -1) {
								var cons = con.split(":");
								componentObj += "<input name=\"show\" type=\"checkbox\" value=\""+cons[0]+"\"/>"+cons[1];
							} else {
								componentObj += "<input name=\"show\" type=\"checkbox\" value=\""+con+"\"/>"+con;
							}
						}
						$('#showComponent').html(componentObj);
					}
				}
				if(index == 1) {
					var sql = $('#'+componentType+' #sql #sqlStr').val();
					var value = $('#'+componentType+' #sql #valueStr').val();
					var label = $('#'+componentType+' #sql #labelStr').val();
					getComponentBySql(componentType, sql, value, label);
				}
				if(index == 2) {
					var sql = $('#'+componentType+' #sql #sqlStr').val();
					var value = $('#'+componentType+' #sql #valueStr').val();
					var label = $('#'+componentType+' #sql #labelStr').val();
					getComponentBySql(componentType, sql, value, label);
				}
			}
		}
		
		function getComponentBySql(type, sql, value, label) {
			
		}
	</script>
</body>
</html>