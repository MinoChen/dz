package com.dz.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dz.domain.User;

import com.dz.dao.UserDao;

//验证登录

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserDao userDao;  
    HttpSession session;
   
    public LoginServlet() {
        super();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao userDao = new UserDao();
		User user = new User();

		user.setUser_name(request.getParameter("user_name"));
		user.setUser_password(request.getParameter("user_password"));
		user = userDao.login(user);
		System.out.println(user);
		
		if (user != null) {
			session = request.getSession();
			if (session.getAttribute("user_name") != null) {
				session.removeAttribute("user_name");
			}
			System.out.println("登录成功！");
			session.setAttribute("user", user);
			System.out.println(session.getAttribute("user"));
			request.getRequestDispatcher("admin/main.jsp").forward(request, response);
			
		}else {
			System.out.println("登录失败！");
			request.setAttribute("msg", "用户名或密码错误!");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}
}
