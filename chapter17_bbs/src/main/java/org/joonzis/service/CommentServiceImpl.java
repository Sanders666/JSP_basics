package org.joonzis.service;

import java.util.List;

import org.joonzis.dao.CDao;
import org.joonzis.dao.CDaoImpl;
import org.joonzis.vo.CVO;

public class CommentServiceImpl implements CommentService{
	private CDao cdao = CDaoImpl.getInstance();
	@Override
	public int insertComment(CVO cvo) {
		return cdao.insertComment(cvo);
	}
	@Override
	public List<CVO> getCommList(int b_idx) {
		return cdao.getCommList(b_idx);
	}
	@Override
	public int removeComm(int c_idx) {
		return cdao.removeComm(c_idx);
	}
	
}
