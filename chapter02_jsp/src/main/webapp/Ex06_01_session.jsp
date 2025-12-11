<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>세션 관리하기</h1>
	<div>
		세션에 정보 저장하기 
		<input type="button" value="확인" onclick="saveSession()"> 
	</div>
	<div>
		세션에 정보 삭제하기 
		<input type="button" value="확인" onclick="removeSession('name')"> <!-- 'key'면 key의 value가 null -->
	</div>
	<div>
		세션에 정보 초기화하기 
		<input type="button" value="확인" onclick="initSession()"> 
	</div>
	
	<br> <hr>
	
	<%
		// 세션에 저장된 데이터(이름, 나이)확인
		String name = null;
		String age = null;
		
		if(session.getAttribute("name") == null){
			name = "이름 없음";
		}else{
			name = (String)session.getAttribute("name");
			// getAttribute()의 리턴 타입이 Object 이므로 캐스팅 필요
		}
		
		if(session.getAttribute("age") == null){
			age = "나이 없음";
		}else{
			age = (String)session.getAttribute("age");
		}
	%>
	
	<h1>세션 확인하기</h1>
	<h3>세션에 저장된 이름 = <%=name %></h3>
	<h3>세션에 저장된 나이 = <%=age %></h3>
	
</body>
<script type="text/javascript">
	function saveSession(){
		location.href = 'Ex06_04_session_save.jsp';
	}
	function removeSession(val){
		location.href = 'Ex06_03_session_remove.jsp?type=' + val;
	}
	function initSession(){
		location.href = 'Ex06_02_session_init.jsp';
	}
</script>
</html>