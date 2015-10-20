<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#function getJavaType column>
<#assign dbtype=column.sqlTypeName?lower_case>
<#assign colname=column.columnName?lower_case>
<#assign rtn>
<#if dbtype=="number" >
	<#if column.decimalDigits==0>
	String
	<#else>
	String
	</#if>
<#elseif (dbtype=="varchar2"||dbtype=="char"||dbtype=="nvarchar2")  >
String
<#elseif (dbtype=="clob")  >
String
<#elseif (dbtype=="date")>
java.util.Date
</#if>
</#assign>
<#return rtn?trim>
</#function>

package ${basepackage}.${innerpackage}.${table.classNameFirstLower}.domain;  

import com.seeyoui.kensite.common.base.domain.DataEntity;

<#include "/java_imports.include">

public class ${className} extends DataEntity<${className}> {
	private static final long serialVersionUID = 1L;
    
    <#list table.columns as column>
    <#if (column.columnName?lower_case=="id"||column.columnName?lower_case=="createuser"||column.columnName?lower_case=="createdate"||column.columnName?lower_case=="updateuser"||column.columnName?lower_case=="updatedate"||column.columnName?lower_case=="remarks"||column.columnName?lower_case=="delflag") ><#else>
	private ${getJavaType(column)} ${column.columnNameLower};//${column.columnAlias}
    </#if>
    </#list>

    <#list table.columns as column>
    <#if (column.columnName?lower_case=="id"||column.columnName?lower_case=="createuser"||column.columnName?lower_case=="createdate"||column.columnName?lower_case=="updateuser"||column.columnName?lower_case=="updatedate"||column.columnName?lower_case=="remarks"||column.columnName?lower_case=="delflag") ><#else>
	public void set${column.columnName}(${getJavaType(column)} ${column.columnNameLower}) {
		this.${column.columnNameLower} = ${column.columnNameLower};
	}
    
	public ${getJavaType(column)} get${column.columnName}() {
		return this.${column.columnNameLower};
	}
    </#if>
    </#list>
}