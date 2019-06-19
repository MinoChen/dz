package com.dz.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dz.dao.CategoryDao;
import com.dz.domain.Category;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Category category = new Category();
	CategoryDao categoryDao = new CategoryDao();
	
    public CategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		
		switch(method) {
		case "findAllCategory":{
			findAllCategory(request,response);
			break;
		}case"addCategory":{
			addCategory(request,response);
			break;
		}case"delCategory":{
			delCategory(request,response);
			break;
		}case"editCategory":{
			editCategory(request,response);
			break;
		}case"updateCategory":{
			updateCategory(request,response);
		}case"findNaviCategory":{
			findNaviCategory(request,response);
			break;
		}
		
		}
	}

	//编辑信息类别
	private void editCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		category = categoryDao.findCategoryByCategory_id(Integer.parseInt(request.getParameter("category_id")));
		request.setAttribute("category", category);
		request.getRequestDispatcher("/admin/category/edit.jsp").forward(request, response);
	}

	//查找导航信息类别
	private void findNaviCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> categoryList = categoryDao.findNaviCategory();
		request.setAttribute("categoryList", categoryList);
	}

	//更新信息类别
	private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		category.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		category.setCategory_name(request.getParameter("category_name"));
		categoryDao.updateCategory(category);
		List<Category> list = categoryDao.findAllCategory();//调用findAllCategory方法重新查询所有信息类别
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/category/list.jsp").forward(request, response);
	}

	//删除信息类别
	private void delCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		category.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		categoryDao.delCategory(category);
		List<Category> list = categoryDao.findAllCategory();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/category/list.jsp").forward(request, response);
	}

	//增加信息类别
	private void addCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		category.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		category.setCategory_name(request.getParameter("category_name"));
		List<Category> list = categoryDao.findAllCategory();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/category/list.jsp").forward(request, response);
	}

	//查找所有信息类别
	private void findAllCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> list = categoryDao.findAllCategory();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/category/list.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
