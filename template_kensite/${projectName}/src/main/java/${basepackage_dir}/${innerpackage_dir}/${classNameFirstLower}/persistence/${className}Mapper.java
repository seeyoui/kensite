<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>

package ${basepackage}.${innerpackage}.${table.classNameFirstLower}.persistence;  

import ${basepackage}.common.base.domain.EasyUIDataGrid;
import ${basepackage}.${innerpackage}.${table.classNameFirstLower}.domain.${className};
import java.util.*;

<#include "/java_imports.include">

public interface ${className}Mapper {

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 */
	public ${className} find${className}ById(String id);
	
	/**
	 * 查询数据集合
	 * @param ${classNameLower}
	 * @return
	 */
	public List<${className}> find${className}List(${className} ${classNameLower});
	
	/**
	 * 查询所有数据集合
	 * @param ${classNameLower}
	 * @return
	 */
	public List<${className}> findAll${className}List(${className} ${classNameLower});
	
	/**
	 * 查询数据总数
	 * @param ${classNameLower}
	 * @return
	 */
	public EasyUIDataGrid find${className}ListTotal(${className} ${classNameLower});
	
	/**
	 * 查询数据总数
	 * @param ${classNameLower}
	 * @return
	 */
	public int find${className}Total(${className} ${classNameLower});
	
	/**
	 * 数据新增
	 * @param ${classNameLower}
	 */
	public void save${className}(${className} ${classNameLower});
	
	/**
	 * 数据修改
	 * @param ${classNameLower}
	 */
	public void update${className}(${className} ${classNameLower});
	
	/**
	 * 数据删除
	 * @param listId
	 */
	public void delete${className}(List<String> listId);
}