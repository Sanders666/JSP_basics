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
	<h1>페이지 이동 마지막 페이지</h1>
	<div>이름 = <%=name %></div>
	<div>나이 = <%=age %></div>
</body>
</html>