/*
 * Powered By cuichen
 * Since 2014 - 2016
 */
package com.seeyoui.kensite.bussiness.demo.controller;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.lucene.index.Term;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.framework.luence.domain.LuceneDocument;
import com.seeyoui.kensite.framework.luence.util.LuceneUtils;

import com.seeyoui.kensite.common.util.DateUtils;
import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.base.domain.EasyUIDataGrid;
import com.seeyoui.kensite.common.base.controller.BaseController;
import com.seeyoui.kensite.common.util.RequestResponseUtil;
import com.seeyoui.kensite.common.util.excel.ExportExcel;

import com.seeyoui.kensite.framework.luence.domain.LuceneDocument;
import com.seeyoui.kensite.framework.luence.util.LuceneUtils;

import com.seeyoui.kensite.bussiness.demo.domain.Demo;
import com.seeyoui.kensite.bussiness.demo.service.DemoService;
/**
 * 演示
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2016-04-21
 */
@Controller
@RequestMapping(value = "demo/demo")
public class DemoController extends BaseController {
	
	@Autowired
	private DemoService demoService;
	
	/**
	 * 展示列表页面
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("demo:demo:view")
	@RequestMapping(value = "/{page}")
	public ModelAndView view(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, @PathVariable String page) throws Exception {
		return new ModelAndView("bussiness/demo/"+page, modelMap);
	}
	
	/**
	 * 根据ID查询单条数据
	 * @param modelMap
	 * @param module
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("demo:demo:select")
	@RequestMapping(value = "/data/{id}")
	@ResponseBody
	public Object data(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, @PathVariable String id) throws Exception {
		Demo demo = demoService.findOne(id);
		return demo;
	}
	
	/**
	 * 获取列表展示数据
	 * @param modelMap
	 * @param demo
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("demo:demo:select")
	@RequestMapping(value = "/list/data", method=RequestMethod.POST)
	@ResponseBody
	public Object listData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Demo demo) throws Exception {
		List<Demo> demoList = demoService.findList(demo);
		int total = demoService.findTotal(demo);
		EasyUIDataGrid eudg = new EasyUIDataGrid();
		eudg.setTotal(String.valueOf(total));
		eudg.setRows(demoList);
		return eudg;
	}
	
	/**
	 * 获取所有数据
	 * @param modelMap
	 * @param demo
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("demo:demo:select")
	@RequestMapping(value = "/list/all", method=RequestMethod.POST)
	@ResponseBody
	public Object listAll(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Demo demo) throws Exception {
		List<Demo> demoList = demoService.findAll(demo);
		return demoList;
	}
	
	/**
	 * 保存新增的数据
	 * @param modelMap
	 * @param demo
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("demo:demo:insert")
	@RequestMapping(value = "/save", method=RequestMethod.POST)
	@ResponseBody
	public String save(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Demo demo) throws Exception {
		if (!beanValidator(modelMap, demo)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		demoService.save(demo);
		String luceneUrl = session.getServletContext().getRealPath("/")+StringConstant.LUCENE_INDEX_URL+"demo";
		LuceneDocument document = new LuceneDocument();
		document.setId(demo.getId());
		document.setContent(""
			+","+demo.getTreeId()
			+","+demo.getExpression()
			+","+demo.getUserName()
		);
		LuceneUtils.insert(luceneUrl, document);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 保存修改的数据
	 * @param modelMap
	 * @param demo
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("demo:demo:update")
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	@ResponseBody
	public String update(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Demo demo) throws Exception {
		if (!beanValidator(modelMap, demo)){
			RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.FALSE);
			return null;
		}
		demoService.update(demo);
		String luceneUrl = session.getServletContext().getRealPath("/")+StringConstant.LUCENE_INDEX_URL+"demo";
		LuceneDocument document = new LuceneDocument();
		document.setId(demo.getId());
		document.setContent(""
			+","+demo.getTreeId()
			+","+demo.getExpression()
			+","+demo.getUserName()
		);
		Term term = new Term("id", demo.getId());
		LuceneUtils.update(luceneUrl, term, document);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 删除数据库
	 * @param modelMap
	 * @param demoId
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("demo:demo:delete")
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String id) throws Exception {
		List<String> listId = Arrays.asList(id.split(","));
		demoService.delete(listId);
		String luceneUrl = session.getServletContext().getRealPath("/")+StringConstant.LUCENE_INDEX_URL+"demo";
		for(String key : listId) {
			Term term = new Term("id", key);
			LuceneUtils.delete(luceneUrl, term);
		}
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}

	/**
	 * 导出Excel数据
	 * @param modelMap
	 * @param demo
	 * @return
	 * @throws Exception
	 */
	//@RequiresPermissions("demo:demo:export")
	@RequestMapping(value = "/export")
	public String export(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, Demo demo) throws Exception {
		String fileName = DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
		List<Demo> demoList = demoService.findAll(demo);
		new ExportExcel(null, Demo.class).setDataList(demoList).write(response, fileName).dispose();
		return null;
	}
	/**
	 * 全文检索分页
	 * @param session
	 * @param response
	 * @param request
	 * @param modelMap
	 * @param searchStr
	 * @param page
	 * @param rows
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lucene/data")
	@ResponseBody
	public Object luceneData(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String searchStr, int page, int rows) throws Exception {
		String luceneUrl = session.getServletContext().getRealPath("/")+StringConstant.LUCENE_INDEX_URL+"demo";
		List<String> listId = LuceneUtils.search(luceneUrl, searchStr, page, rows);
		List<Demo> demoList = demoService.findLucene(listId);
		return demoList;
	}

	/**
	 * 全文检索
	 * @param session
	 * @param response
	 * @param request
	 * @param modelMap
	 * @param searchStr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lucene/all")
	@ResponseBody
	public Object luceneAll(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap, String searchStr) throws Exception {
		String luceneUrl = session.getServletContext().getRealPath("/")+StringConstant.LUCENE_INDEX_URL+"demo";
		List<String> listId = LuceneUtils.search(luceneUrl, searchStr, 1, Integer.MAX_VALUE);
		List<Demo> demoList = demoService.findLucene(listId);
		return demoList;
	}
	
	/**
	 * 全文检索清空索引
	 * @param session
	 * @param response
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lucene/clean")
	@ResponseBody
	public Object luceneClean(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		String luceneUrl = session.getServletContext().getRealPath("/")+StringConstant.LUCENE_INDEX_URL+"demo";
		LuceneUtils.clean(luceneUrl);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
	
	/**
	 * 
	 * @param session
	 * @param response
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/lucene/create")
	@ResponseBody
	public Object luceneCreate(HttpSession session,
			HttpServletResponse response, HttpServletRequest request,
			ModelMap modelMap) throws Exception {
		String luceneUrl = session.getServletContext().getRealPath("/")+StringConstant.LUCENE_INDEX_URL+"demo";
		List<LuceneDocument> documentList = new ArrayList<LuceneDocument>();
		List<Demo> demoList = demoService.findAll(new Demo());
		for(Demo demo : demoList) {
			LuceneDocument document = new LuceneDocument();
			document.setId(demo.getId());
			document.setContent(""
				+","+demo.getTreeId()
				+","+demo.getExpression()
				+","+demo.getUserName()
			);
			documentList.add(document);
		}
		LuceneUtils.create(luceneUrl, documentList);
		RequestResponseUtil.putResponseStr(session, response, request, modelMap, StringConstant.TRUE);
		return null;
	}
}