package org.joonzis.ex;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿 실행
// 호스트이름:포트번호/프로젝트이름/서블릿
// 호스트이름:포트번호/ContextPath/URLMapping
// URLMapping의 기본 값은 서블릿 이름이다.
// 서블릿 이름 = 본명, URLMapping = 별명

// ex) localhost:8080/chapter03_servlet/Ex01_servlet

@WebServlet("/Ex01_servlet")
public class Ex01_servlet extends HttpServlet {
	// Serializable 인터페이스를 구현하게 되면 노란색 warning 발생
	// 직렬화에서 사용하는 고유 아이디로, 선언하지 않으면 JVM에서 자동 생성 및 대입
	// 그래서 선언하지 않아도 동작에 문제 없다.
	private static final long serialVersionUID = 1L;
	
	// 생성자
    public Ex01_servlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
