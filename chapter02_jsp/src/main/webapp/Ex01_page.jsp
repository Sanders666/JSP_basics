<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>오늘은</h2>
	<% Calendar cal = Calendar.getInstance(); %>
	<%= cal.get(Calendar.YEAR) %>년
	<%= cal.get(Calendar.MONTH)+1 %>월
	<%= cal.get(Calendar.DATE) %>일
	<%
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH시 mm분 ss초");
	%>
	<%= sdf.format(today) %>
	<h2>입니다.</h2>
</body>
</html>