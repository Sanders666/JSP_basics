package org.joonzis.ex;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.joonzis.mybatis.DBService;

public class MemberDAO { // 실제 SqlSession 열고 SQL 실행하는 것은 DAO에서 수행
	// 필드 
	private SqlSessionFactory factory = null;
	
	// 싱글톤
	// 기본 생성자( 외부에서 접근할 수 없게 private 처리)
	private MemberDAO() {
		factory = DBService.getFactory();
	}
	private static MemberDAO dao = new MemberDAO();
	public static MemberDAO getInstance() {
		return dao;
	}
	
	/*
	 * openSession()			select 문에서 사용(커밋을 하지 않음)
	 * openSession(true)		자동 커밋
	 * openSession(false)		수동 커밋
	 * 
	 * SqlSession의 메소드 종류
	 * 	1. selectList("mapper에서 사용할 id")				
	 * -- 검색 결과가 여러 개 일때 List(테이블)
	 * 	2. selectList("mapper에서 사용할 id", 파라미터)		
	 * -- 파라미터 전달 시
	 * 	3. selectOne("mapper에서 사용할 id")				
	 * -- 검색 결과가 한 개 일 때(테이블)
	 * 	4. selectOne("mapper에서 사용할 id", 파라미터)
	 * 	5. insert("mapper에서 사용할 id", 파라미터)
	 * 	6. update("mapper에서 사용할 id")
	 * 	7. delete("mapper에서 사용할 id")
	 * 
	 *   *** 각 메소드의 두번 째 인자 값으로 파라미터를 던질 수 있다.
	 *   던질 파라미터가 없을 시 생략
	 */
	
	//Session을 통해 SQL을 실행
	
	// 전체 검색 
	public List<MemberVO> getAllList() {
		SqlSession session = factory.openSession(); // select/insert/update/delete를 실행하려면 SqlSession을 열어야 함
		List<MemberVO> list = session.selectList("select_all");
		session.close();
		return list;
	}
	
	// 회원 추가
	public int insert(MemberVO vo) { // 바인딩할 파라미터
		SqlSession session = factory.openSession(false); // 수동 커밋
		int result = session.insert("insert", vo);
		if(result > 0) {
			session.commit();
		}
		session.close();
		return result;
	}
	
	// 회원 삭제
	public int remove(MemberVO vo) {
		SqlSession session = factory.openSession(false);
		int result = session.delete("delete", vo);
		if(result > 0) {
			session.commit();
		}
		session.close();
		return result;
	}
	
	public MemberVO getUserInfoById(String id) {
		SqlSession session = factory.openSession();
		MemberVO vo = session.selectOne("select_by_id", id);
		session.close();
		return vo;
	}
	
	public MemberVO getUpdateView(MemberVO vo) {
		SqlSession session = factory.openSession();
		MemberVO responseVO = session.selectOne("select_update_view", vo);
		session.close();
		return responseVO;
	}
	
	public int update(MemberVO vo) {
		SqlSession session = factory.openSession(false);
		int result = session.update("update", vo);
		if(result > 0) {
			session.commit();
		}
		session.close();
		return result;
	}
	
}