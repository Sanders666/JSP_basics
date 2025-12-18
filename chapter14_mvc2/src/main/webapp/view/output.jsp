<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>1. request 확인</h1>
		<ul>
			<li>이름 : ${name}</li>
			<li>나이 : ${age}</li>
			<li>번호 : ${phone}</li>
			<li>주소 : ${addr}</li>
			<li>자기소개 : ${self}</li>
		</ul>	
		<h1>2. session 확인</h1>
		<ul>
			<li>이름 : ${sessionScope.name}</li>
			<li>나이 : ${sessionScope.age}</li>
			<li>번호 : ${sessionScope.phone}</li>
			<li>주소 : ${sessionScope.addr}</li>
			<li>자기소개 : ${sessionScope.self}</li>
		</ul>	
		<h1>3. vo 확인</h1>
		<ul>
			<li>이름 : ${vo.name}</li>
			<li>나이 : ${vo.age}</li>
			<li>번호 : ${vo.phone}</li>
			<li>주소 : ${vo.addr}</li>
			<li>자기소개 : ${vo.self}</li>
		</ul>	
		<h1>4. map 확인</h1>
		<ul>
			<li>이름 : ${map.name}</li>
			<li>나이 : ${map.age}</li>
			<li>번호 : ${map.phone}</li>
			<li>주소 : ${map.addr}</li>
			<li>자기소개 : ${map.self}</li>
		</ul>	
	</div>
</body>
</html>