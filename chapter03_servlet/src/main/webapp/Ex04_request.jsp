<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		검색 <input type="text" name="query">
		<input type="button" value="전송" onclick="send(this.form);">
	</form>
</body>
<script type="text/javascript">
	function send(f){
		// 검색 내용이 없으면 "검색 내용을 입력하세요" 출력
		// 내용이 있으면 해당 서블릿으로 submit
		// * action 속성 추가
		if(f.query.value == ''){
			alert("검색 내용을 입력하세요");
			return;
		}
		f.action = 'Ex04_request';
		f.submit();
	}
</script>
</html>











