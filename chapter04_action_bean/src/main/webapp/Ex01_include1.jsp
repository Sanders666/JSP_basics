<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include Example</title>
</head>
<body>
	<h1>include1.jsp 페이지</h1>
	
	<br> <hr> <br>
	
	<!-- include1.jsp 페이지에 include2.jsp 페이지를 포함 -->

	<!-- 1. include 지시어 (정적 include) -->
	<%@ include file="Ex01_include2.jsp" %>
	<!-- 지시어 뒤에는 HTML 주석 OK, 줄 바꿔야 오류 없음 -->

	<!-- 2. include 액션 태그 (동적 include) -->
	<!-- jsp:include 내부에는 오직 jsp:param만 허용 -->
	<!-- jsp:param으로 key, value값을 request 객체에 담음  -->
	<jsp:include page="Ex01_include2.jsp">
		<jsp:param name="name" value="김씨"/>
		<jsp:param name="age" value="20"/>
		<jsp:param name="addr" value="서울"/>
	</jsp:include>

</body>
</html>
