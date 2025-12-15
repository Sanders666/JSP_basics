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
	<!-- 
		1. JSTL을 이용하여 평균 변수 생성
			(avg, grade)
			
		2. JSTL을 이용하여 합,불 출력
			60이상 합격
			(pass)
		
		3. 출력 데이터
		국어 : 00점
		영어 : 00점
		수학 : 00점
		평균 : 00점
		학점 : A
		합격여부 : 합격
	 -->
	 
	 <c:set var="avg" value="${(param.kor + param.eng + param.mat) / 3}"/>
	 <c:choose>
	 	<c:when test="${avg >= 90}">
	 		<c:set var="grade" value="A"/>
 		</c:when>
	 	<c:when test="${avg >= 80}">
	 		<c:set var="grade" value="B"/>
 		</c:when>
	 	<c:when test="${avg >= 70}">
	 		<c:set var="grade" value="C"/>
 		</c:when>
	 	<c:when test="${avg >= 60}">
	 		<c:set var="grade" value="D"/>
 		</c:when>
 		<c:otherwise>
 			<c:set var="grade" value="F"/>
 		</c:otherwise>
	 </c:choose>
	 
	 <c:if test="${avg >= 60 }">
	 	<c:set var="pass" value="합격"/>
	 </c:if>
	 <c:if test="${avg < 60 }">
	 	<c:set var="pass" value="불합격"/>
	 </c:if>
	 <c:set var="pass" value="${avg >= 60 ? '합격' : '불합격' }"/>
	 
	 <ul>
	 	<li>국어 : ${param.kor} </li>
	 	<li>영어 : ${param.eng} </li>
	 	<li>수학 : ${param.mat} </li>
	 	<li>평균 : ${avg} </li>
	 	<li>학점 : ${grade} </li>
	 	<li>합격여부 : ${pass} </li>
	 </ul>
	 
</body>
</html>






