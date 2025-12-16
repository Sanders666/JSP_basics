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
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        conn = DBConnect.getConnection();
        String sql = "select * from member where id=? and pw=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, pw);
        rs = ps.executeQuery();
    %>
    
    <h1><%=id %> 회원의 데이터</h1>
    <form method="post">
        <table border="1">
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
                if(rs.next()){
                %>
                    <tr>
                        <!-- idx는 수정 대상 식별자이므로 hidden으로 넘김 -->
                        <td>
                            <input type="hidden" name="idx" value="<%=rs.getInt("idx") %>">
                            <%=rs.getInt("idx") %>
                        </td>
                        <td><%=rs.getString("id") %></td>
                        <td><input type="text" name="pw" value="<%=rs.getString("pw") %>"></td>
                        <td><input type="text" name="name" value="<%=rs.getString("name") %>"></td>
                        <td><input type="number" name="age" value="<%=rs.getInt("age") %>"></td>
                        <td><input type="text" name="addr" value="<%=rs.getString("addr") %>"></td>
                        <td><%=rs.getDate("reg_date") %></td>
                    </tr>
                <%
                }else{
                %>
                    <tr>
                        <td colspan="7">해당 회원이 없습니다.</td>
                    </tr>
                <%
                }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="7">
                        <input type="button" value="수정" onclick="update(this.form)">
                        <input type="reset" value="다시 작성">
                    </th>
                </tr>
            </tfoot>
        </table>
    </form>
    <%
    } catch(Exception e){
        e.printStackTrace();
    } finally {
        if(rs != null) try{ rs.close(); } catch(Exception e){}
        if(ps != null) try{ ps.close(); } catch(Exception e){}
        if(conn != null) try{ conn.close(); } catch(Exception e){}
    }
    %>
</body>
<script type="text/javascript">
    function update(f){
        if(!f.pw.value || !f.age.value || !f.name.value || !f.addr.value){
            alert("수정할 내용을 모두 입력하세요.");
            return;
        }
        f.action = 'update.jsp';
        f.submit();
    }
</script>
</html>
