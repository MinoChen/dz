package com.dz.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dz.domain.User;



@WebFilter("/admin/*")

public class LoginFilter implements Filter {

    public LoginFilter() {
    }

    @Override
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/*
		 * 1. 从session中获取用户信息 
		 * 2. 判断如题session中存在用户信息，放行！ 
		 * 3. 否则，保存错误信息，转发到login.jsp显示
		 */
		HttpServletRequest request1 = (HttpServletRequest) request;
		HttpServletResponse response1 = (HttpServletResponse) response;
		HttpSession session = request1.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			chain.doFilter(request1, response1);// 放行！
		} else {
			session.setAttribute("msg", "请先登录！");
			PrintWriter out = response.getWriter();
			out.print("<script language=javascript>");
			out.print("top.location.href='" + request1.getContextPath() + "/login.jsp'");
			out.print("</script>");
		}
	}
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
