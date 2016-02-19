<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.seeyoui.kensite.common.util.*"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<%
		String id = request.getParameter("id");
		String popupID = request.getParameter("popupID");
		String num = request.getParameter("num");
	%>
<link type="text/css" rel="stylesheet"
	href="${ctx_web}/css/manage.min.css?v=201601041813" />
<script type="text/javascript"
	src="${ctx_web}/js/comm/jquery/jquery-core.min.js?v=201503161711"></script>
<script type="text/javascript"
	src="${ctx_web}/js/comm/fai.min.js?v=201512071738"></script>
<script type="text/javascript"
	src="${ctx_web}/js/comm/jquery/jquery-ui-core.min.js?v=201511231730"></script>
<script type="text/javascript"
	src="${ctx_web}/js/comm/pinyin.min.js?v=201306041217"></script>
<script type="text/javascript"
	src="${ctx_web}/js/comm/faiui.min.js?v=201601111801"></script>
<script type="text/javascript"
	src="${ctx_web}/js/site.min.js?v=201601131153"></script>
<script type="text/javascript"
	src="${ctx_web}/js/manage.min.js?v=201601121610"></script>
<script type="text/javascript">
	try {
		Fai.top = parent.Fai.top;
	} catch (e) {
	}
	</script>
<link href="${ctx_web}/css/site/mulModuleColEdit.min.css" rel="stylesheet"
	type="text/css">
</head>
<body class="popupTabBody">
	<div class="ui-tabs ui-widget ui-widget-content ui-corner-all"
		id="tabs">
		<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
			<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active">
				<a href="#basicSetting">常规</a>
			</li>
		</ul>

		<!-- basicSetting -->
		<div class="ui-tabs-panel ui-widget-content ui-corner-bottom"
			id="basicSetting">
			<div id="moduleTitleName" class="setline">
				<div class="setline-padd">
					<div class="setTitle">模块标题：</div>
					<div class="setCtrl">
						<input maxlength="50" id="name" name="name" class="input"
							value="模块列" type="text">
					</div>
				</div>
			</div>

			<div class="choiceContainer">
				<div class="choiceTitle">选择排版：</div>
				<div class="choice-box">
					<div class="choiceButton">
						<a href="javascript:;" class="choice-icon mulCol-two"
							onclick="mulColNumChoice(2);return false;" hidefocus="true"
							title="二列排版"></a> <a href="javascript:;" class="choice-title"
							onclick="mulColNumChoice(2);return false;" hidefocus="true">二列排版</a>
						<a href="javascript:;" id="choiceTipTwo" class="choice-tip"
							onclick="mulColNumChoice(2);return false;" hidefocus="true"
							style="display: none;"></a>
					</div>
					<div class="choiceButton">
						<a href="javascript:;" class="choice-icon mulCol-three"
							onclick="mulColNumChoice(3);return false;" hidefocus="true"
							title="三列排版"></a> <a href="javascript:;" class="choice-title"
							onclick="mulColNumChoice(3);return false;" hidefocus="true">三列排版</a>
						<a href="javascript:;" id="choiceTipThree" class="choice-tip"
							onclick="mulColNumChoice(3);return false;" hidefocus="true"
							style="display: block;"></a>
					</div>
					<div class="choiceButton">
						<a href="javascript:;" class="choice-icon mulCol-four"
							onclick="mulColNumChoice(4);return false;" hidefocus="true"
							title="四列排版"></a> <a href="javascript:;" class="choice-title"
							onclick="mulColNumChoice(4);return false;" hidefocus="true">四列排版</a>
						<a href="javascript:;" id="choiceTipFour" class="choice-tip"
							onclick="mulColNumChoice(4);return false;" hidefocus="true"
							style="display: none;"></a>
					</div>
					<div class="choiceButton">
						<a href="javascript:;" class="choice-icon mulCol-five"
							onclick="mulColNumChoice(5);return false;" hidefocus="true"
							title="五列排版"></a> <a href="javascript:;" class="choice-title"
							onclick="mulColNumChoice(5);return false;" hidefocus="true">五列排版</a>
						<a href="javascript:;" id="choiceTipFive" class="choice-tip"
							onclick="mulColNumChoice(5);return false;" hidefocus="true"
							style="display: none;"></a>
					</div>
				</div>
			</div>
		</div>
		<!-- //end basicSetting -->
	</div>

	<script type="text/javascript">
		
		var inThisMulMColList = [];
		var inThisMulMColListWidth = []; // 保存宽度信息
		var g_thisModuleId = <%if(StringUtils.isBlank(id)){out.print(0);}else{out.print(id);}%>;
		var showTable = "#showMulModuleColTable";
		var maxOpenColNum = 5;
		var realOpenColNum = <%=num%>;
		var pbwId = 0;
		var Limit_NAME_MAXLEN = 50;
		var g_init = false;
		var mulColSpacing = Site.getModuleAttrPattern(g_thisModuleId).mulModuleColPattern.mms;
		var popupID = <%=popupID%>;

		var showChoiceModuleTable = "#showChoiceModuleTable";

		$(function() {
			$('#name').select();
			Fai.addPopupWindowBtn(popupID, {
				id : "save",
				extClass : 'saveButton',
				text : "确 定",
				click : save
			});
			Fai.addPopupWindowBtn(popupID, {
				id : "close",
				extClass : 'cancelButton',
				text : "取 消",
				click : "close"
			});

			var newMulColObj = {};
			newMulColObj["cId"] = "";
			newMulColObj["cList"] = [];
			inThisMulMColList.push(newMulColObj);

			$("#tabs").tabs({
				selected : 0
			});

			$("#name").focus();
			$("#name").attr("maxlength", Limit_NAME_MAXLEN);

			mulColNumChoice(realOpenColNum);

			//页面加载完后再执行，必须放在在页面加载尾，判断页面内容是否发生改变
			Site.loadPageChange({
				unBindId : [],
				popupID : popupID
			});
			if (g_thisModuleId == 0) {
				top.$('#popup'+popupID+'save').removeAttr('disabled');
				top.$('#popup'+popupID+'save').removeClass('saveButton-disabled');
			}
			g_init = true;
		});

		// 初始化时 如果是修改打开的，拿到生成该模块的数据
		function getThisModuleData() {
			var tmpData = {};
			var module = Fai.top.$("#module" + g_thisModuleId);

			//inMulCol data
			var inMulModuleList = module.find(".mulMColContent .mulMColList");
			var tmpImcData = {};
			tmpImcData.r = inMulModuleList.length; // 真识的最大长度
			tmpImcData.l = [];
			tmpImcData.wl = [];
			inMulModuleList.each(function(index, thisList) {
				var tmpMListObj = {};
				tmpMListObj["cId"] = index + 1;
				tmpMListObj["cList"] = [];

				$(this).find(">.form").each(
					function() {
						var inMulModuleId = $(this).attr("id").replace("module", "");
						tmpMListObj["cList"].push(parseInt(inMulModuleId));
				});

				tmpImcData.l.push(tmpMListObj);

				var tmpMListWidthObj = {};
				tmpMListWidthObj.i = index + 1;
				tmpMListWidthObj.w = -1;
				var thisListWidth = parseInt($(this).width());
				if (!isNaN(thisListWidth)) {
					tmpMListWidthObj.w = thisListWidth;
				}

				tmpImcData.wl.push(tmpMListWidthObj);

			});
			tmpData.imd = tmpImcData;
			return tmpData;
		}

		function mulColNumChoice(num) {
			// 更新全局真实开始col数
			realOpenColNum = num;
			var tipId = "choiceTipThree";
			switch (num) {
			case 2:
				tipId = "choiceTipTwo";
				break;
			case 3:
				tipId = "choiceTipThree";
				break;
			case 4:
				tipId = "choiceTipFour";
				break;
			case 5:
				tipId = "choiceTipFive";
				break;
			}
			$(".choice-tip").hide();
			$("#" + tipId).show();

			if (g_init) {
				// 清空宽度数据
				inThisMulMColListWidth = [];
				setPageChange();
			}

		}

		function refreshInThisMulMColList(colNum) {
			var len = inThisMulMColList.length;
			var newInThisMulMColList = [];
			//当改变的新列数小于旧的列数，则需要将超出列数的内容移到新列数最后
			if (colNum < len) {
				for (var i = 0; i < colNum; i++) {
					newInThisMulMColList.push(inThisMulMColList[i]);
				}
				for (var j = colNum; j < len; j++) {
					var tmpData = inThisMulMColList[j]["cList"];
					for (var k = 0; k < tmpData.length; k++) {
						newInThisMulMColList[colNum - 1]["cList"]
								.push(tmpData[k]);
					}
				}
				inThisMulMColList = newInThisMulMColList;//更新列表内容
			}
		}

		function save() {
			var name = $("#name").val();
			var maxlen = 50;
			if (name.length > maxlen) {
				Fai.ing("模块标题文字长度不能超过" + maxlen + "。", true);
				$("#name").focus();
				return;
			}

			var params = [];
			params.push("name=" + Fai.encodeUrl(name));

			// 保护
			if (realOpenColNum > maxOpenColNum) {
				realOpenColNum = maxOpenColNum;
			}
			refreshInThisMulMColList(realOpenColNum);
			params.push("&prop2=" + realOpenColNum); //必须设置列数，否则会默认为3列	

			// 这里allCheckList是一个数据对象。由于inTab原因，名字未作修改，这里把checkList理解成传递的数据对象
			var allCheckList = {};
			allCheckList["realOpenColNum"] = realOpenColNum;
			allCheckList["inThisMulMColList"] = inThisMulMColList;
			allCheckList["inThisMulMColListWidth"] = inThisMulMColListWidth;
			if (realOpenColNum > 1) {
				allCheckList["mulColSpacing"] = mulColSpacing;
			}

			Fai.enablePopupWindowBtn(popupID, "save", false);
			if (g_thisModuleId == 0) {
				Fai.ing("正在添加模块列...", false);
			} else {
				Fai.ing("正在修改模块列...", false);
			}

			$.ajax({
				type : "post",
				<%if(StringUtils.isBlank(id)){out.print("url: '../ajax/module_h.jsp?cmd=add&style=35&colId=2&extId=0',");}else{out.print("url: '../ajax/module_h.jsp?cmd=setBack&id="+id+"&style=35&colId=2&extId=0',");}%>
				data : params.join(''),
				error : function() {
					Fai.enablePopupWindowBtn(popupID, "save", true);
					Fai.ing("系统错误。", false);
				},
				success : function(result) {
					Fai.enablePopupWindowBtn(popupID, "save", true);
					reSetPageChange();

					if (Fai.successHandle(result, "", "系统错误", "", 3, 1)) {
						var res = $.parseJSON(result);

						Site.getModuleAttrData(res.id).changed = true;
						Fai.top.Site.addNewModule(res.id, res.div, null, null,
						{
							"callback" : top.Site.addNewMulMColModuleCallBack,
							"allCheckList" : $.toJSON(allCheckList),
							"parentId" : res.id,
							"colId" : 2,
							"extId" : 0,
							"returnModuledata" : res.moduleData
						});
						Fai.top.Site.refreshMulMColModule(res.id, 2, 0, $.toJSON(allCheckList), name);
					}

				}
			});

		}

		//页面值改变
		function setPageChange() {
			Site.setPageChange(true, popupID);
		}
		//保存时reset
		function reSetPageChange() {
			Site.setPageChange(false, popupID);
		}
	</script>

</body>
</html>