<%@ page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page import="com.seeyoui.kensite.common.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Mapper</title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<%@ include file="/WEB-INF/view/taglib/easyui.jsp"%>
<%@ include file="/WEB-INF/view/taglib/layer.jsp"%>
</head>
<body>
	<input id="userName1" class="easyui-textbox" style="width: 100px" data-options="
	iconWidth: 22,icons: [{iconCls:'icon-search',handler: function(e){
	var sqlStr = 'select+user_name%2Cname%2Cstate%2Cto_char%28sysdate%2B1%2C+%27yyyy-mm-dd%27%29+publishDate+from+sys_user';
   	var mapperStr = '%7B%22total%22%3A2%2C%22rows%22%3A%5B%7B%22field%22%3A%22user_name%22%2C%22title%22%3A%22%E5%B8%90%E5%8F%B7%22%2C%22width%22%3A%22100%22%2C%22fieldTo%22%3A%22userName%22%7D%2C%7B%22field%22%3A%22name%22%2C%22title%22%3A%22%E5%A7%93%E5%90%8D%22%2C%22width%22%3A%22150%22%2C%22fieldTo%22%3A%22name%22%7D%2C%7B%22field%22%3A%22state%22%2C%22title%22%3A%22%E7%8A%B6%E6%80%81%22%2C%22width%22%3A%2250%22%2C%22fieldTo%22%3A%22stateTree%22%7D%2C%7B%22field%22%3A%22publishDate%22%2C%22title%22%3A%22%E6%97%A5%E6%9C%9F%22%2C%22width%22%3A%2250%22%2C%22fieldTo%22%3A%22publishDate%22%7D%5D%7D';
   	var url = '/kensite/static/form/mod/sqlMapper.jsp?sqlStr='+sqlStr+'&mapperStr='+mapperStr;layerOpen(url);}}]" />
	<ks:formTag table="BO_DEMO" column="USER_NAME"/>
	<input id="name" class="easyui-textbox" style="width: 100px"/>
	<input id="state" class="easyui-combobox" data-options="
		valueField: 'value',
		textField: 'label',
		data: [{
			label: '正常',
			value: '1'
		},{
			label: '冻结',
			value: '0'
		}]" />
	<input id="stateNum" class="easyui-numberbox" data-options="min:0,precision:2" />
	<input id="stateTree" class="easyui-combotree" data-options="
		idField: 'id',
		textField: 'text',
		data: [{
			id: 1,
			text: 'Item1',
			state: 'closed',
			children: [{
				id: 3,
				text: 'Item3'
			},{
				id: 4,
				text: 'Item4'
			}]
		},{
			id: 0,
			text: 'Item0'
		}]
	" />
	<input onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'',minDate:''})" data-options="tipPosition:'bottom'," name="publishDate" id="publishDate" class="date-input easyui-validatebox validatebox-text"/>
	<script type="text/javascript">
    var iframeWin = null, iframeBody=null;
	function layerOpen(url) {
    	layer.open({
    	    type: 2,
    	    title: '请选择',
    	    area: ['600px', '370px'],
    	    fix: false, //不固定
    	    maxmin: false,
    	    content: url,
    	    btn: ['保存', '取消'],
            success: function(layero, index){
                iframeBody = layer.getChildFrame('body', index);
                iframeWin = window[layero.find('iframe')[0]['name']];
            },
    	    yes: function(index, layero) {
    	    	if(iframeWin != null) {
    	    		iframeWin.submitInfo();
    	    	}
    	    },
    	    cancel: function(index){
    	    	layer.close(index);
    	    }
    	});
    }
	</script>
</body>
</html>