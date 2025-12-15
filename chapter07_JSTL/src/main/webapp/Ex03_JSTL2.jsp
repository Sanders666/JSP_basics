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
	<c:set var="num1" value="${param.num1 + 0}"/>
	<c:set var="num2" value="${param.num2 + 0}"/>
	
	<h1>EL을 이용하여 큰 수 출력하기 ( 삼항 연산자 )</h1>
	${num1 > num2 ? num1 : num2 }
	
	<h1>JSTL을 이용하여 큰 수 출력하기</h1>
	<c:if test="${num1 gt num2 }">
		${num1}
	</c:if>
	<c:if test="${num1 < num2 }">
		${num2}
	</c:if>
	
	<h1>JSTL을 이용하여 큰 수 출력하기2</h1>
	<c:choose>
		<c:when test="${num1 gt num2 }">
			${num1}
		</c:when>
		<c:otherwise>
			${num2}
		</c:otherwise>
	</c:choose>
	
</body>
</html>