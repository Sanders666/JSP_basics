<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("type");
	// type == "name" or 'name'
			
	session.removeAttribute(type);	// name 속성 삭제
	
	response.sendRedirect("Ex06_01_session.jsp");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>