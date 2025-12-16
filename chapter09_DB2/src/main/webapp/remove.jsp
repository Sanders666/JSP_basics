<%@page import="org.joonzis.db.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 전달 받은 파라미터들을 가지고 delete
	// 데이터 삭제 성공/실패
	// view_all.jsp로 이동(데이터 삭제 확인 용도)
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Connection conn = null;
	PreparedStatement ps = null;
	
	try{
		conn = DBConnect.getConnection();
		
		String sql = "delete from member " + 
			"where id=? and pw=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		
		int result = ps.executeUpdate();
		if(result > 0 ){
			System.out.println("데이터 삭제 완료");
			conn.commit();
		}else{
			System.out.println("데이터 삭제 실패");
		}
		
	}catch(Exception e){
		e.printStackTrace();
		try{
			conn.rollback();
		}catch(Exception e2){
			e2.printStackTrace();
		}
		
	}finally{
		response.sendRedirect("view_all.jsp");
		try{
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}catch(Exception e2){
			e2.printStackTrace();
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>