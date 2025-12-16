<%@page import="org.joonzis.db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="index.jsp"/>
	
	<br> <hr> <br>
	
	<%
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			conn = DBConnect.getConnection();
			String sql = "select * from member";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			%>
	
	<h1>member 테이블의 전체 데이터</h1>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(!rs.next()){%>
				<tr>
					<td colspan="7">member 데이터가 없습니다. </td>
				</tr>
			<%}else{
				do{%>
				<tr>
					<td><%=rs.getInt(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getInt(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getDate(7) %></td>
				</tr>
					
			<%}while(rs.next());
			}
		 %>
		</tbody>
	</table>
	
	<%
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				
			}
		}
		
	%>
</body>
</html>