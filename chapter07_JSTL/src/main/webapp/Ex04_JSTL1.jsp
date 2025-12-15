<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		성적 입력 화면(form)
		국어 : kor
		영어 : eng
		수학 : mat
		action : Ex04_JSTL2.jsp
	 -->	
	 <form action="Ex04_JSTL2.jsp">
	 	<p>국어 : <input type="text" name="kor"> </p>
	 	<p>영어 : <input type="text" name="eng"> </p>
	 	<p>수학 : <input type="text" name="mat"> </p>
	 	<input type="submit" value="전송">
	 </form>
</body>
</html>