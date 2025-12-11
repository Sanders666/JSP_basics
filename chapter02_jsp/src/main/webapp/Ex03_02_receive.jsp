<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	// name, age, pet, info
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age")); // 전달 받은 객체는 항상 문자열
	String[] pet = request.getParameterValues("pet");
	String info = request.getParameter("info");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 이름, 나이, 반려동물, 자기소개 출력 
		반려동물 : 선택된 동물들 출력. 하나도 선택되지 않으면 "없음" 출력
	-->
	<ul>
		<li>이름 : <%=name %> </li> 
		<li>나이 : <%=age %> </li> 
		<li>반려동물 : 
			<%
				if(pet != null){
					for(int i=0; i<pet.length; i++){%>
						<%= pet[i]%>
					<%}
				}else{%>
					없음
				<%}
			%>
		</li> 
		<li>자기소개 : <%=info%> </li> 
	</ul>
</body>
</html>