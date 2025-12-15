<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex06_JSTL2.jsp">
		<h3>일반 forEach 연습</h3>
		<p>최소 크기 <input type="number" name="num1" min="1" max="7"></p>
		<p>최대 크기 <input type="number" name="num2" min="1" max="7"></p>
		<hr>
		<h3>향상 forEach 연습</h3>
		<input type="checkbox" name="foods" value="한식">한식
		<input type="checkbox" name="foods" value="중식">중식
		<input type="checkbox" name="foods" value="일식">일식
		<input type="checkbox" name="foods" value="양식">양식
		<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>