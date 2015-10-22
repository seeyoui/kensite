/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.cms.site.domain;  

import com.seeyoui.kensite.common.base.domain.DataEntity;

/**
 * 站点表
 * @author cuichen
 * @version 1.0
 * @since 1.0
 * @date 2015-10-13
 */
public class Site extends DataEntity<Site> {
	private static final long serialVersionUID = 1L;
    
	private String name;//站点名称
	private String title;//站点标题
	private String logo;//站点Logo
	private String domain;//站点域名
	private String description;//描述
	private String keywords;//关键字
	private String theme;//主题
	private String copyright;//版权信息
	private String customView;//自定义站点首页视图

	public void setName(String name) {
		this.name = name;
	}
    
	public String getName() {
		return this.name;
	}
	public void setTitle(String title) {
		this.title = title;
	}
    
	public String getTitle() {
		return this.title;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
    
	public String getLogo() {
		return this.logo;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
    
	public String getDomain() {
		return this.domain;
	}
	public void setDescription(String description) {
		this.description = description;
	}
    
	public String getDescription() {
		return this.description;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
    
	public String getKeywords() {
		return this.keywords;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
    
	public String getTheme() {
		return this.theme;
	}
	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
    
	public String getCopyright() {
		return this.copyright;
	}
	public void setCustomView(String customView) {
		this.customView = customView;
	}
    
	public String getCustomView() {
		return this.customView;
	}
}