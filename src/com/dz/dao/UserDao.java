package com.dz.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dz.domain.User;
import com.dz.utils.DBUtil;

//将用户名及密码封装在user类中

public class UserDao {
	static Connection connection = null;
	static PreparedStatement pstmt = null; 
	static ResultSet rs = null; 
	
	// 通过用户账号userName及密码password查询用户，若userName及password都匹配则查询到一条记录，封装在User类中返回，否则返回null。
	public User login(User user) {
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from user where user_name = ? and user_password = ? ";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,user.getUser_name());
			pstmt.setString(2,user.getUser_password());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return user;
			}else {
				return null;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
