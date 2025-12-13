package org.joonzis.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex03_servlet")
public class Ex03_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex03_servlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// jsp에서는 기본 객체이므로 객체 생성 없이 사용 가능
		// 자바에서는 객체 생성 후 사용 가능
		PrintWriter out = response.getWriter();
		
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		String msg = y + "년 " + m + "월 " + d + "일";
		out.print(msg + "<br>");
		
		//-------------------------------------------
		
		// request가 가지고 있는 기본 정보
		String url = request.getRemoteAddr();
		String host = request.getRemoteHost();
		String user = request.getRemoteUser();
		int port = request.getRemotePort();
		
		out.print("요청 주소 : " + url + "<br>");
		out.print("요청 호스트 : " + host + "<br>");
		out.print("요청 사용자 : " + user + "<br>");
		out.print("요청 포트 : " + port + "<br>");
		
		
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}



