<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form method="post">
			<p>이름 : <input type="text" name="name">	</p>
			<p>나이 : <input type="number" name="age"></p>
			<p>연락처 : <input type="text" name="phone"></p>
			<p>주소 : <input type="text" name="addr"></p>
			<p>
				자기소개 : 
				<textarea rows="3" cols="50" name="self"></textarea>
			</p>
			<input type="button" value="전송" onclick="send(this.form)">
		</form>
	</div>
</body>
<script type="text/javascript">
	function send(f){
		f.action = '/chapter14_mvc2/Controller';
		f.submit();
	}
</script>
</html>