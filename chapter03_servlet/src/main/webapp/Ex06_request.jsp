<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Ex06_request">
		<div>이름 : <input type="text" name="name"> </div>
		<div>국어 : <input type="number" name="kor"> </div>
		<div>영어 : <input type="number" name="eng"> </div>
		<div>수학 : <input type="number" name="mat"> </div>
		<div>
			<input type="button" value="전송" onclick="send(this.form)">
		</div>
	</form>
</body>
<script type="text/javascript">
	function send(f){
		// 이름 , 각 점수 필수 입력
		// 서블릿에서 내용 출력 ( 이름, 평균, 학점 )
		if(!f.name.value ||
			!f.kor.value ||
			!f.eng.value ||
			!f.mat.value){
			alert('모든 정보를 입력하세요.');
			return;
		}
		f.submit();
	}
</script>
</html>











