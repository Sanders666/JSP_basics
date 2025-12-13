package org.joonzis.ex;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex05_request")
public class Ex05_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex05_request() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobbies");
		
		System.out.println("아이디 : " + id);
		System.out.println("비밀번호 : " + pw);
		System.out.println("이름 : " + name);
		System.out.println("이메일 : " + email);
		System.out.println("성별 : " + gender);
		System.out.println("취미 : " + Arrays.toString(hobbies));
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}








