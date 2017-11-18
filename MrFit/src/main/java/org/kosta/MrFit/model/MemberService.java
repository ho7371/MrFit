package org.kosta.MrFit.model;

import java.util.List;

public interface MemberService {

	MemberVO findMemberById(String id);

	List<Authority> selectAuthorityById(String id);
	
	void registerMember(MemberVO vo);
	
	String idcheck(String id);

	List<QuestionVO> findQuestionList();
}
