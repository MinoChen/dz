package com.dz.servlet;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dz.dao.CategoryDao;
import com.dz.dao.InfoDao;
import com.dz.domain.Category;
import com.dz.domain.Info;
import com.dz.domain.PageBean;
import com.dz.utils.TimeUtil;


@WebServlet("/InfoServlet")
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InfoServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		switch(method) {
		case "findInfoByPage": {
			findInfoByPage(request, response);
			break;
		}
		case "addInfo": {
			addInfo(request, response);
			break;
		}
		case "delInfo": {
			delInfo(request, response);
			break;
		}
		case "addInfoPage": {
			addInfoPage(request, response);
			break;
		}
		case "editInfo": {
			editInfo(request, response);
			break;
		}
		case "getImg": {
			getImg(request, response);
			break;
		}
		case "updateInfo": {
			updateInfo(request, response);
			break;
		}
		case "findInfo": {
			findInfo(request, response);
			break;
		}
		case "findInfoByCategory_id": {
			findInfoByCategory_id(request, response);
			break;
		}
		case "findInfoByInfo_id": {
			findInfoByInfo_id(request, response);
			break;
		}
		case "searchInfo": {
			searchInfo(request, response);
			break;
		}
	}
}

	private int pageSize = 10;	//默认每页显示条数

	//分页查找信息
	private void findInfoByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfoDao infoDao = new InfoDao();
		String keywords = request.getParameter("keywords");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		if (keywords != null) {
			keywords = keywords.trim();
		} else {
			keywords = "";
		}
		PageBean<Info> pb = infoDao.findInfoByPage(currentPage, pageSize, keywords);
		request.setAttribute("pb", pb);
		request.setAttribute("keywords", keywords);
		request.getRequestDispatcher("/admin/info/list.jsp").forward(request, response);
	}
	
	//分页添加信息
	private void addInfoPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao categoryDao = new CategoryDao();
		List<Category> list = categoryDao.findAllCategory();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/info/add.jsp").forward(request, response);
	}

	//查找信息
	private void findInfo(HttpServletRequest request, HttpServletResponse response) {
		InfoDao infoDao = new InfoDao();
		/*
		 * 找到新闻资讯
		 */
		List<Info> XwzxInfo = infoDao.findXwzxInfo();
		request.setAttribute("XwzxInfo", XwzxInfo);
		/*
		 * 找到行业知识
		 */
		List<Info> HyzsInfo = infoDao.findHyzsInfo();
		request.setAttribute("HyzsInfo", HyzsInfo);
		/*
		 * 找到关于我们
		 */
		List<Info> GywmInfo = infoDao.findGywmInfo();
		request.setAttribute("GywmInfo", GywmInfo );
	}

	//搜索信息
	private void searchInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("key");
		key = new String(key.getBytes("ISO-8859-1"),"UTF-8");
		InfoDao infoDao = new InfoDao();
		PageBean<Info> pb = infoDao.searchInfo(Integer.parseInt(request.getParameter("currentPage")), pageSize, key);
		request.setAttribute("pb", pb);
		request.setAttribute("key", key);
		request.getRequestDispatcher("searchinfolist.jsp").forward(request, response);
	}

	//通过信息id查找信息
	private void findInfoByInfo_id(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfoDao infoDao = new InfoDao();

		Info info = infoDao.findInfoByInfo_id(Integer.parseInt(request.getParameter("info_id")));
		request.setAttribute("info", info);
		int category_id = info.getCategory_id();
		
		CategoryDao categoryDao = new CategoryDao();
		Category category = categoryDao.findCategoryByCategory_id(category_id);
		request.setAttribute("category", category);
		
		request.getRequestDispatcher("/detail.jsp").forward(request, response);
	}

	//通过种类id查找信息
	private void findInfoByCategory_id(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfoDao infoDao = new InfoDao();
		PageBean<Info> pb = infoDao.findInfoByCategory_id(Integer.parseInt(request.getParameter("currentPage")),100, Integer.parseInt(request.getParameter("category_id")));
		request.setAttribute("pb", pb);
		
		CategoryDao categoryDao = new CategoryDao();
		Category category = categoryDao.findCategoryByCategory_id(Integer.parseInt(request.getParameter("category_id")));
		request.setAttribute("category", category);
		
		request.getRequestDispatcher("/infolist.jsp").forward(request, response);
		
	}

	//更新信息
	private void updateInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfoDao infoDao = new InfoDao();
		Info info = new Info();
		
		info.setInfo_id(Integer.parseInt(request.getParameter("info_id")));
		info.setInfo_author(request.getParameter("info_author"));
		info.setInfo_title(request.getParameter("info_title"));
		info.setInfo_content(request.getParameter("info_content"));
		info.setInfo_publishStatus(request.getParameter("info_publishStatus"));
		info.setInfo_sort(Integer.parseInt(request.getParameter("info_sort")));
		info.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		
		infoDao.updateInfo(info);
		PageBean<Info> pb = infoDao.findInfoByPage(1, pageSize, "");
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/admin/info/list.jsp").forward(request, response);
		
	}

	//获取图片
	private void getImg(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String imgName = request.getParameter("imgName");
		imgName = new String(imgName.getBytes("ISO-8859-1"),"UTF-8");
		String path = "C:\\Upload";
		FileInputStream fileInputStream = null;
		try {
			fileInputStream = new FileInputStream(path +"\\"+ imgName);
		} catch (FileNotFoundException e) {
			try {
				String path2 = request.getServletContext().getRealPath("upload");
				fileInputStream = new FileInputStream(path2 + "\\" + "404.jpg");
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			}
		}
		try {
			int i;
			i = fileInputStream.available();
			byte[] buff = new byte[i];
			fileInputStream.read(buff);
			fileInputStream.close();
			response.setContentType("image/*");
			OutputStream outputStream = response.getOutputStream();
			outputStream.write(buff);
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	//编辑信息
	private void editInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfoDao infoDao = new InfoDao();
		CategoryDao categoryDao = new CategoryDao();
		Info info = new Info();
		
		info = infoDao.findInfoByInfo_id(Integer.parseInt(request.getParameter("info_id")));
		request.setAttribute("info", info);
		
		List<Category> categorylist = categoryDao.findAllCategory();
		request.setAttribute("categorylist", categorylist);
		
		request.getRequestDispatcher("/admin/info/edit.jsp").forward(request, response);
		
	}

	//删除信息
	private void delInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfoDao infoDao = new InfoDao();
		Info info = new Info();
		info.setInfo_id(Integer.parseInt(request.getParameter("info_id")));
		
		infoDao.delInfo(info);
		
		PageBean<Info> pb = infoDao.findInfoByPage(1, pageSize, "");
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/admin/info/list.jsp").forward(request, response);
		
	}

	//添加信息
	private void addInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InfoDao infoDao = new InfoDao();
		Info info = new Info();
		//创建一个DiskFileItemFactory工厂
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		//创建一个文件上传解析器
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
		//设置最大可支持上传的单个文件大小10MB
		servletFileUpload.setFileSizeMax(1024*1024*10);
		//设置可支持上传的总文件大小30MB
		servletFileUpload.setSizeMax(1024*1024*30);
		//解决上传文件名的中文乱码
		servletFileUpload.setHeaderEncoding("UTF-8");
		try {
			//得到FileItem的集合fileItems
			List<FileItem> fileItems = servletFileUpload.parseRequest(request);
			//遍历fileItems
			for (FileItem fileItem : fileItems) {
				//判断是否为表单域
				if (fileItem.isFormField()) {
					switch (fileItem.getFieldName()) {
					case "info_title": {
						info.setInfo_title(fileItem.getString("utf-8"));
						break;
					}
					case "category_id": {
						info.setCategory_id(Integer.parseInt(fileItem.getString("utf-8")));
						break;
					}
					case "info_author": {
						info.setInfo_author(fileItem.getString("utf-8"));
						break;
					}
					case "info_content": {
						info.setInfo_content(fileItem.getString("utf-8"));
						break;
					}
					case "info_sort": {
						info.setInfo_sort(Integer.parseInt(fileItem.getString("utf-8")));
						break;
					}
					case "info_publishStatus": {
						info.setInfo_publishStatus(fileItem.getString("utf-8"));
						break;
					}
					}
				} 
				//若是文件域
				else {
					//获取真实路径
					String path = "C:\\Upload";
					String fileName = fileItem.getName();
					long fileSize = fileItem.getSize();
					if (fileSize != 0) {
						InputStream inputStream = fileItem.getInputStream();
						byte[] buffer = new byte[1024];
						int lenth = 0;
						String filePath = path;//文件最终上传的位置
						info.setInfo_picPath(fileName);
						OutputStream outputStream = new FileOutputStream(filePath+"\\"+fileName);
						while ((lenth = inputStream.read(buffer)) != -1) {
							outputStream.write(buffer, 0, lenth);
						}
						outputStream.close();
						inputStream.close();
					} else {
						System.out.println("此条信息不包含图片！");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		info.setInfo_publishTime(TimeUtil.getDate());
		infoDao.addInfo(info);
		PageBean<Info> pb = infoDao.findInfoByPage(1, pageSize, "");
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/admin/info/list.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
