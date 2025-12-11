<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String tel = request.getParameter("tel");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobbies");
	String addr = request.getParameter("addr");
	String[] foods = request.getParameterValues("foods");
	String nickname = request.getParameter("nickname");
	String etc = request.getParameter("etc");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>이름 : <%=name %> </li> 
		<li>나이 : <%=age %> </li> 
		<li>전화번호 : <%=tel %> </li> 
		<li>성별 : <%=gender %> </li> 
		<li>취미 : 
			<%
				if(hobbies != null){
					for(int i=0; i<hobbies.length; i++){
						if(hobbies[i].equals("기타")){%>
							<%=etc%> 
						<%}else{%>
							<%=hobbies[i]%>
						<%}
					}
				}else{%>
					없음
				<%}
			%>
		</li> 
		<li>주소 : <%=addr %> </li> 
		<li>좋아하는 음식 : 
			<%
				if(foods != null){
					for(int i=0; i<foods.length; i++){%>
						<%= foods[i]%>
					<%}
				}else{%>
					없음
				<%}
			%>
		</li> 
		<li>별명 : <%=nickname%> </li> 
	</ul>
</body>
</html>