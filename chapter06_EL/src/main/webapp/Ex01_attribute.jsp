<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1~100 값의 총 합 출력
	int total = 0;
	for(int i=1; i<=100; i++){
		total += i;
	}
	pageContext.setAttribute("TOTAL", total);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1~100 사이의 모든 정수의 합은 <%=total %></h1>
	<h1>1~100 사이의 모든 정수의 합은 <%=pageContext.getAttribute("TOTAL")%></h1>
	<h1>1~100 사이의 모든 정수의 합은 ${TOTAL}</h1>
</body>
</html>