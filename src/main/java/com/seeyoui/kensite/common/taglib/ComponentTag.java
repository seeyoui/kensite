package com.seeyoui.kensite.common.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.seeyoui.kensite.common.util.StringUtils;

public class ComponentTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	private String tagname;
	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out = this.pageContext.getOut();
			if (StringUtils.isBlank(tagname)) {
				out.println("No UserInfo Found...");
				return SKIP_BODY;
			}
			if("text".equals(tagname)) {
				out.println("<input type='text' id='aaa' name='bbb' value='ccc'/>");
			}
		} catch (Exception e) {
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public void release() {
		super.release();
		this.tagname = null;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}
}