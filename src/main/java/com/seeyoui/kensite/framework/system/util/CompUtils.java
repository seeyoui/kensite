package com.seeyoui.kensite.framework.system.util;

import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;

import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.util.CacheUtils;
import com.seeyoui.kensite.common.util.DBUtils;
import com.seeyoui.kensite.common.util.SpringContextHolder;
import com.seeyoui.kensite.common.util.StringUtils;
import com.seeyoui.kensite.framework.mod.tableColumn.domain.TableColumn;
import com.seeyoui.kensite.framework.mod.tableColumn.persistence.TableColumnMapper;
import com.seeyoui.kensite.framework.plugin.dict.domain.Dict;

/**
 * 表单控件工具类
 * @author Ken
 * @version 2015-11-10
 */
public class CompUtils {
	
	private static TableColumnMapper sysUserMapper = SpringContextHolder.getBean(TableColumnMapper.class);

	public static final String CACHE_COMP = "comp";
	public static final String CACHE_SPLIT = "-";
	public static final String CACHE_EASYUI = "easyui";

	private static final String TEXTBOX = "textbox";
	private static final String NUMBERBOX = "numberbox";
	private static final String COMBOBOX = "combobox";
	private static final String RADIOBOX = "radiobox";
	private static final String CHECKBOX = "checkbox";
	private static final String DATEBOX = "datebox";
	private static final String HTMLDESIGN = "htmldesign";
	private static final String TEXTAREA = "textarea";
	private static final String COMBOTREE = "combotree";
	private static final String COMBOGRID = "combogrid";
	
	public static TableColumn getTableColumn(TableColumn tableColumn){
		TableColumn tc = null;
		if (tableColumn!=null){
			tc = (TableColumn)CacheUtils.get(CACHE_COMP+CACHE_SPLIT+tableColumn.getTableName()+CACHE_SPLIT+tableColumn.getName());
			if (tc ==  null){
				tc = sysUserMapper.findTableColumn(tableColumn);
				if(tc == null) {
					return null;
				}
				CacheUtils.put(CACHE_COMP+CACHE_SPLIT+tableColumn.getTableName()+CACHE_SPLIT+tableColumn.getName(), tc);
			}
		}
		return tc;
	}
	
	public static StringBuffer getTableColumnStr(TableColumn tableColumn) throws Exception {
		TableColumn tc = getTableColumn(tableColumn);
		if(tc == null) {
			return null;
		}
		StringBuffer result = getEasyUIStr(tc);
		return result;
	}
	
	private static StringBuffer getEasyUIStr(TableColumn tableColumn) throws Exception {
		StringBuffer result = (StringBuffer)CacheUtils.get(CACHE_COMP+CACHE_SPLIT+CACHE_EASYUI+CACHE_SPLIT+tableColumn.getTableName()+CACHE_SPLIT+tableColumn.getName());
		if (result !=  null){
			return result;
		}
		result = new StringBuffer();
		String column = tableColumn.getName();
		column = StringUtils.toCamelCase(column);
		result.append("<label>"+tableColumn.getComments()+"</label>");
		if(TEXTBOX.equals(tableColumn.getCategory()) || TEXTAREA.equals(tableColumn.getCategory())) {
			result.append("<input class=\"easyui-textbox\" id=\"");
			result.append(column);
			result.append("\" name=\"");
			result.append(column);
			result.append("\" data-options=\"");
			if(TEXTAREA.equals(tableColumn.getCategory())) {
				result.append("multiline:true,");
			}
			if(StringConstant.NO.equals(tableColumn.getIsEdit())) {
				result.append("editable:false,");
			}
			if(StringConstant.YES.equals(tableColumn.getIsNull())) {
				result.append("required:true,");
			}
			if(StringUtils.isNoneBlank(tableColumn.getValidType())) {
				result.append("validType:'"+tableColumn.getValidType()+"',");
			}
			if(StringUtils.isNoneBlank(tableColumn.getDefaultValue())) {
				result.append("value:'"+tableColumn.getDefaultValue()+"',");
			}
			if(StringUtils.isNoneBlank(tableColumn.getSettings())) {
				result.append(tableColumn.getSettings());
			}
			result.append("\" "+tableColumn.getHtmlInner());
			result.append("/>");
		}
		if(NUMBERBOX.equals(tableColumn.getCategory())) {
			result.append("<input class=\"easyui-numberbox\" id=\"");
			result.append(column);
			result.append("\" name=\"");
			result.append(column);
			result.append("\" data-options=\"");
			if(StringConstant.NO.equals(tableColumn.getIsEdit())) {
				result.append("editable:false,");
			}
			if(StringConstant.YES.equals(tableColumn.getIsNull())) {
				result.append("required:true,");
			}
			if(StringUtils.isNoneBlank(tableColumn.getValidType())) {
				result.append("validType:'"+tableColumn.getValidType()+"',");
			}
			if(StringUtils.isNoneBlank(tableColumn.getDefaultValue())) {
				result.append("value:'"+tableColumn.getDefaultValue()+"',");
			}
			if(StringUtils.isNoneBlank(tableColumn.getSettings())) {
				result.append(tableColumn.getSettings());
			}
			result.append("\" "+tableColumn.getHtmlInner());
			result.append("/>");
		}
		if(COMBOBOX.equals(tableColumn.getCategory()) || RADIOBOX.equals(tableColumn.getCategory()) || CHECKBOX.equals(tableColumn.getCategory())) {
			result.append("<input class=\"easyui-combobox\" id=\"");
			result.append(column);
			result.append("\" name=\"");
			result.append(column);
			result.append("\" data-options=\"");
			if(StringConstant.NO.equals(tableColumn.getIsEdit())) {
				result.append("editable:false,");
			}
			if(StringConstant.YES.equals(tableColumn.getIsNull())) {
				result.append("required:true,");
			}
			if(StringUtils.isNoneBlank(tableColumn.getValidType())) {
				result.append("validType:'"+tableColumn.getValidType()+"',");
			}
			if(StringUtils.isNoneBlank(tableColumn.getDefaultValue())) {
				result.append("value:'"+tableColumn.getDefaultValue()+"',");
			}
			int dataCount = 0;
			if(StringUtils.isNoneBlank(tableColumn.getSettings())) {
				result.append("valueField: 'value',textField: 'label',");
				if(CHECKBOX.equals(tableColumn.getCategory())) {
					result.append("multiple:true,");
				}
				String settings = tableColumn.getSettings();
				if(settings.indexOf("SQL>") != -1) {
					result.append("data: [");
					String[] settingsArr = settings.split("\\|");
					String sql = settingsArr[0].replace("SQL>", "");
					String value = settingsArr[1];
					String label = settingsArr[2];
					List<Map<Object, Object>> list = DBUtils.executeQuery(sql);
					for(Map<Object, Object> map : list) {
						dataCount++;
						result.append("{value: '"+map.get(value.toUpperCase())+"',label: '"+map.get(label.toUpperCase())+"'},");
					}
					result.substring(0, result.lastIndexOf(",")-1);
					result.append("]");
				} else if(settings.indexOf("DICT>") != -1) {
					result.append("data: [");
					List<Dict> dictList = DictUtils.getDictList(DictUtils.getDict(settings.replace("DICT>", "")).getValue());
					for(Dict dict : dictList) {
						dataCount++;
						result.append("{value: '"+dict.getValue()+"',label: '"+dict.getLabel()+"'},");
					}
					result.substring(0, result.lastIndexOf(",")-1);
					result.append("]");
				} else  {
					result.append("data: [");
					String[] settingsArr = settings.split("\\|");
					for(String set : settingsArr) {
						dataCount++;
						if(set.indexOf(":") == -1) {
							result.append("{label: '"+set+"',value: '"+set+"'},");
						} else {
							String[] setArr = set.split(":");
							result.append("{value: '"+setArr[0]+"',label: '"+setArr[1]+"'},");
						}
					}
					result.substring(0, result.lastIndexOf(",")-1);
					result.append("]");
				}
			}
			if(dataCount <= 5) {
				result.append(",panelHeight:'auto',");
			}
			result.append("\" "+tableColumn.getHtmlInner());
			result.append("/>");
		}
		if(DATEBOX.equals(tableColumn.getCategory())) {
			result.append("<input id=\"");
			result.append(column);
			result.append("\" name=\"");
			result.append(column);
			result.append("\" "+tableColumn.getHtmlInner());
			if(StringUtils.isNoneBlank(tableColumn.getSettings())) {
				result.append(" onClick=\"WdatePicker({");
				result.append(tableColumn.getSettings());
				result.append("})\"");
			} else {
				result.append(" onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})\"");
			}
			result.append("/>");
		}
		if(HTMLDESIGN.equals(tableColumn.getCategory())) {
			result.append("<script id=\"");
			result.append(column);
			result.append("\" name=\"");
			result.append(column);
			result.append("\" type=\"text/plain\">");
			if(StringUtils.isNoneBlank(tableColumn.getDefaultValue())) {
				result.append(tableColumn.getDefaultValue());
			}
			result.append("</script>");
			result.append("<script type=\"text/javascript\">");
			result.append("var ue = UE.getEditor('"+column+"', {autoHeight: false});");
			if(StringUtils.isNoneBlank(tableColumn.getSettings())) {
				result.append("ue.ready(function() {ue.setHeight("+tableColumn.getSettings()+");});");
			}
			result.append("</script>");
		}
		result.append("<span id=\"msg-"+column+"\" class=\"err-msg\"></span>");
		CacheUtils.put(CACHE_COMP+CACHE_SPLIT+CACHE_EASYUI+CACHE_SPLIT+tableColumn.getTableName()+CACHE_SPLIT+tableColumn.getName(), result);
		return result;
	}
	
	public static void removeCache(TableColumn tableColumn) {
		CacheUtils.remove(CACHE_COMP+CACHE_SPLIT+tableColumn.getTableName()+CACHE_SPLIT+tableColumn.getName());
		CacheUtils.remove(CACHE_COMP+CACHE_SPLIT+CACHE_EASYUI+CACHE_SPLIT+tableColumn.getTableName()+CACHE_SPLIT+tableColumn.getName());
	}
}
