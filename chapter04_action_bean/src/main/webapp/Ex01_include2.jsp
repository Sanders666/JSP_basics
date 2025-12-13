<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>include2.jsp 페이지</h1>
	<div>
		이름 : <%=name %> <br>
		나이 : <%=age %> <br>
		주소 : <%=addr %> <br>
	</div>
</body>
</html>