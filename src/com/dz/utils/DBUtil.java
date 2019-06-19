package com.dz.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//连接MySQL数据库

public class DBUtil {
	static final String DRIVERCLASSNAME = "com.mysql.cj.jdbc.Driver";
	static final String URL = "jdbc:mysql://127.0.0.1/dz?characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
	static final String USER = "root";
	static final String PASSWORD = "root";
	//数据库连接对象
	static Connection connection = null;
	
	static {
		try {
		Class.forName(DRIVERCLASSNAME);
		System.out.println("加载数据库驱动成功！");
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("加载数据库驱动失败！");
		}
	}
	//获取数据库连接对象
	public static Connection getConnection() throws SQLException {
		if(connection==null) {
			connection=DriverManager.getConnection(URL,USER,PASSWORD);
			return connection;
		}
		return connection;
	}
}
