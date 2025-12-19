package org.joonzis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.joonzis.mybatis.config.DBService;
import org.joonzis.vo.CVO;

public class CDaoImpl implements CDao{
	// DAO 객체 생성
		private static CDaoImpl instance = null;
		private CDaoImpl() {}
		public static CDaoImpl getInstance() {
			if(instance == null) {
				instance = new CDaoImpl();
			}
			return instance;
		}
		
		// 필드
		private static SqlSession sqlsession = null;
		private synchronized static SqlSession getSqlSession() {
			if(sqlsession == null) {
				sqlsession = DBService.getFactory().openSession(false);
			}
			return sqlsession;
		}
	@Override
	public int insertComment(CVO cvo) {
		int result = 0;
		try {
			// CVO 전달
			result = getSqlSession().insert("insert_comment", cvo);
			
			// 반드시 commit 필요
			if(result > 0) {
				getSqlSession().commit();
			}
		
        } catch (Exception e) {
            // 실패 시 rollback
            getSqlSession().rollback();
            e.printStackTrace();
        }
        return result;
	}
	@Override
	public List<CVO> getCommList(int b_idx) {
		return getSqlSession().selectList("comm_select_by_b_idx", b_idx);
	}
	@Override
	public int removeComm(int c_idx) {
		int result = 0;
		try {
			result = getSqlSession().delete("remove_comment", c_idx);
			
			// 반드시 commit 필요
			if(result > 0) {
				getSqlSession().commit();
			}
		
        } catch (Exception e) {
            // 실패 시 rollback
            getSqlSession().rollback();
            e.printStackTrace();
        }
        return result;
	}
	
	
}
