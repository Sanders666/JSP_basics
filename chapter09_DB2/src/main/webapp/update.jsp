<%@page import="org.joonzis.db.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	
	Connection conn = null;
	PreparedStatement ps = null;
	
	try {
		conn = DBConnect.getConnection();
		
		String sql = "update member " +
					"set pw=?, age=?, name=?, addr=? " +
					"where idx=?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, pw);
		ps.setInt(2, Integer.parseInt(age));
		ps.setString(3, name);
		ps.setString(4, addr);
		ps.setInt(5, Integer.parseInt(idx));
		int result = ps.executeUpdate();
		if(result > 0) {
			System.out.println("데이터 수정 완료");
			conn.commit();
		}else {
			System.out.println("데이터 수정 실패");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		try {
			conn.rollback();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
	} finally {
		response.sendRedirect("view_all.jsp");
		try {
			if(ps != null) {ps.close();}
			if(conn != null) {conn.close();}
		} catch (Exception e2) {
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