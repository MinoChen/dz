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
import com.dz.dao.PicDao;
import com.dz.domain.Category;
import com.dz.domain.PageBean;
import com.dz.domain.Pic;
import com.dz.utils.TimeUtil;

@WebServlet("/PicServlet")
public class PicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PicServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		switch(method) {
		case"findPicByPage":{
			findPicByPage(request,response);
			break;
		}
		case"addPic":{
			addPic(request,response);
			break;
		}
		case"delPic":{
			delPic(request,response);
			break;
		}
		case"addPicPage":{
			addPicPage(request,response);
			break;
		}
		case"editPic":{
			editPic(request,response);
			break;
		}
		case"getImg":{
			getImg(request,response);
			break;
		}
		case"updatePic":{
			updatePic(request,response);
			break;
		}
		case"findPic":{
			findPic(request,response);
			break;
		}
		case "findPicByCategory_id": {
			findPicByCategory_id(request, response);
			break;
		}
		case "findPicByPic_id": {
			findPicByPic_id(request, response);
			break;
		}
		case "searchPic": {
			searchPic(request, response);
			break;
		}
		}
	}

	private int pageSize = 100;	//默认每页显示条数

	private void editPic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PicDao picDao = new PicDao();
		CategoryDao categoryDao = new CategoryDao();
		Pic pic = new Pic();
		
		pic = picDao.findPicByPic_id(Integer.parseInt(request.getParameter("pic_id")));
		request.setAttribute("pic", pic);
		
		List<Category> categorylist = categoryDao.findAllCategory();
		request.setAttribute("categorylist", categorylist);
		
		request.getRequestDispatcher("/admin/pic/edit.jsp").forward(request, response);
		
	}

	private void delPic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PicDao picDao = new PicDao();
		Pic pic = new Pic();
		pic.setPic_id(Integer.parseInt(request.getParameter("pic_id")));
		
		picDao.delPic(pic);
		
		PageBean<Pic> pb = picDao.findPicByPage(1, pageSize, "");
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/admin/pic/list.jsp").forward(request, response);
		
	}

	private void searchPic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("key");
		key = new String(key.getBytes("ISO-8859-1"),"UTF-8");
		PicDao picDao = new PicDao();
		PageBean<Pic> pb = picDao.searchPic(Integer.parseInt(request.getParameter("currentPage")), pageSize, key);
		request.setAttribute("pb", pb);
		request.setAttribute("key", key);
		request.getRequestDispatcher(" ").forward(request, response);
		
	}

	private void findPicByPic_id(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PicDao picDao = new PicDao();

		Pic pic = picDao.findPicByPic_id(Integer.parseInt(request.getParameter("pic_id")));
		request.setAttribute("pic", pic);
		int category_id = pic.getCategory_id();
		
		CategoryDao categoryDao = new CategoryDao();
		Category category = categoryDao.findCategoryByCategory_id(category_id);
		request.setAttribute("category", category);
		
		request.getRequestDispatcher("/picdetail.jsp").forward(request, response);
		
	}

	private void findPicByCategory_id(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PicDao picDao = new PicDao();
		PageBean<Pic> pb = picDao.findPicByCategory_id(Integer.parseInt(request.getParameter("currentPage")),pageSize, Integer.parseInt(request.getParameter("category_id")));
		request.setAttribute("pb", pb);
		
		CategoryDao categoryDao = new CategoryDao();
		Category category = categoryDao.findCategoryByCategory_id(Integer.parseInt(request.getParameter("category_id")));
		request.setAttribute("category", category);
		
		request.getRequestDispatcher("/piclist.jsp").forward(request, response);
		
	}

	private void findPic(HttpServletRequest request, HttpServletResponse response) {
		PicDao picDao = new PicDao();
		/*
		 * 找到最新产品
		 */
		List<Pic> ZxcpPic = picDao.findZxcp();
		request.setAttribute("ZxcpPic", ZxcpPic);
		/*
		 * 找到产品展示
		 */
		List<Pic> CpzsPic = picDao.findCpzs();
		request.setAttribute("CpzsPic", CpzsPic );
		/*
		 * 内饰展示
		 */
		List<Pic> NszsPic = picDao.findNszs();
		request.setAttribute("NszsPic", NszsPic);
		
		
	}

	private void updatePic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PicDao picDao = new PicDao();
		Pic pic = new Pic();
		
		pic.setPic_id(Integer.parseInt(request.getParameter("pic_id")));
		pic.setPic_author(request.getParameter("pic_author"));
		pic.setPic_title(request.getParameter("pic_title"));
		pic.setPic_content(request.getParameter("pic_content"));
		pic.setPic_publishStatus(request.getParameter("pic_publishStatus"));
		pic.setPic_sort(Integer.parseInt(request.getParameter("pic_sort")));
		pic.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		
		picDao.updatePic(pic);
		PageBean<Pic> pb = picDao.findPicByPage(1, pageSize, "");
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/admin/pic/list.jsp").forward(request, response);
		
	}

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

	private void addPicPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao categoryDao = new CategoryDao();
		List<Category> list = categoryDao.findAllCategory();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/pic/add.jsp").forward(request, response);
		
	}

	private void addPic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PicDao picDao = new PicDao();
		Pic pic = new Pic();
		//创建一个DiskFileItemFactory工厂
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		//创建一个文件上传解析器
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
		//设置最大可支持的文件大小10MB
		servletFileUpload.setFileSizeMax(1024*1024*10);
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
					case "pic_title": {
						pic.setPic_title(fileItem.getString("utf-8"));
						break;
					}
					case "category_id": {
						pic.setCategory_id(Integer.parseInt(fileItem.getString("utf-8")));
						break;
					}
					case "pic_author": {
						pic.setPic_author(fileItem.getString("utf-8"));
						break;
					}
					case "pic_content": {
						pic.setPic_content(fileItem.getString("utf-8"));
						break;
					}
					case "pic_sort": {
						pic.setPic_sort(Integer.parseInt(fileItem.getString("utf-8")));
						break;
					}
					case "pic_publishStatus": {
						pic.setPic_publishStatus(fileItem.getString("utf-8"));
						break;
					}
					}
				} 
				//若是文件域
				else {
					//获得真实路径
					String path = "C:\\Upload";
					String fileName = fileItem.getName();
					long sizeInBytes = fileItem.getSize();
					if (sizeInBytes != 0) {
						InputStream inputStream = fileItem.getInputStream();
						byte[] buffer = new byte[1024];
						int lenth = 0;
						String filePath = path;// 文件最终上传的位置
						pic.setPic_path(fileName);
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
		pic.setPic_publishTime(TimeUtil.getDate());
		picDao.addPic(pic);
		PageBean<Pic> pb = picDao.findPicByPage(1, pageSize, "");
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/admin/pic/list.jsp").forward(request, response);
		
	}

	private void findPicByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PicDao picDao = new PicDao();
		String keywords = request.getParameter("keywords");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		if (keywords != null) {
			keywords = keywords.trim();
		} else {
			keywords = "";
		}
		PageBean<Pic> pb = picDao.findPicByPage(currentPage, pageSize, keywords);
		request.setAttribute("pb", pb);
		request.setAttribute("keywords", keywords);
		request.getRequestDispatcher("/admin/pic/list.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
