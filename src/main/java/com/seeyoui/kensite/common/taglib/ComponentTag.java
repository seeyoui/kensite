package com.seeyoui.kensite.common.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.beans.factory.annotation.Autowired;

import com.seeyoui.kensite.common.constants.StringConstant;
import com.seeyoui.kensite.common.util.SpringContextHolder;
import com.seeyoui.kensite.common.util.StringUtils;
import com.seeyoui.kensite.framework.mod.tableColumn.domain.TableColumn;
import com.seeyoui.kensite.framework.mod.tableColumn.persistence.TableColumnMapper;
import com.seeyoui.kensite.framework.mod.tableColumn.service.TableColumnService;
import com.seeyoui.kensite.framework.system.persistence.SysUserMapper;

public class ComponentTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	private static final String TEXTBOX = "textbox";
	private static final String NUMBERBOX = "numberbox";
	private static final String COMBOBOX = "combobox";
	private static final String RADIO = "radio";
	private static final String CHECKBOX = "checkbox";
	private static final String DATETIMEBOX = "datetimebox";
	private static final String CLOBBOX = "clobbox";
	private static final String TEXTAREA = "textarea";
	private static final String COMBOTREE = "combotree";
	private static final String COMBOGRID = "combogrid";
	
	private String table;
	private String column;
	
	private static TableColumnMapper sysUserMapper = SpringContextHolder.getBean(TableColumnMapper.class);
	
	@Override
	public int doStartTag() throws JspException {
		//如果返回SKIP_BODY则忽略标签之中的内容，如果返回EVAL_BODY_INCLUDE则将标签体的内容进行输出
		try {
			TableColumn tableColumn = new TableColumn();
			tableColumn.setTableName(table);
			tableColumn.setName(column);
			tableColumn = sysUserMapper.findTableColumn(tableColumn);
			if (StringUtils.isBlank(tableColumn.getId())) {
				return SKIP_BODY;
			}
			JspWriter out = this.pageContext.getOut();
			StringBuffer result = new StringBuffer();
			if(TEXTBOX.equals(tableColumn.getCategory())) {
				result.append("<input class=\"easyui-textbox\" id=\"");
				result.append(column);
				result.append("\" name=\"");
				result.append(column);
				result.append("\" data-options=\"");
				if(StringConstant.YES.equals(tableColumn.getIsNull())) {
					result.append("required:true,");
				}
				if(StringUtils.isNoneBlank(tableColumn.getValidType())) {
					result.append("validType:'"+tableColumn.getValidType()+"',");
				}
				if(StringUtils.isNoneBlank(tableColumn.getDefaultValue())) {
					result.append("value:'"+tableColumn.getDefaultValue()+"',");
				}
				result.append("\" "+tableColumn.getSettings());
				result.append("/>");
			}
			out.println(result.toString());
		} catch (Exception e) {
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		//返回SKIP_PAGE跳过整个jsp页面后面的输出，返回EVAL_PAGE执行页面余下部分
		//返回EVAL_BODY_AGAIN那么将重新执行此方法
		return EVAL_PAGE;
	}

	@Override
	public void release() {
		super.release();
		this.table = null;
		this.column = null;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public void setColumn(String column) {
		this.column = column;
	}
	
}