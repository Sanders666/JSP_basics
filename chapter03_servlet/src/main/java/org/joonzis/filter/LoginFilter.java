package org.joonzis.filter;

import java.io.IOException;

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

@WebFilter("/private/*")
public class LoginFilter implements Filter{
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("로그인 필터 동작 확인....");
		
		// 1. 로그인 된 클라이언트인지 확인
		// HttpSession 필요 => HttpServletSession 필요
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
		
		if(id != null && pw != null) {
			chain.doFilter(request, response);
		}else {
			HttpServletResponse rep =
					(HttpServletResponse)response;
			String cPath = req.getContextPath();
			rep.sendRedirect(cPath + "/login/loginForm.jsp");
		}
		
	}
	@Override
	public void destroy() {
	}
}




