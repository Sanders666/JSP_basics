<%@page import="org.joonzis.ex.MemberVO"%>
<%@page import="org.joonzis.ex.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberVO requestVO = new MemberVO();
	requestVO.setId(id);
	requestVO.setPw(pw);
	
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO vo = dao.getUpdateView(requestVO);
	pageContext.setAttribute("vo", vo); // EL
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
	<form method="post">
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
							<td>
								${vo.idx}
								<input type="hidden" name="idx" value="${vo.idx}">
							</td>
							<td>${vo.id}</td>
							<td>
								<input type="password" name="pw" value="${vo.pw}">
							</td>
							<td>
								<input type="text" name="name" value="${vo.name}">
							</td>
							<td>
								<input type="number" name="age" value="${vo.age}">
							</td>
							<td>
								<input type="text" name="addr" value="${vo.addr}">
							</td>
							<td>${vo.reg_date}</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="7">
						<input type="button" value="수정" onclick="update(this.form)">
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
<script type="text/javascript">
	function update(f){
		if( !f.pw.value || !f.name.value || !f.age.value || !f.addr.value ){
			alert("수정할 내용을 모두 입력하세요");
			return;
		}
		f.action = 'update.jsp';
		f.submit();
	}
</script>
</html>