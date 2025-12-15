<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1. 기본 forEach 사용 예제 
		최소 값, 최대 값, 최소 값~최대 값 화면에 출력
		최소, 최대 값을 변수 저장
	-->
	<c:choose>
		<c:when test="${param.num1 > param.num2}">
			<c:set var="start" value="${param.num2}"/>
			<c:set var="end" value="${param.num1}"/>
		</c:when>
		<c:otherwise>
			<c:set var="start" value="${param.num1}"/>
			<c:set var="end" value="${param.num2}"/>
		</c:otherwise>
	</c:choose>
	
	<!-- num1, num2 전달 받는데.. 대체 뭐가 더 작고 크냐 -->
	<c:forEach var="i" begin="${start}" end="${end}" step="1">
		${i} <br>
	</c:forEach>
	
	
	<!-- 2. 향상 forEach를 이용하여 음식 종류들 출력 -->
	<c:forEach var="food" items="${paramValues.foods}">
		${food } <br>
	</c:forEach>
</body>
</html>