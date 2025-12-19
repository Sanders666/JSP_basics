<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/view.css">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>${bvo.b_idx }번 게시글</h1>
		<form method="post">
			<table class="bbs">
				<tbody>
					<tr>
						<th>작성자</th>
						<td>${bvo.writer }</td>
						<th>IP</th>
						<td>${bvo.ip }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">${bvo.title }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3">
							<c:choose>
								<c:when test="${bvo.filename eq null }">
									첨부파일 없음
								</c:when>
								<c:otherwise>
									<a id="download" href="${bvo.filename }">${bvo.filename }</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">${bvo.content }</td>
					</tr>
					<tr>
						<td colspan="4" id="btn">
							<input type="button" value="게시글 수정하기" onclick="updatePage()">&nbsp;&nbsp;
							<input type="button" value="게시글 삭제하기" onclick="removeBBS(${bvo.b_idx})">&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="view_all()">
							<input type="hidden" name="b_idx" value="${bvo.b_idx }">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<br/><hr/><br/>
		<!-- 댓글 입력 폼 -->
		<form method="post">
			<table class="insertComment">
				<tbody>
					<tr>
						<th>댓글 작성자</th>
						<td><input type="text" name="writer"></td>
						<th>댓글 비밀번호</th>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<th>댓글 내용</th>
						<td colspan="3">
							<textarea name="content" rows="3" cols="80" placeholder="댓글을 입력하세요."></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" id="btn">
							<input type="button" value="댓글 등록" onclick="insert_comment(this.form)"/> &nbsp; &nbsp;
							<input type="reset" value="다시 작성"/>  								
							<input type="hidden" name="b_idx" value="${bvo.b_idx }"/>  
							<input type="hidden" name="cmd" value="insertComment"/>								
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<br/><hr/><br/>
		<!-- 댓글 출력 폼 -->
		<form>
			<table class="viewComment">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>작성일</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="commBody">
				
				</tbody>
			
			
			</table>
		</form>
		
		
		
	</div>

</body>
<script type="text/javascript" src="js/bbs.js"></script>
<script type="text/javascript" src="js/download.js"></script>
<script type="text/javascript" src="js/comment.js"></script>
</html>