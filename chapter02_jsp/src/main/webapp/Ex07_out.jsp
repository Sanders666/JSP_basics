<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1~10 사이의 모든 정수 출력하기</h1>
	<%for(int i=1; i<=10; i++){%>
		<%= i%>
	<%}%>
	
	<br>
	<br>
	
	<%
		for(int i=1; i<=10; i++){
			out.print(i);
			// jsp에서는 생성 없이 사용 가능 ( 기본 객체 )
			// 서블릿에서는 PrintWriter 객체 생성 후 사용
		}
	%>
	
	<br>
	<br>

	<h1>버퍼 정보</h1>
	버퍼 크기 : <%=out.getBufferSize() %> <br> <!-- 기본 값 8KB -->
	남은 크기 : <%=out.getRemaining() %> <br> 
	auto flush : <%=out.isAutoFlush() %> <br> <!-- 기본 값 true -->
</body>
</html>