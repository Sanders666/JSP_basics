<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = null;
	String id = request.getParameter("id");
	String save_id = request.getParameter("save_id");
	
	if(save_id == null){
		// 기존에 만들었던 "save_id" 쿠키 확인 후 삭제
		Cookie[] cookieBox = request.getCookies();
		if(cookieBox != null && cookieBox.length > 0){
			for(int i=0; i<cookieBox.length; i++){
				if(cookieBox[i].getName().equals("save_id")){
					cookieBox[i].setMaxAge(0);
					response.addCookie(cookieBox[i]);
					break;
				}
			}
		}
	}else{
		cookie = new Cookie("save_id", id);
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="Ex05_id_check1.jsp">로그인 화면 돌아가기</a>
</body>
</html>