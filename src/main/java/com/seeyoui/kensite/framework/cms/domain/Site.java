/*
 * Powered By cuichen
 * Since 2014 - 2015
 */
package com.seeyoui.kensite.framework.cms.domain;  

import com.seeyoui.kensite.common.base.domain.DataEntity;
import com.seeyoui.kensite.common.base.domain.Pager;

/**
 * @author cuichen
 * @version 1.0
 * @since 1.0
 */
public class Site extends DataEntity<Link> {
    private static final long serialVersionUID = 5454155825314635342L;
      
    //编号
    private String id;
    //站点名称
    private String name;
    //站点标题
    private String title;
    //站点Logo
    private String logo;
    //站点域名
    private String domain;
    //描述
    private String description;
    //关键字
    private String keywords;
    //主题
    private String theme;
    //版权信息
    private String copyright;
    //自定义站点首页视图
    private String customview;
    //创建者
    private String createuser;
    //创建时间
    private java.util.Date createdate;
    //更新者
    private String updateuser;
    //更新时间
    private java.util.Date updatedate;
    //备注信息
    private String remarks;
    //删除标记
    private String delflag;
 
    public void setId(String id) {
        this.id = id;
    }
    
    public String getId() {
        return this.id;
    }
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
    public void setCustomview(String customview) {
        this.customview = customview;
    }
    
    public String getCustomview() {
        return this.customview;
    }
    public void setCreateuser(String createuser) {
        this.createuser = createuser;
    }
    
    public String getCreateuser() {
        return this.createuser;
    }
    public void setCreatedate(java.util.Date createdate) {
        this.createdate = createdate;
    }
    
    public java.util.Date getCreatedate() {
        return this.createdate;
    }
    public void setUpdateuser(String updateuser) {
        this.updateuser = updateuser;
    }
    
    public String getUpdateuser() {
        return this.updateuser;
    }
    public void setUpdatedate(java.util.Date updatedate) {
        this.updatedate = updatedate;
    }
    
    public java.util.Date getUpdatedate() {
        return this.updatedate;
    }
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    public String getRemarks() {
        return this.remarks;
    }
    public void setDelflag(String delflag) {
        this.delflag = delflag;
    }
    
    public String getDelflag() {
        return this.delflag;
    }
}