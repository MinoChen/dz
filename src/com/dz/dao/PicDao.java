package com.dz.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dz.domain.PageBean;
import com.dz.domain.Pic;
import com.dz.utils.DBUtil;

public class PicDao {
	
	static Connection connection = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	
	//添加图片
	public void addPic(Pic pic) {
		try {
			connection = DBUtil.getConnection();
			String sql = "insert into pic values(null,?,?,?,?,?,?,?,?)";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, pic.getPic_author());
			pstmt.setString(2, pic.getPic_content());
			pstmt.setInt(3,pic.getPic_sort());
			pstmt.setString(4,pic.getPic_path());
			pstmt.setString(5, pic.getPic_publishStatus());
			pstmt.setString(6, pic.getPic_publishTime());
			pstmt.setString(7, pic.getPic_title());
			pstmt.setInt(8, pic.getCategory_id());
			pstmt.execute();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//根据图片id删除图片
	public void delPic(Pic pic) {
		// 通过获取pic_id获取到要删除的pic_id
		pic = findPicByPic_id(pic.getPic_id());
		//1.删除图片
		(new File("C:\\Upload" + "\\" + pic.getPic_path())).delete();
		//2.删除图片记录
		try {
			connection = DBUtil.getConnection();
			String sql = "delete from pic where pic_id = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, pic.getPic_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			}
		}
	
	//更新图片
	public void updatePic(Pic pic) {
		try {
			connection = DBUtil.getConnection();
			String sql = " update pic set pic_author = ?,pic_content = ?,pic_sort= ?,"
					+ "pic_path = ?,pic_publishStatus = ?,pic_publishTime = ?,pic_title =?,"
					+ "category_id = ? where pic_id = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, pic.getPic_author());
			pstmt.setString(2, pic.getPic_content());
			pstmt.setInt(3, pic.getPic_sort());
			pstmt.setString(4, pic.getPic_path());
			pstmt.setString(5, pic.getPic_publishStatus());
			pstmt.setString(6, pic.getPic_publishTime());
			pstmt.setString(7, pic.getPic_title());
			pstmt.setInt(8, pic.getCategory_id());
			pstmt.setInt(9, pic.getPic_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//找到产品展示
		public List<Pic> findCpzs(){
			try {
				List<Pic> picList = new ArrayList<Pic>();
				connection = DBUtil.getConnection();
				String sql = "select * from pic where category_id = '2' order by pic_publishTime desc";
				pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Pic pic = new Pic();
					pic.setPic_id(rs.getInt("pic_id"));
					pic.setPic_author(rs.getString("pic_author"));
					pic.setPic_content(rs.getString("pic_content"));
					pic.setPic_sort(rs.getInt("pic_sort"));
					pic.setPic_path(rs.getString("pic_path"));
					pic.setPic_publishStatus(rs.getString("pic_publishStatus"));
					pic.setPic_publishTime(rs.getString("pic_publishTime"));
					pic.setPic_title(rs.getString("pic_title"));
					pic.setCategory_id(rs.getInt("category_id"));
					picList.add(pic);
				}
				return picList;
			}catch(SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		
		//找到最新产品
		public List<Pic> findZxcp(){
			try {
				List<Pic> picList = new ArrayList<Pic>();
				connection = DBUtil.getConnection();
				String sql = "select * from pic where category_id = '3' order by pic_publishTime desc";
				pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Pic pic = new Pic();
					pic.setPic_id(rs.getInt("pic_id"));
					pic.setPic_author(rs.getString("pic_author"));
					pic.setPic_content(rs.getString("pic_content"));
					pic.setPic_sort(rs.getInt("pic_sort"));
					pic.setPic_path(rs.getString("pic_path"));
					pic.setPic_publishStatus(rs.getString("pic_publishStatus"));
					pic.setPic_publishTime(rs.getString("pic_publishTime"));
					pic.setPic_title(rs.getString("pic_title"));
					pic.setCategory_id(rs.getInt("category_id"));
					picList.add(pic);
				}
				return picList;
			}catch(SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		
	
	//找到内饰展示
	public List<Pic> findNszs(){
		try {
			List<Pic> picList = new ArrayList<Pic>();
			connection = DBUtil.getConnection();
			String sql = "select * from pic where category_id = '1' order by pic_publishTime desc";
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Pic pic = new Pic();
				pic.setPic_id(rs.getInt("pic_id"));
				pic.setPic_author(rs.getString("pic_author"));
				pic.setPic_content(rs.getString("pic_content"));
				pic.setPic_sort(rs.getInt("pic_sort"));
				pic.setPic_path(rs.getString("pic_path"));
				pic.setPic_publishStatus(rs.getString("pic_publishStatus"));
				pic.setPic_publishTime(rs.getString("pic_publishTime"));
				pic.setPic_title(rs.getString("pic_title"));
				pic.setCategory_id(rs.getInt("category_id"));
				picList.add(pic);
			}
			return picList;
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
		//查找所有图片
		public List<Pic> findAllPic() {
			
			List<Pic> picList = new ArrayList<Pic>();
			try {
				connection = DBUtil.getConnection();
				String sql = "select * from pic";
				pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Pic pic = new Pic();
					pic.setPic_id(rs.getInt("pic_id"));
					picList.add(pic);
				}
				return picList;
			} catch (SQLException e) {
				e.printStackTrace();
				return picList;
			}
		}

		//通过图片id查找图片
		public Pic findPicByPic_id(Integer pic_id) {
			try {
				connection = DBUtil.getConnection();
				String sql = " select * from pic where pic_id = ? ";
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1, pic_id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Pic pic = new Pic();
					pic.setPic_id(rs.getInt("pic_id"));
					pic.setPic_author(rs.getString("pic_author"));
					pic.setPic_content(rs.getString("pic_content"));
					pic.setPic_sort(rs.getInt("pic_sort"));
					pic.setPic_path(rs.getString("pic_path"));
					pic.setPic_publishStatus(rs.getString("pic_publishStatus"));
					pic.setPic_publishTime(rs.getString("pic_publishTime"));
					pic.setPic_title(rs.getString("pic_title"));
					pic.setCategory_id(rs.getInt("category_id"));
					return pic;
				} else {
					return null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		
		//统计图片总数量
		public int getPicCount(Integer pic_id) {
			try {
				connection = DBUtil.getConnection();
				String sql = "select count(*) count from pic where pic_id = ?";
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1,pic_id);
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
		public List<Pic> findByCategory_id(int currentPage, int pageSize, int category_id) {
			try {
				connection = DBUtil.getConnection();
				
				String sql = "select *  from pic where category_id = ? "
						+ "order by pic_publishTime desc "
						+ "limit " + Integer.toString(pageSize) + 
						" offset " + Integer.toString((currentPage - 1) * 10);
				
				pstmt = connection.prepareStatement(sql);
				pstmt.setInt(1, category_id);
				rs = pstmt.executeQuery();
				List<Pic> picList = new ArrayList<Pic>();
				while(rs.next()) {
					Pic pic = new Pic();
					pic.setPic_id(rs.getInt("pic_id"));
					pic.setPic_author(rs.getString("pic_author"));
					pic.setPic_content(rs.getString("pic_content"));
					pic.setPic_sort(rs.getInt("pic_sort"));
					pic.setPic_path(rs.getString("pic_path"));
					pic.setPic_publishStatus(rs.getString("pic_publishStatus"));
					pic.setPic_publishTime(rs.getString("pic_publishTime"));
					pic.setPic_title(rs.getString("pic_title"));
					pic.setCategory_id(rs.getInt("category_id"));
					picList.add(pic);
				}
				return picList;
			}catch(SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		
		//通过种类id找信息
		public PageBean<Pic> findPicByCategory_id(int currentPage,int pageSize,int category_id){
			//求当前类别信息数量
			int count = getPicCount(category_id);//通过category_id获取信息数量
			int totalPage = (int)Math.ceil(count * 1.0 / pageSize);//求总页数(向上取整)
			//求当前页数据集合
			List<Pic> list = findByCategory_id(currentPage, pageSize, category_id);
			//为信息设置类别
			CategoryDao categoryDao = new CategoryDao();
			for (Pic thisPic : list) {
				thisPic.setCategory(categoryDao.findCategoryByCategory_id(thisPic.getCategory_id()));
			}
			PageBean<Pic> pb = new PageBean<Pic>();
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
		public int getRightPicCount(String key) {
			try {
				connection = DBUtil.getConnection();
				String sql = "select count(*) count from pic where pic_content like '%" + key + "%' ";
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
		public List<Pic> searchByKey(int currentPage, int pageSize, String key){
			try {
				List<Pic> picList = new ArrayList<Pic>();
				connection = DBUtil.getConnection();
				String sql = "select *  from pic where pic_content like '%" + key
						+ "%' order by pic_publishTime desc limit " + Integer.toString(pageSize) + " offset "
						+ Integer.toString((currentPage - 1) * 10);
				pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Pic pic = new Pic();
					pic.setPic_id(rs.getInt("pic_id"));
					pic.setPic_author(rs.getString("pic_author"));
					pic.setPic_content(rs.getString("pic_content"));
					pic.setPic_sort(rs.getInt("pic_sort"));
					pic.setPic_path(rs.getString("pic_path"));
					pic.setPic_publishStatus(rs.getString("pic_publishStatus"));
					pic.setPic_publishTime(rs.getString("pic_publishTime"));
					pic.setPic_title(rs.getString("pic_title"));
					pic.setCategory_id(rs.getInt("category_id"));
					picList.add(pic);
				}
				return picList;
			}catch(SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		
		//信息搜索
		public PageBean<Pic> searchPic(int currentPage, int pageSize, String key){
			//求当前符合条件的信息
			int count = getRightPicCount(key); //求信息数量
			int totalPage = (int)Math.ceil(count * 1.0 / pageSize);//求总页数
			//求当前页的数据集合
			List<Pic> list = searchByKey(currentPage, pageSize, key);
			PageBean<Pic> pb = new PageBean<Pic>();
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

		//获取图片数量  
		public int getPicCount(String keywords) {
			try {
				connection = DBUtil.getConnection();
				String sql = "select count(*) count from pic where pic_title like '%" + keywords + "%' ";
				pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
				return rs.getInt("count");
			}catch(SQLException e) {
				e.printStackTrace();
				return 0;
			}
		}
		
		//分页查找图片
		public PageBean<Pic> findPicByPage(int currentPage, int pageSize, String keywords){
			//求当前类别图片数量
			int count = getPicCount(keywords);
			//求总页数
			int totalPage = (int) Math.ceil(count * 1.0 / pageSize);
			//求当前页的数据集合
			List<Pic> picList = new ArrayList<Pic>();
			try {
				connection = DBUtil.getConnection();
				String sql = "select *  from pic where pic_title like '%" + keywords
						+ "%' order by pic_publishTime desc limit " + Integer.toString(pageSize) 
						+ " offset "
						+ Integer.toString((currentPage - 1) * 10);
				pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Pic pic = new Pic();
					pic.setPic_id(rs.getInt("pic_id"));
					pic.setPic_author(rs.getString("pic_author"));
					pic.setPic_content(rs.getString("pic_content"));
					pic.setPic_sort(rs.getInt("pic_sort"));
					pic.setPic_path(rs.getString("pic_path"));
					pic.setPic_publishStatus(rs.getString("pic_publishStatus"));
					pic.setPic_publishTime(rs.getString("pic_publishTime"));
					pic.setPic_title(rs.getString("pic_title"));
					pic.setCategory_id(rs.getInt("category_id"));
					picList.add(pic);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			//为图片设置类别
			CategoryDao categoryDao = new CategoryDao();
			for (Pic thisPic : picList) {
				thisPic.setCategory(categoryDao.findCategoryByCategory_id(thisPic.getCategory_id()));
			}
			//将图片放入PageBean
			PageBean<Pic> pb = new PageBean<Pic>();
			pb.setCount(count);
			pb.setCurrentPage(currentPage);
			pb.setList(picList);
			pb.setPageSize(pageSize);
			pb.setTotalPage(totalPage);
			return pb;
		}
		
	}
