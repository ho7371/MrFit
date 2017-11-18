package org.kosta.MrFit.model;

import java.util.List;

public interface MemberDAO {

	MemberVO findMemberById(String id);

	List<Authority> selectAuthorityById(String id);
	
	void registerMember(MemberVO vo);

	void registerRole(Authority authority);
	
	int idcheck(String id);

	List<QuestionVO> findQuestionList();
	
}