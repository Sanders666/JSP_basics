<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex05_request">
		<div>아이디 <input type="text" name="id"> </div>
		<div>비밀번호 <input type="password" name="pw"> </div>
		<div>이름 <input type="text" name="name"> </div>
		<div>이메일 <input type="text" name="email"> </div>
		<div>
			성별 
			<input type="radio" name="gender" value="남" checked>남
			<input type="radio" name="gender" value="여">여
		</div>
		<div>
			취미
			<input type="checkbox" name="hobbies" value="영화">영화
			<input type="checkbox" name="hobbies" value="음악">음악
			<input type="checkbox" name="hobbies" value="독서">독서
			<input type="checkbox" name="hobbies" value="없음">없음
		</div>
		<div>
			<input type="button" value="전송" onclick="send(this.form)">
		</div>
	</form>
</body>
<script type="text/javascript">
	function send(f){
		// 아이디, 비밀번호, 이름, 이메일 전부 다 기입
		// 취미는 반드시 한 개 이상 선택
		if(f.name.value == '' || 
			f.pw.value == '' ||
			!f.id.value ||
			!f.email.value
			){
			alert("모든 내용을 입력하세요.");
			return;
		}
		
		let checkedCount = 
		document.querySelectorAll('input[name="hobbies"]:checked');
		if(checkedCount.length === 0){
			alert("취미를 한 개 이상 선택하세요.")
			return;
		}
	
		f.submit();
	}
</script>
</html>











