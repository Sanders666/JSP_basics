<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;
	Cookie[] cookieBox = request.getCookies();
	if(cookieBox != null && cookieBox.length > 0){
		for(int i=0; i<cookieBox.length; i++){
			if(cookieBox[i].getName().equals("save_id")){
				id = cookieBox[i].getValue();
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex05_id_check2.jsp">
		<%if(id == null){%>
			아이디 : <input type="text" name="id">
		<%} else{%>
			아이디 : <input type="text" name="id" value="<%=id%>">
		<%}%>
		<br><br>
		<input type="checkbox" name="save_id"> 아이디 기억하기
		<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>