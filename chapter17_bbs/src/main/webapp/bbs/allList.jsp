<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/allList.css">
<link rel="stylesheet" href="css/page.css">
<script type="text/javascript">
</script>
</head>
<body>
	<div>
		<p>
			<button onclick="moveInsertPage()">게시글 작성</button>
		</p>
		<h1>BBS 게시판</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>					
				</tr>
			</thead>
			<tbody> <!-- ${list}는 request.getAttribute("list")를 읽는 것 -->
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach varStatus="vs" var="bvo" items="${list }">
							<tr>
								<td>${bvo.b_idx }</td>
								<td>
									<a href="BBSController?cmd=view&b_idx=${bvo.b_idx }">${bvo.title }</a>
								</td>
								<td>${bvo.writer }</td>
								<td>${bvo.reg_date }</td>
								<td>${bvo.hit }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan ="5">게시물이 없습니다.</td>							
						</tr>							
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				
			</tfoot>
		</table>
		<!-- page -->
		<div class="page-wrap">
			<ul class="page-nation">
				<c:if test="${pageMaker.prev }">
					<li class="previous">
						<a href="${pageMaker.startPage-1 }"> &lt; </a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
					<li>
						<a href="${num }" class="${pageMaker.cri.pageNum == num ? 'active' : '' }"> ${num } </a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li><a href="${pageMaker.endPage+1 }"> &gt; </a></li>
				</c:if>
			</ul>
		</div>

	</div>
</body>
<script type="text/javascript" src="js/bbs.js"></script>
</html>
