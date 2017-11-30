package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

public interface MemberDAO {

	MemberVO findMemberById(String id);

	List<Authority> selectAuthorityById(String id);
	
	void registerMember(MemberVO vo);

	void registerRole(Authority authority);
	
	int idcheck(String id);
	
	String findIdByEmailAndName(MemberVO memberVO);

	String findQnaByIdNameEmail(MemberVO memberVO);

	MemberVO findMemberByQna(MemberVO memberVO);

	void updatePasswordById(MemberVO memberVO);

	void registerMemberSize(String id);

	void updateMemberSize(MemberSizeVO msizeVO);

	List<QuestionVO> findQuestionList();


	MemberSizeVO findMemberSizeById(String id);

	void updateMember(MemberVO vo);


	List<NoteVO> memberNoteList(Map<String, Object> map);

	int totalNoteCount(String id);


	
}