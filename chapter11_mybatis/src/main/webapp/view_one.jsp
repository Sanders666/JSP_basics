<%@page import="org.joonzis.ex.MemberVO"%>
<%@page import="org.joonzis.ex.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO vo = dao.getUserInfoById(id);
	pageContext.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="index.jsp"/>
	
	<br> <hr> <br>
	
	<h1>${vo.id}회원의 데이터</h1>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty vo}">
					<tr>
						<td colspan="7">데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${vo.idx}</td>
						<td>${vo.id}</td>
						<td>${vo.pw}</td>
						<td>${vo.name }</td>
						<td>${vo.age}</td>
						<td>${vo.addr}</td>
						<td>${vo.reg_date}</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>