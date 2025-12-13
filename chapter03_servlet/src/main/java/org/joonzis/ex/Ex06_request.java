package org.joonzis.ex;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex06_request")
public class Ex06_request extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Ex06_request() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		String eng = request.getParameter("eng");
		String mat = request.getParameter("mat");
		double avg = 	(kor + 
						Integer.parseInt(eng) + 
						Integer.parseInt(mat) ) / 3.0;
		char grade;
		if(avg >= 90) grade = 'A';
		else if(avg >= 80) grade = 'B';
		else if(avg >= 70) grade = 'C';
		else if(avg >= 60) grade = 'D';
		else grade = 'F';
		
		System.out.println("이름 : " + name);
		System.out.println("평균 : " + avg);
		System.out.println("학점 : " + grade);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}








