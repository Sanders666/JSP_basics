<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="get" action="Ex03_02_receive.jsp">
		<fieldset>
			<legend>개인 정보 전송</legend>
			<p>이름 <input type="text" name="name"></p>
			<p>나이 <input type="number" name="age"></p>
			<p>
				반려동물(
					<input type="checkbox" name="pet" value="강아지">강아지
					<input type="checkbox" name="pet" value="고양이">고양이
					<input type="checkbox" name="pet" value="돼지">돼지
				)
			</p>
			<p>
				<textarea rows="5" cols="30" name="info"></textarea>
			</p>
			<input type="button" value="전송" onclick="send(this.form)">
		</fieldset>
	</form>
</body>
<script type="text/javascript">
	function send(f) {
		f.submit();
	}
</script>
</html>