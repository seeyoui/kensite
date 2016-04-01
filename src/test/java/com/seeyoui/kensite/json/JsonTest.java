package com.seeyoui.kensite.json;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.util.HtmlUtils;

import com.seeyoui.kensite.common.util.MD5;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonTest {
	public static void main(String[] args) {
//		String mapperStr = "{\"total\":2,\"rows\":[{\"field\":\"user_name\",\"title\":\"帐号\",\"width\":\"100\",\"fieldTo\":\"userName\"},{\"field\":\"name\",\"title\":\"姓名\",\"width\":\"150\",\"fieldTo\":\"name\"}]}";
//		JSONObject jsonobject = JSONObject.fromObject(mapperStr);
//		try {
//			// 获取一个json数组
//			JSONArray array = jsonobject.getJSONArray("rows");
//			for (int i = 0; i < array.size(); i++) {
//				JSONObject object = (JSONObject)array.get(i);
//				System.out.println(object.get("field"));
//			}
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
		
		
//		String sqlStr = "{\"total\":2,\"rows\":[{\"field\":\"user_name\",\"title\":\"帐号\",\"width\":\"100\",\"fieldTo\":\"userName\"},{\"field\":\"name\",\"title\":\"姓名\",\"width\":\"150\",\"fieldTo\":\"name\"},{\"field\":\"state\",\"title\":\"状态\",\"width\":\"50\",\"fieldTo\":\"stateTree\"},{\"field\":\"publishDate\",\"title\":\"日期\",\"width\":\"50\",\"fieldTo\":\"publishDate\"}]}";
//		System.out.println(URLEncoder.encode(sqlStr));
		
		
		System.out.println(MD5.md5("wangli1234567"));
		System.out.println(MD5.md5("wangli123456"));
	}
}
