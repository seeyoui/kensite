package com.seeyoui.kensite.sqlGeneration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class DBConnection {
    public static Connection oracleConn(String name, String pass) {
       Connection c = null;
       try {
           Class.forName("oracle.jdbc.driver.OracleDriver");
           // 要是导入驱动没有成功的话都是会出现classnotfoundException.自己看看是不是哪里错了,例如classpath这些设置
       } catch (ClassNotFoundException e) {
           e.printStackTrace();
       }
       try {
           c = DriverManager.getConnection(
                  "jdbc:oracle:thin:@123.56.224.66:1521:orcl", name, pass);
           // 连接数据的方法有四种, 这个属于最简单的,一般用网页程序
           // "jdbc:oracle:thin:@计算机名称:监听端口:系统实例名", username, password,
           // 计算机名称,要是自己不知道可以在计算机属性查知.
           // 监听端口一般默认是1521, 要是改变了就看自己的监听文件listener.ora
           // 系统实例名一般是默认orcl, 要是不是的话就用 select name from v$database; 看看当前的实例名.
           // username,password,就是登陆数据库的用户名和密码.
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return c;
    }
}