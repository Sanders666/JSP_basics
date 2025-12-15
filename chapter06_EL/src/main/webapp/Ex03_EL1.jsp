<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex03_EL2.jsp">
		<h1>좋아하는 음식 선택</h1>
		<p>아이디 : <input type="text" name="id"></p>
		<input type="checkbox" name="fav" value="한식">한식
		<input type="checkbox" name="fav" value="중식">중식
		<input type="checkbox" name="fav" value="일식">일식
		<input type="checkbox" name="fav" value="양식">양식
		<input type="checkbox" name="fav" value="기타">기타 <br>
		<input type="submit" value="전송">
	</form>
</body>
</html>