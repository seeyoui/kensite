<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>KS Report</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/easyui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/uedit.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/codemirror.jsp" %>
	<link rel="stylesheet" href="${ctx_script}/codemirror/theme/eclipse.css" type="text/css"/>
	<link href="${ctx_static }/exceldesign/icon-exceldesign.css" rel="stylesheet" type="text/css" />
	<%@ include file="/WEB-INF/view/taglib/jqueryui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/colorPicker.jsp" %>
	<style type="text/css">
	.fitem label {
	    display: inline-block;
	    width: 50px;
	}
	#dataForm {
		margin-top: 10px;
		margin-bottom: 10px;
		margin-left: 20px;
		margin-right: 20px;
	}
	.splitTHead {
	    border-right: 1px solid #c1d3dc;
	    padding: 5px;
	}
	</style>
  </head>
  <body>
 	<div style="position:absolute;top:0px;left:0px;right:0px;bottom:0px;">
        <form id="dataForm" method="post">
		    <div class="fitem">
                <label>报表名称</label>
                <input class="easyui-textbox" id="name" name="name" data-options="tipPosition:'bottom',required:true" style="width: 433px;"/>
            </div>
		    <div class="fitem">
			    <table cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="splitTHead" style="padding-left: 0;">
				                <label style="width:30px;">ROW</label>
				                <input class="easyui-numberspinner" value="0" id="row" name="row" data-options="min:0,max:50,tipPosition:'bottom',required:true" style="width:35px;"/>
				                <label style="width:30px;">COL</label>
				                <input class="easyui-numberspinner" value="0" id="col" name="col" data-options="min:0,max:50,tipPosition:'bottom',required:true" style="width:35px;"/>
							</td>
							<td class="splitTHead">
								<select id="fontfamily" name="fontfamily" class="easyui-combobox" data-options="panelHeight:140,editable:false" style="width:92px;height:26px;" title="字体">
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
								<a id="blod" title="粗体" href="javascript:setMjiStyle(null, 'bold', '')" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-blod',iconAlign:'top',toggle:true,selected:false"></a>
								<a id="italic" title="斜体" href="javascript:setMjiStyle(null, 'italic', '')" class="easyui-linkbutton" data-options="iconCls:'icon-menuBtn-italic',iconAlign:'top',toggle:true,selected:false"></a>
							</td>
							<td class="splitTHead" style="">
								<label style="width:28px;">文字</label><div id="fontcolorSelector" style="float: right; background-color: #000000; height: 20px; width: 20px;"></div>
							</td>
							<td class="splitTHead">
								<label style="width:28px;">背景</label><div id="bgcolorSelector" style="float: right; background-color: #000000; height: 20px; width: 20px;"></div>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 
			    <table cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="splitTHead" style="padding-left: 0;">
								<label style="width:36px;">左边框</label>
								<input id="borderstyleleft" class="easyui-combobox" style="width:60px;height:26px" data-options="
									panelHeight:'auto',
									editable:false,
									showItemIcon: true,
									data: [
										{value:'1',text:'',iconCls:'icon-menuBtn-thin',selected:true},
										{value:'2',text:'',iconCls:'icon-menuBtn-medium'},
										{value:'3',text:'',iconCls:'icon-menuBtn-dashed'},
										{value:'5',text:'',iconCls:'icon-menuBtn-thick'},
										{value:'6',text:'',iconCls:'icon-menuBtn-double'},
										{value:'7',text:'',iconCls:'icon-menuBtn-hair'},
										{value:'8',text:'',iconCls:'icon-menuBtn-mediumdashed'}
									]
								"/>
								<div id="borderColorSelectorLeft" style="float: right; background-color: #000000; height: 20px; width: 20px;"></div>
							</td>
						</tr>
					</tbody>
				</table>
				 -->
		    </div>
		    <div class="fitem">
                <label>查询SQL</label>
                <input class="easyui-textbox" id="sql" name="sql" data-options="tipPosition:'bottom',multiline:true,required:true,buttonIcon:'icon-28013',buttonText:'验证'" style="height: 100px;width: 433px;"/>
            </div>
            <div class="fitem">
		    	<div style="height:250px;width: 485px;">
	                <table id="dg_param" class="easyui-datagrid" title="参数" style="width:100%;height:100%"
			            data-options="fitColumns: true,singleSelect: true,toolbar: '#tb_param',onClickCell: onClickCellParam">
				        <thead>
				            <tr>
				                <th data-options="field:'col',width:250">COL</th>
				                <th data-options="field:'name',width:250,editor:'textbox'">列名</th>
				                <th data-options="field:'width',width:250,editor:{type:'numberbox',options:{precision:0}}">宽度</th>
				                <th data-options="field:'isum',width:200,align:'center',
									editor:{
										type:'combobox',
										options:{
											editable:false,
											icons: [{iconCls:'icon-clear',handler: function(e){$(e.data.target).combobox('clear');}}],
											panelHeight:'auto',
											valueField:'value',
											textField:'text',
											method:'get',
											data: [{'text':'是','value':'T'},{'text':'否','value':'F'}]
										}
									}">是否汇总</th>
				            </tr>
				        </thead>
				    </table>
			    </div>
            </div>
		    <div class="fitem" style="border: 1px solid #c1d3dc; width: 485px;">
                <label>扩展JS</label>
<textarea id="code" name="code">
table.showHeader(true); //是否显示头部
table.showFooter(true); //是否显示底部
table.bandRows(true); //是否显示间隔样式
table.bandColumns(true); //是否显示间隔列样式
table.highlightFirstColumn(true); //是否高亮第一列
table.highlightLastColumn(true); //是否高亮最后一列
</textarea>
            </div>
            <input id="id" name="id" type="hidden"/>
		</form>
    </div>
    <div id="tb_param" style="height:auto">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-4131',plain:true" onclick="appendParam()"></a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-4333',plain:true" onclick="removeParam()"></a>
    </div>
    <script type="text/javascript">
	    var loadi,url,index = parent.layer.getFrameIndex(window.name);
	    $(document).ready(function(){
	    	/*
	        var row = parent.$('#dataListSub').datagrid('getSelected');
	        url = '${ctx}/oauth/interfaceDesc/save';
	        if(row != null) {
	            $('#dataForm').form('load', row);
	    		url = '${ctx}/oauth/interfaceDesc/update';
	            $('#dg_param').datagrid('loadData', JSON.parse(row.parameter));
	            $('#dg_return').datagrid('loadData', JSON.parse(row.returnValue));
	            $('#dg_excludes').datagrid('loadData', JSON.parse(row.excludes));
	        }
	        */
	        $('#sql').textbox({
	        	onClickButton: function() {
	        		appendInitReturn();
	        	}
	        });
	    	var editor = CodeMirror.fromTextArea(document.getElementById("code"), {  // 标识到textarea
	            //value : "",  // 文本域默认显示的文本
	            mode : "javascript",  // 模式--text/html
	            theme : "eclipse",  // CSS样式选择
	            indentUnit : 4,  // 缩进单位，默认2
	            smartIndent : true,  // 是否智能缩进
	            tabSize : 4,  // Tab缩进，默认4
	            readOnly : false,  // 是否只读，默认false
	            showCursorWhenSelecting : true,
	            lineNumbers : true,  // 是否显示行号
	            styleActiveLine: true,
	            matchBrackets: true,
	            extraKeys: {
	                "F11": function(cm) {
						cm.setOption("fullScreen", !cm.getOption("fullScreen"));
	                },
	                "Esc": function(cm) {
						if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);
	                }
	              }
	        });
	        

			$('#bgcolorSelector').ColorPicker({
	    		color: '#000000',
	    		onSubmit: function(hsb, hex, rgb, el) {
	    			$(el).ColorPickerHide();
	    		},
	    		onShow: function (colpkr) {
	    			$(colpkr).fadeIn(500);
	    			return false;
	    		},
	    		onHide: function (colpkr) {
	    			$(colpkr).fadeOut(500);
	    			return false;
	    		},
	    		onChange: function (hsb, hex, rgb) {
	    			$('#bgcolorSelector').css('backgroundColor', '#' + hex);
	    			$('#bgcolorValue').val('#' + hex);
	    		}
	    	});
	    	$('#fontcolorSelector').ColorPicker({
	    		color: '#000000',
	    		onSubmit: function(hsb, hex, rgb, el) {
	    			$(el).ColorPickerHide();
	    		},
	    		onShow: function (colpkr) {
	    			$(colpkr).fadeIn(500);
	    			return false;
	    		},
	    		onHide: function (colpkr) {
	    			$(colpkr).fadeOut(500);
	    			return false;
	    		},
	    		onChange: function (hsb, hex, rgb) {
	    			$('#fontcolorSelector').css('backgroundColor', '#' + hex);
	    			$('#fontcolorValue').val('#' + hex);
	    		}
	    	});
	    });
	
	    function submitInfo(){
	        $('#dataForm').form('submit',{
	            url: url,
	            onSubmit: function(param){
	            	if($(this).form('validate')) {
	            		loadi = parent.layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
	            	}
	                return $(this).form('validate');
	            },
	            success: function(data){
	            	parent.layer.close(loadi);
	                cleanErrMsg();
	                var data = eval('(' + data + ')');
	                if (data.success==TRUE){
	            		parent.$.interfaceDesc.reloadData();
	                	parent.layer.msg("操作成功！", {offset: 'rb',icon: 6,shift: 8,time: layerMsgTime});
	            		parent.layer.close(index);
	                } else {
	                    renderErrMsg(data.message);
	                }
	            }
	        });
	    }
	    var editIndex1 = undefined;
        function endEditingParam(){
            if (editIndex1 == undefined){return true}
            if ($('#dg_param').datagrid('validateRow', editIndex1)){
                $('#dg_param').datagrid('endEdit', editIndex1);
                editIndex1 = undefined;
                return true;
            } else {
                return false;
            }
        }
        function onClickCellParam(index, field){
            if (editIndex1 != index){
                if (endEditingParam()){
                    $('#dg_param').datagrid('selectRow', index)
                            .datagrid('beginEdit', index);
                    var ed = $('#dg_param').datagrid('getEditor', {index:index,field:field});
                    if (ed){
                        ($(ed.target).data('textbox') ? $(ed.target).textbox('textbox') : $(ed.target)).focus();
                    }
                    editIndex1 = index;
                } else {
                    $('#dg_param').datagrid('selectRow', editIndex);
                }
            }
        }
        function appendParam(obj){
            if (endEditingParam()){
                $('#dg_param').datagrid('appendRow', obj);
                editIndex1 = $('#dg_param').datagrid('getRows').length-1;
                $('#dg_param').datagrid('selectRow', editIndex1)
                        .datagrid('beginEdit', editIndex1);
            }
        }
        function removeParam(){
            if (editIndex1 == undefined){return}
            $('#dg_param').datagrid('cancelEdit', editIndex1)
                    .datagrid('deleteRow', editIndex1);
            editIndex1 = undefined;
        }
        
        function appendInitReturn(){
            for(var i=0; i<5; i++) {
            	appendParam({col: 'success', name: ''+i, width: 100, isum: 'T'});
            }
        }
    </script>
  </body>
</html>
