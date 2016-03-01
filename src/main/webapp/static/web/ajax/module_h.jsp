<%@page import="com.seeyoui.kensite.portal.web.util.ModuleGenUtils"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.seeyoui.kensite.portal.web.domain.ModuleData"%>
<%@page import="com.seeyoui.kensite.common.constants.StringConstant"%>
<%@ page import="com.seeyoui.kensite.common.util.*"%>
<%@ page import="com.seeyoui.kensite.portal.web.domain.floatBtn.*"%>
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
		if("35".equals(style)) {//列排版
			String prop2 = request.getParameter("prop2");
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
			String content = "<div class='mulMColContent' id='mulMColContent"+id+"'><table width=\"100%\" border=\"0\" cellspacing=\"0\" class=\"mulMColContentTable\" cellpadding=\"0\"><tbody><tr><td class=\" mulColLayout mulColPadding\" style=\"\"><div id=\"mulMCol"+id+"_cid_1\" class=\"mulMColList column\"></div><div class=\"mulModuleColStyleLine\" style=\"\"></div></td><td class=\"mulColLayout\" style=\"\"><div id=\"mulMCol"+id+"_cid_2\" class=\"mulMColList column\"></div></td></tr></tbody></table></div>";
			String script = "Site.bindInMulColResizableModule("+id+");Site.initMulColModuleInIE('#module"+id+"');";
			String toolTitle = "编辑模块列模块";
			String toolScript = "Site.popupWindow({title:'"+toolTitle+"', frameSrcUrl:'manage/mulModuleColEdit.jsp?id="+id+"&colId=2&extId=0&ram='+Math.random(), width:'585', height:'280', saveBeforePopup:false});";
			String css = "";
			css = css.replaceAll("MODULE_ID", String.valueOf(id));
			String div = ModuleGenUtils.genModuleStr("moduleAdd", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
			result.put("div", div);
			JSONObject jsonObj = JSONObject.fromObject(result);
			out.print(jsonObj.toString());
		}
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
			String div = ModuleGenUtils.genModuleStr("moduleAdd", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
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
			String div = ModuleGenUtils.genModuleStr("moduleAdd", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
			result.put("div", div);
			JSONObject jsonObj = JSONObject.fromObject(result);
			out.print(jsonObj.toString());
		}

		if("81".equals(style)) {//浮动按钮
			String pattern = request.getParameter("pattern");
			String prop1 = request.getParameter("prop1");
			JSONObject jsonObject = JSONObject.fromObject(prop1);
			FloatBtn floatBtn = (FloatBtn)JSONObject.toBean(jsonObject, FloatBtn.class);
			String bns = floatBtn.getBns();
			String bsv = floatBtn.getBs().getV();
			String bsh = floatBtn.getBs().getH();
			String bgt = floatBtn.getBg().getT();
			String st = floatBtn.getS().getT();
			String rt = floatBtn.getR().getT();
			String sht = floatBtn.getSh().getT();
			String bt = floatBtn.getB().getT();
			String btcss = "";
			if(StringUtils.isNoneBlank(st) && !"0".equals(st)) {
				btcss += "height:"+floatBtn.getS().getH()+"px;width:"+floatBtn.getS().getW()+"px;line-height:"+floatBtn.getS().getH()+"px;";
			}
			if(StringUtils.isNoneBlank(bgt) && !"0".equals(bgt)) {
				String bgr = floatBtn.getBg().getR();
				btcss += "background:"+floatBtn.getBg().getC();
				String bgi = floatBtn.getBg().getI();
				if(StringUtils.isNoneBlank(bgi)) {
					btcss += " url(http://2.ss.faisys.com/image/materialLib/illustration/000005.jpg) repeat center";
				}
				btcss += ";";
			}
			if(StringUtils.isNoneBlank(rt) && !"0".equals(rt)) {
				String rts = floatBtn.getR().getLt()+"px "+floatBtn.getR().getRt()+"px "+floatBtn.getR().getLb()+"px "+floatBtn.getR().getRb()+"px";
				btcss += "-moz-border-radius:"+rts+";-webkit-border-radius:"+rts+";border-radius:"+rts+";";
			}
			if(StringUtils.isNoneBlank(sht) && !"0".equals(sht)) {
				String shts = floatBtn.getSh().getDx()+"px "+floatBtn.getSh().getDy()+"px "+floatBtn.getSh().getF()+"px "+floatBtn.getSh().getC()+";";
				btcss += "-webkit-box-shadow:"+shts+";-moz-box-shadow:"+shts+";box-shadow:"+shts+";";
			}
			if(StringUtils.isNoneBlank(bt) && !"0".equals(bt)) {
				btcss += "border:"+floatBtn.getB().getW()+"px solid "+floatBtn.getB().getC()+";";
			}
			if(StringUtils.isBlank(bsh)) {
				bsh = "javascript:;";
			}
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
			String content = "<div class='J_floatBtnBox floatBtnBox floatBtnStyle"+bns+"'><a id='module"+id+"FlBtn' href='"+bsh+"' class='middle floatBtn g_specialClass' target='_blank' style='"+btcss+"'>"+bsv+"</a></div>";
			String script = "Site.initModuleDate.init("+id+", "+bns+", "+prop1+");";
			String toolTitle = "编辑按钮模块";
			String toolScript = "Site.popupWindow({title:'"+toolTitle+"', frameSrcUrl:'manage/floatBtnEdit.jsp?id="+id+"&colId=2&extId=0&ram='+Math.random(), width:'550', height:'360', saveBeforePopup:false});";
			String css = "#moduleMODULE_ID {height:"+floatBtn.getS().getH()+"px;}#moduleMODULE_ID {border:none;}#moduleMODULE_ID {padding:0px;}#moduleMODULE_ID .formMiddleMODULE_ID{border:none;}#moduleMODULE_ID .formMiddleMODULE_ID{padding:0px;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleCenterMODULE_ID{border:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleCenterMODULE_ID{padding:0px;}#moduleMODULE_ID .formTopMODULE_ID{display:none;}#moduleMODULE_ID .formBottomMODULE_ID{display:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleLeftMODULE_ID{display:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleRightMODULE_ID{display:none;}#moduleMODULE_ID .formBannerMODULE_ID{display:none;}#moduleMODULE_ID {background:none;}#moduleMODULE_ID .formMiddleMODULE_ID {background:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleCenterMODULE_ID{background:none;}#moduleMODULE_ID .formMiddleContentMODULE_ID{background:none;}";
			css = css.replaceAll("MODULE_ID", String.valueOf(id));
			String div = ModuleGenUtils.genModuleStr("moduleAdd", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
			result.put("div", div);
			JSONObject jsonObj = JSONObject.fromObject(result);
			out.print(jsonObj.toString());
		}
		
		if("80".equals(style)) {//通栏模块
			String pattern = request.getParameter("pattern");
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
			String content = "";
			String script = "";
			String toolTitle = "编辑通栏模块";
			String toolScript = "Site.popupWindow({title:'"+toolTitle+"', frameSrcUrl:'manage/styleFullmeasure.jsp?id="+id+"&colId=2&extId=0&ram='+Math.random(), width:'480', height:'300', saveBeforePopup:false});";
			String css = "";
			css = css.replaceAll("MODULE_ID", String.valueOf(id));
			String div = ModuleGenUtils.genModuleStr("styleFullmeasure", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
			result.put("div", div);
			JSONObject jsonObj = JSONObject.fromObject(result);
			out.print(jsonObj.toString());
		}
	}
%>

<%
	if(StringConstant.WEB_SET_BACK.equals(cmd)) {
		String name = request.getParameter("name");
		if("35".equals(style)) {//列排版
			String prop2 = request.getParameter("prop2");
			int id = Integer.parseInt(request.getParameter("id"));
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
			String content = "<div class='mulMColContent' id='mulMColContent"+id+"'><table width=\"100%\" border=\"0\" cellspacing=\"0\" class=\"mulMColContentTable\" cellpadding=\"0\"><tbody><tr><td class=\" mulColLayout mulColPadding\" style=\"\"><div id=\"mulMCol"+id+"_cid_1\" class=\"mulMColList column\"></div><div class=\"mulModuleColStyleLine\" style=\"\"></div></td><td class=\"mulColLayout\" style=\"\"><div id=\"mulMCol"+id+"_cid_2\" class=\"mulMColList column\"></div></td></tr></tbody></table></div>";
			String script = "Site.bindInMulColResizableModule("+id+");Site.initMulColModuleInIE('#module"+id+"');";
			String toolTitle = "编辑模块列模块";
			String toolScript = "Site.popupWindow({title:'"+toolTitle+"', frameSrcUrl:'manage/mulModuleColEdit.jsp?id="+id+"&colId=2&extId=0&ram='+Math.random(), width:'585', height:'280', saveBeforePopup:false});";
			String css = "";
			css = css.replaceAll("MODULE_ID", String.valueOf(id));
			String div = ModuleGenUtils.genModuleStr("moduleAdd", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
			result.put("div", div);
			JSONObject jsonObj = JSONObject.fromObject(result);
			out.print(jsonObj.toString());
		}
		if("65".equals(style)) {//收藏本站
			String prop0 = request.getParameter("prop0");
			int id = Integer.parseInt(request.getParameter("id"));
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
			String div = ModuleGenUtils.genModuleStr("moduleSetBack", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
			result.put("div", div);
			JSONObject jsonObj = JSONObject.fromObject(result);
			out.print(jsonObj.toString());
		}
		if("66".equals(style)) {//当前时间
			String prop0 = request.getParameter("prop0");
			int id = Integer.parseInt(request.getParameter("id"));
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("success", true);
			result.put("msg", "添加成功");
			result.put("id", id);
			result.put("style", 0);
			String content = "<div id='module"+id+"Date' class='date g_specialClass'>&nbsp;</div>";
			String script = "Site.initModuleDate.init("+id+", "+prop0+");";
			String toolTitle = "编辑日期模块";
			String toolScript = "Site.popupWindow({title:'"+toolTitle+"', frameSrcUrl:'manage/dateModuleEdit.jsp?id="+id+"&colId=2&extId=0&ram='+Math.random(), width:'550', height:'360', saveBeforePopup:false});";
			String css = "";
			String div = ModuleGenUtils.genModuleStr("moduleSetBack", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
			result.put("div", div);
			JSONObject jsonObj = JSONObject.fromObject(result);
			out.print(jsonObj.toString());
		}

		if("81".equals(style)) {//浮动按钮
			String pattern = request.getParameter("pattern");
			String prop1 = request.getParameter("prop1");
			JSONObject jsonObject = JSONObject.fromObject(prop1);
			FloatBtn floatBtn = (FloatBtn)JSONObject.toBean(jsonObject, FloatBtn.class);
			String bns = floatBtn.getBns();
			String bsv = floatBtn.getBs().getV();
			String bsh = floatBtn.getBs().getH();
			String bgt = floatBtn.getBg().getT();
			String st = floatBtn.getS().getT();
			String rt = floatBtn.getR().getT();
			String sht = floatBtn.getSh().getT();
			String bt = floatBtn.getB().getT();
			String btcss = "";
			if(StringUtils.isNoneBlank(st) && !"0".equals(st)) {
				btcss += "height:"+floatBtn.getS().getH()+"px;width:"+floatBtn.getS().getW()+"px;line-height:"+floatBtn.getS().getH()+"px;";
			}
			if(StringUtils.isNoneBlank(bgt) && !"0".equals(bgt)) {
				String bgr = floatBtn.getBg().getR();
				btcss += "background:"+floatBtn.getBg().getC();
				String bgi = floatBtn.getBg().getI();
				if(StringUtils.isNoneBlank(bgi)) {
					btcss += " url(http://2.ss.faisys.com/image/materialLib/illustration/000005.jpg) repeat center";
				}
				btcss += ";";
			}
			if(StringUtils.isNoneBlank(rt) && !"0".equals(rt)) {
				String rts = floatBtn.getR().getLt()+"px "+floatBtn.getR().getRt()+"px "+floatBtn.getR().getLb()+"px "+floatBtn.getR().getRb()+"px";
				btcss += "-moz-border-radius:"+rts+";-webkit-border-radius:"+rts+";border-radius:"+rts+";";
			}
			if(StringUtils.isNoneBlank(sht) && !"0".equals(sht)) {
				String shts = floatBtn.getSh().getDx()+"px "+floatBtn.getSh().getDy()+"px "+floatBtn.getSh().getF()+"px "+floatBtn.getSh().getC()+";";
				btcss += "-webkit-box-shadow:"+shts+";-moz-box-shadow:"+shts+";box-shadow:"+shts+";";
			}
			if(StringUtils.isNoneBlank(bt) && !"0".equals(bt)) {
				btcss += "border:"+floatBtn.getB().getW()+"px solid "+floatBtn.getB().getC()+";";
			}
			if(StringUtils.isBlank(bsh)) {
				bsh = "javascript:;";
			}
			int id = Integer.parseInt(request.getParameter("id"));
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
			String content = "<div class='J_floatBtnBox floatBtnBox floatBtnStyle"+bns+"'><a id='module"+id+"FlBtn' href='"+bsh+"' class='middle floatBtn g_specialClass' target='_blank' style='"+btcss+"'>"+bsv+"</a></div>";
			String script = "Site.initModuleDate.init("+id+", "+bns+", "+prop1+");";
			String toolTitle = "编辑按钮模块";
			String toolScript = "Site.popupWindow({title:'"+toolTitle+"', frameSrcUrl:'manage/floatBtnEdit.jsp?id="+id+"&colId=2&extId=0&ram='+Math.random(), width:'550', height:'360', saveBeforePopup:false});";
			String css = "#moduleMODULE_ID {height:"+floatBtn.getS().getH()+"px;}#moduleMODULE_ID {border:none;}#moduleMODULE_ID {padding:0px;}#moduleMODULE_ID .formMiddleMODULE_ID{border:none;}#moduleMODULE_ID .formMiddleMODULE_ID{padding:0px;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleCenterMODULE_ID{border:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleCenterMODULE_ID{padding:0px;}#moduleMODULE_ID .formTopMODULE_ID{display:none;}#moduleMODULE_ID .formBottomMODULE_ID{display:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleLeftMODULE_ID{display:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleRightMODULE_ID{display:none;}#moduleMODULE_ID .formBannerMODULE_ID{display:none;}#moduleMODULE_ID {background:none;}#moduleMODULE_ID .formMiddleMODULE_ID {background:none;}#moduleMODULE_ID .formMiddleMODULE_ID .formMiddleCenterMODULE_ID{background:none;}#moduleMODULE_ID .formMiddleContentMODULE_ID{background:none;}";
			css = css.replaceAll("MODULE_ID", String.valueOf(id));
			String div = ModuleGenUtils.genModuleStr("moduleAdd", String.valueOf(id), style, name, content, script, toolTitle, toolScript, css);
			result.put("div", div);
			JSONObject jsonObj = JSONObject.fromObject(result);
			out.print(jsonObj.toString());
		}
	}
%>