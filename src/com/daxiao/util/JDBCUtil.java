package com.daxiao.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public class JDBCUtil {
	//private static Logger logger = Logger.getLogger(JDBCUtil.class);
	private static final String jdbcDriver = PropertiesUtil.getInstance().prop.getProperty("jdbc.driver");
	private static final String jdbcUrl = PropertiesUtil.getInstance().prop.getProperty("jdbc.url");
	private static final String jdbcUserName = PropertiesUtil.getInstance().prop.getProperty("jdbc.username");
	private static final String jdbcPwd = PropertiesUtil.getInstance().prop.getProperty("jdbc.pwd");
	private static Connection conn = null;
	
	//初始化JDBCUtil 
	private JDBCUtil()  
	{  
	}  
	static {
		
		try {
			//载驱动
			
				Class.forName(jdbcDriver).newInstance();
				
			
			}catch (InstantiationException e) {
			
			e.printStackTrace();
			} catch (IllegalAccessException e) {
			
			e.printStackTrace();
			} catch (ClassNotFoundException e) {
				//logger.error("ClassNotFoundException",e);
				System.out.println("ClassNotFoundException");
			e.printStackTrace();
			} 
	}
	
	//获取连接实例
	public static Connection getConnection() throws SQLException{
	    return DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPwd);
	}
	
	//关闭jdbc连接
	public static void close() 
	{
		if(conn !=null)
		{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) throws SQLException {
		Connection conn = null;
		conn = JDBCUtil.getConnection();
		System.out.println(conn);
		if( conn != null)
		{
			conn.close();
		}
		
	}
	
}
