package com.seeyoui.kensite.common.constants;

import java.util.HashMap;
import java.util.LinkedHashMap;

/**
 * 文件名：StringConstant<br>
 * 
 * 说明：字符串常量类 <br>
 * 
 */
public final class StringConstant {
	private StringConstant(){}
	
	//登陆账号的缓存
	public static final String ACCOUNT_CACHE = "account_cache";
	
	//树形结构的根节点编号
	public static final String ROOT_ID = "00000000000000000000000000000000";
	
	//报表查询SQL的预设前后SQL片段
	public static final String FONT_SQL = "SELECT FUSIONCHART.CHARTID,FUSIONCHART.CATEGORIESID,FUSIONCHART.CATEGORYID,FUSIONCHART.CATEGORYLABEL,FUSIONCHART.DATASETID,FUSIONCHART.SERIESNAME,FUSIONCHART.DATAID,FUSIONCHART.DATAVALUE FROM (";
	public static final String BEHIND_SQL = ") FUSIONCHART ORDER BY FUSIONCHART.CATEGORYID,FUSIONCHART.DATAID";
	
	//数据库建模创建表名的前缀
	public static final String TABLE_PREFIX = "BO_";
	
	//初始化密码
	public static final String INIT_PASSWORD = "123456";
	
	//字符串表示布尔值
	public static final String TRUE = "T";
	public static final String FALSE = "F";
	
	//操作完成后（保存或者修改），统一跳转的页面
	public static final String ACTION_DONE = "share/done";
	
	//jsp表单模板存放路径
	public static final String TEMPLAT_JSP_URL = "/WebContent/WEB-INF/view/templat/jsp/";
	//jsp表单模板后缀
	public static final String TEMPLAT_JSP_SUFFIX = ".jsp";
	
	//性别
	public static final String MALE = "M";
	public static final String FEMALE = "F";

	//在职状态
	public static final String STATE_OUT_OFFICE = "0";
	public static final String STATE_IN_OFFICE = "1";
	public static final String STATE_RETIRE = "2";
	
	//使用状态
	public static final String STATE_DISABLE = "0";
	public static final String STATE_ENABLE = "1";
	
	//关联状态
	public static final String STATE_UNRELATED = "0";
	public static final String STATE_RELATED = "1";
	
	//支付方式
	public static final String STATE_CASH="M";//现金付款
	public static final String STATE_CARD="C";//刷卡付款
	public static final String STATE_NET="N";//网上在线付款
	
	//客户端类型
	public static final String APP = "app";//app
	public static final String WSC = "wsc";//微商城
	
	//年龄分组
	public static final String AGE_GROUP_CHILD="C";//幼年
	public static final String AGE_GROUP_JUVENILE="J";//少年
	public static final String AGE_GROUP_YOUTH="L";//青年 为了排序方便,选择L
	public static final String AGE_GROUP_MIDDLE="M";//中年
	public static final String AGE_GROUP_OLD="O";//老年
	
	//消息阅读状态
	public static final String READ_SATUS_READ="READ";//已读
	public static final String READ_SATUS_UNREAD="UNREAD";//未读
	
	public static final HashMap<String, String> NULLABLE = new LinkedHashMap<String, String>();
	
	public static final HashMap<String, String> DELETE_FLAG = new LinkedHashMap<String, String>();

	public static final HashMap<String, String> SEX_RADIO = new LinkedHashMap<String, String>();
	
	public static final HashMap<String, String> USER_STATE = new LinkedHashMap<String, String>();
	
	public static final HashMap<String, String> ACCOUNT_STATE = new LinkedHashMap<String, String>();
	
	public static final HashMap<String, String> ACCOUNT_ROLE_STATE = new LinkedHashMap<String, String>();
	
	static {
		NULLABLE.put(TRUE, "是");
		NULLABLE.put(FALSE, "否");
		
		DELETE_FLAG.put(FALSE, "启用");
		DELETE_FLAG.put(TRUE, "禁用");

		SEX_RADIO.put(MALE, "男");
		SEX_RADIO.put(FEMALE, "女");
		
		USER_STATE.put(STATE_IN_OFFICE, "在职");
		USER_STATE.put(STATE_OUT_OFFICE, "离职");
		USER_STATE.put(STATE_RETIRE, "退休");
		
		ACCOUNT_STATE.put(STATE_ENABLE, "启用");
		ACCOUNT_STATE.put(STATE_DISABLE, "禁用");
		
		ACCOUNT_ROLE_STATE.put(STATE_RELATED, "已关联");
		ACCOUNT_ROLE_STATE.put(STATE_UNRELATED, "未关联");
		
	}
	public static final String LOCATION_URL = "http://ip.taobao.com/service/getIpInfo.php";
	public static final String LOCATION_PARAM = "ip=";
	
	public static final String WEB_URL = "http://61.177.151.154/milk";
	// 与开发模式接口配置信息中的Token保持一致
	public static final String TOKEN = "weixinCourse";
}