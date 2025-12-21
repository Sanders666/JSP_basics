package org.joonzis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


// 서버에 요청을 보내면 새로운 HTML 화면을 다시 받아와서 전체 페이지가 리로드
// 즉, 서버가 JSP를 응답으로 보낼 때 = 동기 방식
// 역할: 페이지 이동 담당 (return: JSP 경로)
@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String cmd = request.getParameter("cmd");
		if(cmd == null) {	
			cmd = "mainPage";
		}
		String path = "";
		
		switch (cmd) {
			case "mainPage":
				path = "index.jsp";
				break;
			case "myPage":
				path = "member/myPage.jsp";
				break;
			case "loginPage":
				path = "member/loginPage.jsp";
				break;
			case "joinPage":
				path = "member/joinPage.jsp";
				break;
			case "logout":
				HttpSession session = request.getSession();
				session.removeAttribute("member");
				path = "index.jsp";
				break;
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
