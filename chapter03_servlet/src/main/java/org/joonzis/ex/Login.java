package org.joonzis.ex;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Login() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// jsp에서는 기본 객체로, 그냥 사용할 수 있으나,
		// java에서는 request 객체로부터 받아와서 사용해야 한다.
		HttpSession session = request.getSession();
		
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		
		response.sendRedirect(
				"/chapter03_servlet/login/showUserInfo.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}





