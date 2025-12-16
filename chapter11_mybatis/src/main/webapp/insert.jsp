<%@page import="org.joonzis.ex.MemberDAO"%>
<%@page import="org.joonzis.ex.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id"); 
	String pw = request.getParameter("pw"); 
	String name = request.getParameter("name"); 
	int age = Integer.parseInt(request.getParameter("age")); 
	String addr = request.getParameter("addr"); 
	
	MemberVO vo = new MemberVO();
	vo.setId(id);
	vo.setPw(pw);
	vo.setName(name);
	vo.setAge(age);
	vo.setAddr(addr);
	
	// dao의 메소드한테 vo 객체를 전달
	MemberDAO dao = MemberDAO.getInstance();
	int result = dao.insert(vo);
	pageContext.setAttribute("result", result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${result > 0}">
			<script type="text/javascript">
				alert("데이터 삽입 성공");
				location.href = 'view_all.jsp';
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("데이터 삽입 실패");
				location.href = 'view_all.jsp';
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>