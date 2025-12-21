package org.joonzis.service;

import org.joonzis.vo.MemberVO;

public interface MemberService {
	// 아이디 중복 확인
	public int validateId(String mId);
	// 회원 등록
	public int insertMember(MemberVO mvo);
	// 회원 로그인
	public MemberVO doLogin(MemberVO mvo);
}
