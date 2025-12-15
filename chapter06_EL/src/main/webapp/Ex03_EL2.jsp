<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : ${param.id} <br>
	
	좋아하는 음식 : <br>
	${paramValues.fav[0]}
	${paramValues.fav[1]}
	${paramValues.fav[2]}
	${paramValues.fav[3]}
	${paramValues.fav[4]}
	
</body>
</html>