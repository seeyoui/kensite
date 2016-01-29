<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.seeyoui.kensite.common.util.*"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%
		String id = request.getParameter("id");
		String popupID = request.getParameter("popupID");
	%>
	<link type="text/css" rel="stylesheet" href="${ctx_web}/css/manage.min.css?v=201601041813"/>
	<script type="text/javascript" src="${ctx_web}/js/comm/jquery/jquery-core.min.js?v=201503161711"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/fai.min.js?v=201512071738"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/jquery/jquery-ui-core.min.js?v=201511231730"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/pinyin.min.js?v=201306041217"></script>
	<script type="text/javascript" src="${ctx_web}/js/comm/faiui.min.js?v=201601111801"></script>
	<script type="text/javascript" src="${ctx_web}/js/site.min.js?v=201601131153"></script>
	<script type="text/javascript" src="${ctx_web}/js/manage.min.js?v=201601121610"></script>
	<script type="text/javascript">
	try {
		Fai.top = parent.Fai.top;
	} catch (e) {
	}
	</script>
<script type="text/javascript">
var addMode = <%=StringUtils.isBlank(id)%>;
var popupID = <%=popupID%>;
$(function(){
	$('#name').select();
	Fai.addPopupWindowBtn(popupID, {id:'save', extClass:'saveButton', text:'保 存', click:save});
	Fai.addPopupWindowBtn(popupID, {id:'close', extClass:'cancelButton', text:'取 消', click:'close'});
	
	$('#tabs').tabs({ selected:0 });
	
	$('#style1').find('input')[0].click();
	$('#stylePanel').children('li').click(function(){
		$(this).find('input')[0].click();
	});
	initFullDate();
	$('#name').focus();
	
	//页面加载完后再执行，必须放在在页面加载尾，判断页面内容是否发生改变
	if( !addMode ){
		Site.loadPageChange({unBindId:[],popupID:popupID});
	}
})

function initFullDate(){
	// 样式1：2010年2月1日 星期一
	// 样式2：2010年2月1日 12:30
	// 样式3：2010年2月1日 星期一 12:30
	// 样式4：2010-02-01
	// 样式5：2010-02-01 12:30
	// 样式6：2/1/2010 Monday
	// 样式7：2/1/2010 12:30
	// 样式8：2/1/2010 Monday 12:30
	var d = new Date(),
		wk_cn = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
		wk_en = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
		yy = d.getFullYear(), mm = d.getMonth() + 1, dd = d.getDate(),
		day = d.getDay(), day_cn = wk_cn[day], day_en = wk_en[day],
		h = d.getHours() + '', m = d.getMinutes() + '';
	if( h.length == 1 ){ h = '0' + h; }
	if( m.length == 1 ){ m = '0' + m; }
	$('#style1').find('span').text( yy + '年' + mm + '月' + dd + '日' + ' ' + day_cn );
	$('#style2').find('span').text( yy + '年' + mm + '月' + dd + '日' + ' ' + h + ':' + m );
	$('#style3').find('span').text( yy + '年' + mm + '月' + dd + '日' + ' ' + day_cn + ' ' + h + ':' + m );
	$('#style4').find('span').text( yy + '-' + mm + '-' + dd );
	$('#style5').find('span').text( yy + '-' + mm + '-' + dd + ' ' + h + ':' + m );
	$('#style6').find('span').text( mm + '/' + dd + '/' + yy + ' ' + day_en );
	$('#style7').find('span').text( mm + '/' + dd + '/' + yy + ' ' + h + ':' + m );
	$('#style8').find('span').text( mm + '/' + dd + '/' + yy + ' ' + day_en + ' ' + h + ':' + m );
}

function save(){
	var name = $('#name').val(), params = new Array();
	var minlen = 0, maxlen = 50;
	if( name.length > maxlen ){
		Fai.ing( '模块标题文字长度不能超过' + maxlen + '。', true );
		$('#name').focus();
		return;
	}
	params.push( 'name=' + Fai.encodeUrl(name) );
	var style = $('#stylePanel').children('li').find('input:checked').val();
	params.push( '&prop0=' + style );
	$.ajax({
		type: 'post',
		<%if(StringUtils.isBlank(id)){out.print("url: '../ajax/module_h.jsp?cmd=add&global=true&style=66&colId=2&extId=0',");}else{out.print("url: '../ajax/module_h.jsp?cmd=setBack&id="+id+"&colId=2&extId=0',");}%>
		data: params.join(''),
		error: function(){
			Fai.enablePopupWindowBtn(popupID, 'save', true);
			Fai.ing( '系统错误。', false );
		},
		success: function(data){
			Fai.enablePopupWindowBtn(popupID, 'save', true);
			var res = $.parseJSON(data);
			reSetPageChange();
			if(Fai.successHandle(data, '', '系统错误', "", 3, 1)){
				if( addMode ){
					Site.addNewModule(res.id, res.div,null,null,{"returnModuledata":res.moduleData});
				}else{
					Site.refreshModule(res.id, res.div, name);
				}
			}
			Fai.closePopupWindow( popupID );
		}
	})
}

//页面值改变
function setPageChange(){
	Site.setPageChange(true,popupID);	
}
//保存时reset
function reSetPageChange(){
	Site.setPageChange(false,popupID);	
}
</script>
<style>
	.setline, .set-title, .set-ctrl, .set-title2 { height:24px; line-height:24px;}
	.set-title, .set-ctrl, .set-ctrl2, .set-title2 { float:left;}
	.style-panel { list-style:none; margin:5px 0px; padding:0px; border:1px solid #7F9DB9; width:375px;}
	.style-panel .style-line { height:22px; line-height:22px; margin:0px; padding:2px 0px; cursor:pointer;}
	.spcl { background-color:#F8FAFD;}
	.m-0 { margin:0px;}
	.clears { overflow:hidden; height:1px; margin-top:-1px; font-size:0px; clear:both;}
</style>
</head>
<body class="popupTabBody">
<div class="ui-tabs ui-widget ui-widget-content ui-corner-all" id="tabs">
	<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
		<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#basic">常规</a></li>
	</ul>
	<div class="ui-tabs-panel ui-widget-content ui-corner-bottom" id="basic">
		<div class="setline">
			<div class="set-title">模块标题：</div>
			<div class="set-ctrl"><input value="当前时间" id="name" maxlength="50" class="m-0" type="text"></div>
		</div>
		<div class="setline2">
			<div class="set-title2">模块样式：</div>
			<div class="set-ctrl2">
				<ul id="stylePanel" class="style-panel">
					<li id="style1" class="style-line spcl"><input checked="checked" value="1" name="dateRadio" type="radio"><span class="style-title">2016年1月14日 星期四</span></li>
					<li id="style2" class="style-line"><input value="2" name="dateRadio" type="radio"><span class="style-title">2016年1月14日 14:41</span></li>
					<li id="style3" class="style-line spcl"><input value="3" name="dateRadio" type="radio"><span class="style-title">2016年1月14日 星期四 14:41</span></li>
					<li id="style4" class="style-line"><input value="4" name="dateRadio" type="radio"><span class="style-title">2016-1-14</span></li>
					<li id="style5" class="style-line spcl"><input value="5" name="dateRadio" type="radio"><span class="style-title">2016-1-14 14:41</span></li>
					<li id="style6" class="style-line"><input value="6" name="dateRadio" type="radio"><span class="style-title">1/14/2016 Thursday</span></li>
					<li id="style7" class="style-line spcl"><input value="7" name="dateRadio" type="radio"><span class="style-title">1/14/2016 14:41</span></li>
					<li id="style8" class="style-line"><input value="8" name="dateRadio" type="radio"><span class="style-title">1/14/2016 Thursday 14:41</span></li>
				</ul>
			</div>
			<div class="clears"></div>
		</div>
	</div>
</div>

</body>
</html>