/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.plugin.skins.domain;  

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.framework.cms.domain.Article;
import com.seeyoui.kensite.common.base.domain.DataEntity;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public class Skins extends DataEntity<Article> {
	private static final long serialVersionUID = 5454155825314635342L;
    
	private String name;
	@Length(min = 6, max = 100)
	private String url;
	private String state;

	public void setName(String name) {
		this.name = name;
	}
    
	public String getName() {
		return this.name;
	}
	public void setUrl(String url) {
		this.url = url;
	}
    
	public String getUrl() {
		return this.url;
	}
	public void setState(String state) {
		this.state = state;
	}
    
	public String getState() {
		return this.state;
	}
}