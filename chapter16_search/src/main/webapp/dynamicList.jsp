<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		width: 800px;
		text-align: center;
		margin: auto;
	}
	table{
		width: 100%;
		border-collapse: collapse;
	}
	th, td{
		border: 1px solid gray;
	}
	th{
		padding: 5px;
		background-color: darkslateblue;
		color: white;
	}
</style>
</head>
<body>
	<div>
		<h1>직원 정보</h1>
		<table>
			<thead>
				<tr>
					<th>직원ID</th>
					<th>이름</th>
					<th>연락처</th>
					<th>연봉</th>
					<th>부서ID</th>
					<th>고용일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.employee_id}</td>
								<td>${vo.first_name} ${vo.last_name}</td>
								<td>${vo.phone_number}</td>
								<td>${vo.salary}</td>
								<td>${vo.department_id}</td>
								<td>${vo.hire_date}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">직원이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>
