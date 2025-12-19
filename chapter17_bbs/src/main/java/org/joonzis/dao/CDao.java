package org.joonzis.dao;

import java.util.List;

import org.joonzis.vo.CVO;

public interface CDao {
	// 댓글 작성 (삽입)
	public int insertComment(CVO cvo);
	// 댓글 읽기 (가져오기)
	public List<CVO> getCommList(int b_idx);
	// 댓글 삭제
	public int removeComm(int c_idx);
}
