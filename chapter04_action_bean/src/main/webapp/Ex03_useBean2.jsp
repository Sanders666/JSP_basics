<%@page import="org.joonzis.bean.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PersonVO vo = new PersonVO();
	vo.setName(request.getParameter("name"));
	vo.setAge(Integer.parseInt(request.getParameter("age")));
	vo.setHeight(Double.parseDouble(request.getParameter("height")));
	vo.setAddr(request.getParameter("addr"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li> 이름 : <%=vo.getName() %> </li>
		<li> 나이 : <%=vo.getAge() %> </li>
		<li> 키 : <%=vo.getHeight() %> </li>
		<li> 주소 : <%=vo.getAddr() %> </li>
	</ul>
</body>
</html>