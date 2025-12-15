<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:set var="animals" value="사자,호랑이;코끼리^기린"/>
	
	<h1>분리된 동물 목록</h1>
	
	<c:forTokens items="${animals}" delims=",;^" var="animal">
		${animal} <br>
	</c:forTokens>
</body>
</html>