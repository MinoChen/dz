package com.dz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.dz.domain.Category;
import com.dz.utils.DBUtil;


public class CategoryDao {
	
	static Connection connection = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
	//查找所有种类
	public List<Category> findAllCategory() {
		
		List<Category> categoryList = new ArrayList<Category>();
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from category";
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Category category = new Category();
				category.setCategory_id(rs.getInt("category_id"));
				category.setCategory_name(rs.getString("category_name"));
				categoryList.add(category);
			}
			return categoryList;
		} catch (SQLException e) {
			e.printStackTrace();
			return categoryList;
		}
	}
	
	//增加种类
	public boolean addCategory(Category category) {
		try {
			connection = DBUtil.getConnection();
			String sql = "insert into category(Category_id,Category_name) values(?,?)";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,category.getCategory_id());
			pstmt.setString(2, category.getCategory_name());
			pstmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//删除种类
	public boolean delCategory(Category category) {
		try {
			connection = DBUtil.getConnection();
			String sql = " delete from category where category_id = ? ";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, category.getCategory_id());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//通过种类id查找种类
	public Category findCategoryByCategory_id(Integer category_id) {
		try {
			connection = DBUtil.getConnection();
			String sql = " select * from category where category_id = ? ";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, category_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Category category = new Category();
				category.setCategory_id(rs.getInt("category_id"));
				category.setCategory_name(rs.getString("category_name"));
				return category;
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//更新种类
	public boolean updateCategory(Category category) {
		try {
			connection = DBUtil.getConnection();
			String sql = " update category set category_name = ? where category_id = ? ";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, category.getCategory_name());
			pstmt.setInt(2, category.getCategory_id());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//按种类id升序排列查找所有种类(查找导航种类)
	public List<Category> findNaviCategory() {
		List<Category> categoryList = new ArrayList<Category>();
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from category";
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Category category = new Category();
				category.setCategory_id(rs.getInt("category_id"));
				category.setCategory_name(rs.getString("category_name"));
				categoryList.add(category);
			}
			return categoryList;
		} catch (SQLException e) {
			e.printStackTrace();
			return categoryList;
		}
	}
}
