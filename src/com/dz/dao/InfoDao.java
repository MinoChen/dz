package com.dz.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dz.domain.Info;
import com.dz.domain.PageBean;
import com.dz.utils.DBUtil;

public class InfoDao {
	
	static Connection connection = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
	//添加信息
	public void addInfo(Info info) {
		try {
			connection = DBUtil.getConnection();
			String sql = "insert into info values(null,?,?,?,?,?,?,?,?)";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, info.getInfo_author());
			pstmt.setString(2, info.getInfo_content());
			pstmt.setInt(3, info.getInfo_sort());
			pstmt.setString(4, info.getInfo_picPath());
			pstmt.setString(5, info.getInfo_publishStatus());
			pstmt.setString(6, info.getInfo_publishTime());
			pstmt.setString(7, info.getInfo_title());
			pstmt.setInt(8, info.getCategory_id());
			pstmt.execute();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//根据info_id删除信息
	public void delInfo(Info info) {
		// 通过获取info_id获取到要删除的info
		info = findInfoByInfo_id(info.getInfo_id());
		//1.删除图片
		(new File("C:\\Upload" + "\\" + info.getInfo_picPath())).delete();
		//2.删除信息记录
		try {
			connection = DBUtil.getConnection();
			String sql = "delete from info where info_id = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, info.getInfo_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//通过info_id找到info
	public Info findInfoByInfo_id(Integer info_id) {
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from info where info_id = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, info_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Info info = new Info();
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_author(rs.getString("info_author"));
				info.setInfo_title(rs.getString("info_title"));
				info.setInfo_content(rs.getString("info_content"));
				info.setInfo_picPath(rs.getString("info_picPath"));
				info.setInfo_publishTime(rs.getString("info_publishTime"));
				info.setInfo_publishStatus(rs.getString("info_publishStatus"));
				info.setInfo_sort(rs.getInt("info_sort"));
				info.setCategory_id(rs.getInt("category_id"));
				return info;
			}else {
					return null;
				}
			}catch(SQLException e) {
				e.printStackTrace();
				return null;
			}
	}
	
	//更新信息
	public void updateInfo(Info info) {
		try {
			connection = DBUtil.getConnection();
			String sql = "update info set info_author=? , info_title=?"
					+ ", info_content=?, info_publishStatus=?, "
					+ "info_sort=? , category_id=?  where info_id =? ";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, info.getInfo_author());
			pstmt.setString(2, info.getInfo_title());
			pstmt.setString(3, info.getInfo_content());
			pstmt.setString(4, info.getInfo_publishStatus());
			pstmt.setInt(5, info.getInfo_sort());
			pstmt.setInt(6, info.getCategory_id());
			pstmt.setInt(7, info.getInfo_id());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//找到行业知识
	public List<Info> findHyzsInfo(){
		try {
			List<Info> infoList = new ArrayList<Info>();
			connection = DBUtil.getConnection();
			String sql = "select * from info where category_id = '6' order by info_publishTime desc";
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_author(rs.getString("info_author"));
				info.setInfo_title(rs.getString("info_title"));
				info.setInfo_content(rs.getString("info_content"));
				info.setInfo_picPath(rs.getString("info_picPath"));
				info.setInfo_publishTime(rs.getString("info_publishTime"));
				info.setInfo_publishStatus(rs.getString("info_publishStatus"));
				info.setInfo_sort(rs.getInt("info_sort"));
				info.setCategory_id(rs.getInt("category_id"));
				//把info添加进info_list中
				infoList.add(info);
			}
			return infoList;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//找到新闻资讯
	public List<Info> findXwzxInfo(){
		try {
			List<Info> infoList = new ArrayList<Info>();
			connection = DBUtil.getConnection();
			String sql = "select * from info where category_id = '4' order by info_publishTime desc";
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_author(rs.getString("info_author"));
				info.setInfo_title(rs.getString("info_title"));
				info.setInfo_content(rs.getString("info_content"));
				info.setInfo_picPath(rs.getString("info_picPath"));
				info.setInfo_publishTime(rs.getString("info_publishTime"));
				info.setInfo_publishStatus(rs.getString("info_publishStatus"));
				info.setInfo_sort(rs.getInt("info_sort"));
				info.setCategory_id(rs.getInt("category_id"));
				//把info添加进info_list中
				infoList.add(info);
			}
			return infoList;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//找到关于我们
	public List<Info> findGywmInfo(){
		try {
			List<Info> infoList = new ArrayList<Info>();
			connection = DBUtil.getConnection();
			String sql = "select * from info where category_id = '8' order by info_publishTime desc";
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_author(rs.getString("info_author"));
				info.setInfo_title(rs.getString("info_title"));
				info.setInfo_content(rs.getString("info_content"));
				info.setInfo_picPath(rs.getString("info_picPath"));
				info.setInfo_publishTime(rs.getString("info_publishTime"));
				info.setInfo_publishStatus(rs.getString("info_publishStatus"));
				info.setInfo_sort(rs.getInt("info_sort"));
				info.setCategory_id(rs.getInt("category_id"));
				//把info添加进info_list中
				infoList.add(info);
			}
			return infoList;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//统计信息总数量
	public int getInfoCount(Integer category_id) {
		try {
			connection = DBUtil.getConnection();
			String sql = "select count(*) count from info where category_id = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,category_id);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt("count");
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/*
	 * 分页查询开始
	 * offset是偏移量，limit是每页可显示数据条数
	 * 从第offset+1条记录开始查，每页显示limit条数据
	 */
	
	//通过种类id进行查找的方法
	public List<Info> findByCategory_id(int currentPage, int pageSize, int category_id) {
		try {
			connection = DBUtil.getConnection();
			
			String sql = "select *  from info where category_id = ? "
					+ "order by info_publishTime desc "
					+ "limit " + Integer.toString(pageSize) + 
					" offset " + Integer.toString((currentPage - 1) * 10);
			
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, category_id);
			rs = pstmt.executeQuery();
			List<Info> infoList = new ArrayList<Info>();
			while(rs.next()) {
				Info info = new Info();
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_author(rs.getString("info_author"));
				info.setInfo_title(rs.getString("info_title"));
				info.setInfo_content(rs.getString("info_content"));
				info.setInfo_picPath(rs.getString("info_picPath"));
				info.setInfo_publishTime(rs.getString("info_publishTime"));
				info.setInfo_publishStatus(rs.getString("info_publishStatus"));
				info.setInfo_sort(rs.getInt("info_sort"));
				info.setCategory_id(rs.getInt("category_id"));
				infoList.add(info);
			}
			return infoList;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//通过种类id找信息
	public PageBean<Info> findInfoByCategory_id(int currentPage,int pageSize,int category_id){
		//求当前类别信息数量
		int count = getInfoCount(category_id);//通过category_id获取信息数量
		int totalPage = (int)Math.ceil(count * 1.0 / pageSize);//求总页数(向上取整)
		//求当前页数据集合
		List<Info> list = findByCategory_id(currentPage, pageSize, category_id);
		//为信息设置类别
		CategoryDao categoryDao = new CategoryDao();
		for (Info thisInfo : list) {
			thisInfo.setCategory(categoryDao.findCategoryByCategory_id(thisInfo.getCategory_id()));
		}
		PageBean<Info> pb = new PageBean<Info>();
		pb.setCount(count);
		if (currentPage == 0) {
			currentPage = 1;
		}
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}
	
	//获取准确的信息数量(搜索关键字)
	public int getRightInfoCount(String key) {
		try {
			connection = DBUtil.getConnection();
			String sql = "select count(*) count from info where info_content like '%" + key + "%' ";
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt("count");
		}catch(SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//通过关键字进行搜索
	public List<Info> searchByKey(int currentPage, int pageSize, String key){
		try {
			List<Info> infoList = new ArrayList<Info>();
			connection = DBUtil.getConnection();
			String sql = "select *  from info where info_content like '%" + key
					+ "%' order by info_publishTime desc limit " + Integer.toString(pageSize) + " offset "
					+ Integer.toString((currentPage - 1) * 10);
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_author(rs.getString("info_author"));
				info.setInfo_title(rs.getString("info_title"));
				info.setInfo_content(rs.getString("info_content"));
				info.setInfo_picPath(rs.getString("info_picPath"));
				info.setInfo_publishTime(rs.getString("info_publishTime"));
				info.setInfo_publishStatus(rs.getString("info_publishStatus"));
				info.setInfo_sort(rs.getInt("info_sort"));
				info.setCategory_id(rs.getInt("category_id"));
				infoList.add(info);
			}
			return infoList;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//信息搜索
	public PageBean<Info> searchInfo(int currentPage, int pageSize, String key){
		//求当前符合条件的信息
		int count = getRightInfoCount(key); //求信息数量
		int totalPage = (int)Math.ceil(count * 1.0 / pageSize);//求总页数
		//求当前页的数据集合
		List<Info> list = searchByKey(currentPage, pageSize, key);
		PageBean<Info> pb = new PageBean<Info>();
		pb.setCount(count);
		if (currentPage == 0) {
			currentPage = 1;
		}
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}

	//获取信息数量
	public int getInfoCount(String keywords) {
		try {
			connection = DBUtil.getConnection();
			String sql = "select count(*) count from info where info_title like '%" + keywords + "%' ";
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt("count");
		}catch(SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	//分页查找信息
	public PageBean<Info> findInfoByPage(int currentPage, int pageSize, String keywords){
		//求当前类别信息数量
		int count = getInfoCount(keywords);
		//求总页数
		int totalPage = (int) Math.ceil(count * 1.0 / pageSize);
		//求当前页的数据集合
		List<Info> infoList = new ArrayList<Info>();
		try {
			connection = DBUtil.getConnection();
			String sql = "select *  from info where info_title like '%" + keywords
					+ "%' order by info_publishTime desc limit " + Integer.toString(pageSize) + " offset "
					+ Integer.toString((currentPage - 1) * 10);
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Info info = new Info();
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_author(rs.getString("info_author"));
				info.setInfo_title(rs.getString("info_title"));
				info.setInfo_content(rs.getString("info_content"));
				info.setInfo_picPath(rs.getString("info_picPath"));
				info.setInfo_publishTime(rs.getString("info_publishTime"));
				info.setInfo_publishStatus(rs.getString("info_publishStatus"));
				info.setInfo_sort(rs.getInt("info_sort"));
				info.setCategory_id(rs.getInt("category_id"));
				infoList.add(info);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		//为信息设置类别
		CategoryDao categoryDao = new CategoryDao();
		for (Info thisInfo : infoList) {
			thisInfo.setCategory(categoryDao.findCategoryByCategory_id(thisInfo.getCategory_id()));
		}
		//将信息放入PageBean
		PageBean<Info> pb = new PageBean<Info>();
		pb.setCount(count);
		pb.setCurrentPage(currentPage);
		pb.setList(infoList);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}
}
