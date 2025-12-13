<%@page import="org.joonzis.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// DTO 파일을 이용하여 데이터 저장, 사용
	MemberDTO dto = new MemberDTO();
	dto.setId("admin");
	dto.setPw("1234");
	dto.setName("김씨");
	dto.setAge(50);
	dto.setAddr("서울");
	dto.setGender("남자");
	dto.setHobbies(new String[] {"게임", "수면"});
	dto.setLikeFoods(new String[] {"삼겹살", "햄버거", "라면"});
	dto.setDislikeFoods(new String[] {"김치", "오이"});

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>아이디 :  <%=dto.getId() %> </li>
		<li>비밀번호 :  <%=dto.getPw() %> </li>
		<li>이름 :  <%=dto.getName() %> </li>
		<li>나이 :  <%=dto.getAge() %> </li>
		<li>주소 :  <%=dto.getAddr() %> </li>
		<li>성별 :  <%=dto.getGender() %> </li>
		<li>
			취미 : 
			<%
				out.print(String.join(", ", dto.getHobbies()));
			%>
		</li>
		<li>
			좋아하는 음식 : 
			<%	
				boolean first = true;
				for(String likeFood : dto.getLikeFoods()){
					if(!first) out.print(", ");
				    out.print(likeFood);
				    first = false;
				}
			%>
		</li>
		<li>
			싫어하는 음식 : 
			<%
				out.print(String.join(", ", dto.getDislikeFoods()));
			%>
		</li>
		
	</ul>
</body>
</html>