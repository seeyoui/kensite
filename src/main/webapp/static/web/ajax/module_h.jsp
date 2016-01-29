<%@page import="com.seeyoui.kensite.portal.web.util.ModuleGenUtils"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.seeyoui.kensite.portal.web.domain.ModuleData"%>
<%@page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page import="com.seeyoui.kensite.common.util.*"%>
<%@ page import="com.seeyoui.kensite.portal.web.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String cmd = request.getParameter("cmd");
	String colId = request.getParameter("colId");
	String extId = request.getParameter("extId");
	String style = request.getParameter("style");
	String global = request.getParameter("global");
	if(StringConstant.WEB_ADD.equals(cmd)) {
		String name = request.getParameter("name");
		if("65".equals(style)) {//收藏本站
			String prop0 = request.getParameter("prop0");
			int id = Integer.parseInt(DBUtils.getString(StringConstant.WEB_SEQ_SQL, "ID"));
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", true);
			result.put("msg", "添加成功");
			result.put("id", id);
			ModuleData moduleData = new ModuleData();
			moduleData.setId(id);
			moduleData.setName(name);
			moduleData.setValid(true);
			moduleData.setGlobal("true".equals(global));
			moduleData.setSpecial(false);
			moduleData.setCus(true);
			moduleData.setStyle(Integer.parseInt(style));
			result.put("moduleData", moduleData);
			String content = "<div class='favorite'>\n<a hidefocus='true' href='javascript:;' onclick=\"Fai.setHomePage('http://www.seeyoui.com')\">"
		                + "\n设为首页</a>&nbsp;<a>|</a>&nbsp;<a hidefocus='true' href='javascript:;' onclick=\"Fai.addBookmark('KenSite','http://www.seeyoui.com')\">收藏本站</a>\n</div>";
			String script = "";
			String toolTitle = "编辑收藏本站模块";
			String toolScript = "Site.popupWindow({title:'"+toolTitle+"', frameSrcUrl:'manage/favoriteModuleEdit.jsp?id="+id+"&colId=2&extId=0&ram='+Math.random(), width:'340', height:'80', saveBeforePopup:false});";
			String css = "#moduleMODULE_ID {border:none;}#moduleMODULE_ID {padding:0px;}#moduleMODULE_ID .formMiddleMODULE_ID{border:none;}#moduleMODULE_ID .formMiddleMODULE_ID{padding:0px;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleCenterMODULE_ID{border:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleCenterMODULE_ID{padding:0px;}#moduleMODULE_ID .formTopMODULE_ID{display:none;}#moduleMODULE_ID .formBottomMODULE_ID{display:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleLeftMODULE_ID{display:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleRightMODULE_ID{display:none;}#moduleMODULE_ID .formBannerMODULE_ID{display:none;}";
			css = css.replaceAll("MODULE_ID", String.valueOf(id));
			String div = ModuleGenUtils.genModuleStr("moduleReturn", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
			result.put("div", div);
			JSONObject jsonObj = JSONObject.fromObject(result);
			out.print(jsonObj.toString());
		}
		if("66".equals(style)) {//当前时间
			String prop0 = request.getParameter("prop0");
			int id = Integer.parseInt(DBUtils.getString(StringConstant.WEB_SEQ_SQL, "ID"));
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", true);
			result.put("msg", "添加成功");
			result.put("id", id);
			ModuleData moduleData = new ModuleData();
			moduleData.setId(id);
			moduleData.setName(name);
			moduleData.setValid(true);
			moduleData.setGlobal("true".equals(global));
			moduleData.setSpecial(false);
			moduleData.setCus(true);
			moduleData.setStyle(Integer.parseInt(style));
			result.put("moduleData", moduleData);
			String content = "<div id='module"+id+"Date' class='date g_specialClass'>&nbsp;</div>";
			String script = "Site.initModuleDate.init("+id+", "+prop0+");";
			String toolTitle = "编辑日期模块";
			String toolScript = "Site.popupWindow({title:'"+toolTitle+"', frameSrcUrl:'manage/dateModuleEdit.jsp?id="+id+"&colId=2&extId=0&ram='+Math.random(), width:'550', height:'360', saveBeforePopup:false});";
			String css = "";
			String div = ModuleGenUtils.genModuleStr("moduleReturn", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
			result.put("div", div);
			JSONObject jsonObj = JSONObject.fromObject(result);
			out.print(jsonObj.toString());
		}
	}
%>