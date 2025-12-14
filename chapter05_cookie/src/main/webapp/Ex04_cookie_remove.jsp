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
		쿠키 삭제는 기존 쿠키의 유효 시간을 0으로 하면 된다.
		1. 이름이 name인 쿠키 삭제
		2. 삭제 시 "쿠키 값을 삭제하였습니다" 출력
	 -->
<%
	// 쿠키 저장소의 모든 데이터 확인
	Cookie[] cookieBox = request.getCookies();
	if(cookieBox != null && cookieBox.length > 0){
		for(int i=0; i<cookieBox.length; i++){
			if(cookieBox[i].getName().equals("name")){
				cookieBox[i].setMaxAge(0);
				response.addCookie(cookieBox[i]);
				out.print("쿠키 값을 삭제하였습니다.");
				break;
			}
		}
	}else{
		out.print("쿠키가 존재하지 않습니다.");
	}
%>	
	
	
</body>
</html>