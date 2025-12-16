package org.joonzis.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	// 필드
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql = "";

	// 객체 생성자
	// * 싱글톤 ( 외부에서 접근할 수 없게 private 처리 )
	private MemberDAO() {
	}

	private static MemberDAO dao = new MemberDAO();

	public static MemberDAO getInstance() {
		return dao;
	}

	// DBCP 설정
	private static DataSource ds; // sql 패키지
	static { // static 초기화 블록
		try {
			// javax.naming 패키지
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
			// java:comp/env : 톰캣
			// jdbc/oracle : Resource name을 찾아서 ds에 전달
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 각 메소드
	// 테이블 전체 목록 가져오는 메소드 - getAllList
	public List<MemberVO> getAllList() {
		List<MemberVO> list = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			sql = "select * from member";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setIdx(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setPw(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setAge(rs.getInt(5));
				vo.setAddr(rs.getString(6));
				vo.setReg_date(rs.getDate(7));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return list;
	}
	// 데이터 삽입 메소드 - insert
	public int insert(MemberVO vo) {
		int result = 0;

		try {
			conn = ds.getConnection();
			sql = "insert into member values" + "(member_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPw());
			ps.setString(3, vo.getName());
			ps.setInt(4, vo.getAge());
			ps.setString(5, vo.getAddr());

			result = ps.executeUpdate();

			if (result > 0) {
				conn.commit();
			}

		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return result;
	}
	// 데이터 삭제 메소드 - remove
	public int remove(String id, String pw) {
		int result = 0;

		try {
			conn = ds.getConnection();
			sql = "delete from member " + "where id=? and pw=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);

			result = ps.executeUpdate();

			if (result > 0) {
				conn.commit();
			}

		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return result;
	}
	
	// id를 통해 유저 정보 가져오는 메소드 - getUserInfoById
	public MemberVO getUserInfoById(String id) {
		MemberVO vo = null;
		
		try {
			conn = ds.getConnection();
			sql = "select * from member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) { // if문이 더 올바른 선택
				vo = new MemberVO();
				vo.setIdx(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setPw(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setAge(rs.getInt(5));
				vo.setAddr(rs.getString(6));
				vo.setReg_date(rs.getDate(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return vo;
	}
	
	// 수정할 유저 정보 가져오는 메소드 - getUpdateView
	public MemberVO getUpdateView(String id, String pw) {
		MemberVO vo = null;
		
		try {
			conn = ds.getConnection();
			sql = "select * from member where id=? and pw=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setPw(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setAge(rs.getInt(5));
				vo.setAddr(rs.getString(6));
				vo.setReg_date(rs.getDate(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return vo;
	}
	
	// 데이터 수정 메소드 - update
	public int update(MemberVO vo) {
		int result = 0;

		try {
			conn = ds.getConnection();
			sql = "update member set pw=?, name=?, age=?, addr=?" + " where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getPw());
			ps.setString(2, vo.getName());
			ps.setInt(3, vo.getAge());
			ps.setString(4, vo.getAddr());
			ps.setInt(5, vo.getIdx());

			result = ps.executeUpdate();

			if (result > 0) {
				conn.commit();
			}

		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return result;
	}
	
	
}