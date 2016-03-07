package com.seeyoui.kensite.common.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.web.util.HtmlUtils;

public class DBUtils {
	private static DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	

	public static Connection getConnection() throws Exception {
		Connection conn=null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			throw e;
		}
		return conn;
	}
	
	public static void close(Connection con, Statement stm, ResultSet rst) throws Exception {
		try {
			if(rst != null) {
				rst.close();
			}
			if(stm != null) {
				stm.close();
			}
			if(con != null) {
				con.close();
			}
		} catch (SQLException e) {
			throw e;
		}
	}
	
	public static String getString(String sql, String columnName) throws Exception {
		Connection con = getConnection();
		Statement stm = null;
		ResultSet rst = null;
		String result = "";
		try {
			stm = con.createStatement();
			rst = stm.executeQuery(sql);
			if(rst.next()) {
				result = rst.getString(columnName);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			close(con, stm, rst);
		}
		return result;
	}
	
	public static List<Map<Object, Object>> executeQuery(String sql) throws Exception {
		Connection con = getConnection();
		Statement stm = null;
		ResultSet rst = null;
		List<Map<Object, Object>> result = null;
		try {
			stm = con.createStatement();
			rst = stm.executeQuery(sql);
			result = getResultMapList(rst);
		} catch (Exception e) {
			throw e;
		} finally {
			close(con, stm, rst);
		}
		return result;
	}
	
	public static String getString(Connection con, String sql, String columnName) throws Exception {
		Statement stm = null;
		ResultSet rst = null;
		String result = "";
		try {
			stm = con.createStatement();
			rst = stm.executeQuery(sql);
			if(rst.next()) {
				result = rst.getString(columnName);
			}
		} catch (Exception e) {
			throw e;
		} finally {
			close(con, stm, rst);
		}
		return result;
	}
	
	public static List<Map<Object, Object>> executeQuery(Connection con, String sql) throws Exception {
		Statement stm = null;
		ResultSet rst = null;
		List<Map<Object, Object>> result = null;
		try {
			stm = con.createStatement();
			rst = stm.executeQuery(sql);
			result = getResultMapList(rst);
		} catch (Exception e) {
			throw e;
		} finally {
			close(con, stm, rst);
		}
		return result;
	}
	
	public static List<Map<Object, Object>> getResultMapList(ResultSet rst) throws Exception {
		// 获取列数  
		ResultSetMetaData metaData = null;
		int columnCount = 0;
		metaData = rst.getMetaData();
		columnCount = metaData.getColumnCount();
		List<Map<Object, Object>> list = new ArrayList<Map<Object,Object>>();
		while (rst.next()) {
	        Map<Object, Object> map = new HashMap<Object, Object>();
	        // 遍历每一列  
	        for (int i = 1; i <= columnCount; i++) {
	            String columnName =metaData.getColumnLabel(i);
	            String value = rst.getString(columnName);
	            map.put(columnName.toUpperCase(), HtmlUtils.htmlUnescape(value));
	        }
	        list.add(map);
	    }
		return list;
	}
}