package com.seeyoui.kensite.common.util;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.sql.CLOB;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class OracleClobTypeHandler implements TypeHandler {
  
  public Object valueOf(String param) {
    return null;
  }

  @Override
  public Object getResult(ResultSet arg0, String arg1) throws SQLException {
    CLOB clob = (CLOB) arg0.getClob(arg1);
    return (clob == null || clob.length() == 0) ? null : clob.getSubString((long) 1, (int) clob.length());
  }

  @Override
  public Object getResult(CallableStatement arg0, int arg1) throws SQLException {
    return null;
  }

  @Override
  public void setParameter(PreparedStatement arg0, int arg1, Object arg2, JdbcType arg3) throws SQLException {
    CLOB clob = CLOB.empty_lob();
    clob.setString(1, (String) arg2);
    arg0.setClob(arg1, clob);
  }

@Override
public Object getResult(ResultSet arg0, int arg1) throws SQLException {
	// TODO Auto-generated method stub
	return null;
}
}