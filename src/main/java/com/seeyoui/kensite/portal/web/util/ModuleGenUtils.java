package com.seeyoui.kensite.portal.web.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ModuleGenUtils {
	public static final String TEMPLATE_URL = "\\src\\main\\webapp\\static\\web\\template\\";
	/**
	 * 以行为单位读写文件内容
	 * 
	 * @param filePath
	 */
	public static String genModuleStr(String fileName, String id, String style, String name, String content, String script, String toolTitle, String toolScript, String css) {
		File file = new File(System.getProperty("user.dir") + TEMPLATE_URL + fileName + ".htm");
		// BufferedReader:从字符输入流中读取文本，缓冲各个字符，从而实现字符、数组和行的高效读取。
		BufferedReader bufReader = null;
		try {
			FileInputStream fis = new FileInputStream(System.getProperty("user.dir") + TEMPLATE_URL + fileName + ".htm");
			InputStreamReader isr = new InputStreamReader(fis, "utf-8");  //GBK替换成你文件内容使用的编码
			// FileReader:用来读取字符文件的便捷类。
			bufReader = new BufferedReader(isr);
			String temp = "";
			StringBuffer result = new StringBuffer();
			while ((temp = bufReader.readLine()) != null) {
				temp = temp.replaceAll("MODULE_ID", id);
				temp = temp.replaceAll("MODULE_STYLE", style);
				temp = temp.replaceAll("MODULE_NAME", name);
				temp = temp.replaceAll("MODULE_CONTENT", content);
				temp = temp.replaceAll("MODULE_SCRIPT", script);
				temp = temp.replaceAll("MODULE_TOOL_TITLE", toolTitle);
				temp = temp.replaceAll("MODULE_TOOL_SCRIPT", toolScript);
				temp = temp.replaceAll("MODULE_CSS", css);
				result.append(temp);
			}
			return result.toString();
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			try {
				bufReader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "";
	}
}
