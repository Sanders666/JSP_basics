package org.joonzis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.joonzis.model.Criteria;
import org.joonzis.mybatis.config.DBService;
import org.joonzis.vo.BVO;

public class BDaoImpl implements BDao {
	// DAO 객체 생성
	private static BDaoImpl instance = null;
	private BDaoImpl() {}
	public static BDaoImpl getInstance() {
		if(instance == null) {
			instance = new BDaoImpl();
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
	
//	@Override
//	public List<BVO> getList() {
//		return getSqlSession().selectList("bbs_select_all");
//	}
	
	@Override
	public int getInsertBBS(BVO bvo) {
		int result = getSqlSession().insert("insert_bbs", bvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}

	@Override
	public BVO getBBS(int b_idx) {
		return getSqlSession().selectOne("bbs_by_idx", b_idx);
	}
	
	@Override
	public int removeBBS(int b_idx) {
		int result = getSqlSession().delete("delete_bbs", b_idx);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
	
	@Override
	public int updateBBS(BVO bvo) {
		int result = getSqlSession().update("update_bbs", bvo);
		if(result > 0) {
			getSqlSession().commit();
		}
		return result;
	}
	
	@Override
	public void updateHit(BVO bvo) {
		int result = getSqlSession().update("update_hit", bvo);
		if(result > 0) {
			getSqlSession().commit();
		}
	}
	@Override
	public List<BVO> getListWithPaging(Criteria cri) {
		return getSqlSession().selectList("bbs_select_all_with_paging", cri);
	}
	@Override
	public int getTotalRecordCount() {
		return getSqlSession().selectOne("total_count_of_bbs");
	}
	
	
}

