package org.joonzis.service;

import java.util.List;

import org.joonzis.dao.BDao;
import org.joonzis.dao.BDaoImpl;
import org.joonzis.model.Criteria;
import org.joonzis.vo.BVO;

public class BBSServiceImpl implements BBSService {
	private BDao bdao = BDaoImpl.getInstance();
	
//	@Override
//	public List<BVO> getList() {
//		return bdao.getList();
//	}
	@Override
	public int getInsertBBS(BVO bvo) {
		return bdao.getInsertBBS(bvo);
	}
	@Override
	public BVO getBBS(int b_idx) {
		return bdao.getBBS(b_idx);
	}
	@Override
	public int removeBBS(int b_idx) {
		return bdao.removeBBS(b_idx);
	}
	@Override
	public int updateBBS(BVO bvo) {
		return bdao.updateBBS(bvo);
	}
	@Override
	public void updateHit(BVO bvo) {
		bdao.updateHit(bvo);
	}
	@Override
	public List<BVO> getListWithPaging(Criteria cri) {
		return bdao.getListWithPaging(cri);
	}
	@Override
	public int getTotalRecordCount() {
		return bdao.getTotalRecordCount();
	}
	
}

