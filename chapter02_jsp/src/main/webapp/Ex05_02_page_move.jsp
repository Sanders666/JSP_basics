<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); //POST 방식 → 설정 반드시 필요, GET 방식 → 자동
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>페이지 이동 중간 페이지</h1>
	<div>이름 = <%=name %></div>
	<div>나이 = <%=age %></div>
	
	<br> <hr> <br>
	
	<!-- 1. <a> 태그로 이동하기 -->
	<!-- 파라미터 전달 x -->
	<a href="Ex05_03_page_move.jsp">파라미터x</a>
	<!-- 파라미터 전달 o -->
	<a href="Ex05_03_page_move.jsp?name=<%=name%>&age=<%=age%>">파라미터o</a>
	
	<br> <hr> <br>
	
	<!-- 2. location.href로 이동하기 -->
	<button onclick="location.href='Ex05_03_page_move.jsp'">파라미터 x</button>
	<button onclick="location.href='Ex05_03_page_move.jsp?name=<%=name%>&age=<%=age%>'">파라미터 o</button>
	
	<br> <hr> <br>
	
	
	<!-- 3. 포워드 -->
	<% 
		/*request
			.getRequestDispatcher("Ex05_03_page_move.jsp")
			.forward(request, response);*/
	%>
	
	<!-- 4. 리다이렉트 -->
	<%
		//response.sendRedirect("Ex05_03_page_move.jsp");
	%>
	
</body>
</html>