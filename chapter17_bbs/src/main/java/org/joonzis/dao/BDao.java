package org.joonzis.dao;

import java.util.List;

import org.joonzis.model.Criteria;
import org.joonzis.vo.BVO;

public interface BDao {
	// 전체 게시글
	// public List<BVO> getList();
	// 페이징 게시글
	public List<BVO> getListWithPaging(Criteria cri);
	// 게시글 삽입
	public int getInsertBBS(BVO bvo);
	// 특정 게시글
	public BVO getBBS(int b_idx);
	// 게시글 삭제
	public int removeBBS(int b_idx);
	// 게시글 수정
	public int updateBBS(BVO bvo);
	// 게시글 조회수
	public void updateHit(BVO bvo);
	// 전체 게시글 수
	public int getTotalRecordCount();
}
