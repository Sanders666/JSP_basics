<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/insert_page.css">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>BBS 게시글 작성</h2>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="writer">
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="filename"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="80" name="content" placeholder="내용을 입력하세요"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="button" value="게시글 저장" onclick="insert(this.form)">&nbsp;&nbsp;
							<input type="reset" value="다시 작성">&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="view_all()">
							<input type="hidden" name="cmd" value="insertBBS">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript" src="js/bbs.js"></script>
</html>