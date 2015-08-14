<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
package ${basepackage}.${innerpackage}.${table.classNameFirstLower}.service;  
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seeyoui.kensite.common.base.service.BaseService;

import java.util.*;

import ${basepackage}.common.base.domain.EasyUIDataGrid;
import ${basepackage}.common.base.service.BaseService;
import ${basepackage}.common.exception.CRUDException;
import ${basepackage}.common.util.*;
import ${basepackage}.common.constants.StringConstant;
import ${basepackage}.${innerpackage}.${table.classNameFirstLower}.domain.${className};
import ${basepackage}.${innerpackage}.${table.classNameFirstLower}.persistence.${className}Mapper;
import com.seeyoui.kensite.framework.act.idgenerator.GeneratorUUID;

<#include "/java_imports.include">

@Service
public class ${className}Service extends BaseService {
	
	@Autowired
	private ${className}Mapper ${classNameLower}Mapper;

	/**
	 * 根据ID查询单条数据
	 * @param id
	 * @return
	 * @throws CRUDException
	 */
	public ${className} find${className}ById(String id) throws CRUDException{
		return ${classNameLower}Mapper.find${className}ById(id);
	}
	
	/**
	 * 查询数据集合
	 * @param ${classNameLower}
	 * @return
	 * @throws CRUDException
	 */
	public List<${className}> find${className}List(${className} ${classNameLower}) throws CRUDException {
		return ${classNameLower}Mapper.find${className}List(${classNameLower});
	}
	
	/**
	 * 查询所有数据集合
	 * @param ${classNameLower}
	 * @return
	 * @throws CRUDException
	 */
	public List<${className}> findAll${className}List(${className} ${classNameLower}) throws CRUDException {
		return ${classNameLower}Mapper.findAll${className}List(${classNameLower});
	}
	
	/**
	 * 查询数据总数
	 * @param ${classNameLower}
	 * @return
	 * @throws CRUDException
	 */
	public EasyUIDataGrid find${className}ListTotal(${className} ${classNameLower}) throws CRUDException {
		return ${classNameLower}Mapper.find${className}ListTotal(${classNameLower});
	}
	
	/**
	 * 查询数据总数
	 * @param ${classNameLower}
	 * @return
	 * @throws CRUDException
	 */
	public int find${className}Total(${className} ${classNameLower}) throws CRUDException {
		return ${classNameLower}Mapper.find${className}Total(${classNameLower});
	}
	
	/**
	 * 数据新增
	 * @param ${classNameLower}
	 * @throws CRUDException
	 */
	public void save${className}(${className} ${classNameLower}) throws CRUDException{
		${classNameLower}.preInsert();
		${classNameLower}Mapper.save${className}(${classNameLower});
	}
	
	/**
	 * 数据修改
	 * @param ${classNameLower}
	 * @throws CRUDException
	 */
	public void update${className}(${className} ${classNameLower}) throws CRUDException{
		${classNameLower}.preUpdate();
		${classNameLower}Mapper.update${className}(${classNameLower});			
	}
	
	/**
	 * 数据删除
	 * @param listId
	 * @throws CRUDException
	 */
	public void delete${className}(List<String> listId) throws CRUDException {
		${classNameLower}Mapper.delete${className}(listId);
	}
	
}