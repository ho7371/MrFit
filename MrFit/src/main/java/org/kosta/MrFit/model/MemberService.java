package org.kosta.MrFit.model;

import java.util.List;

public interface MemberService {

	MemberVO findMemberById(String id);

	List<Authority> selectAuthorityById(String id);
	
	void registerMember(MemberVO vo);
	
	String idcheck(String id);

	String findIdByEmailAndName(MemberVO memberVO);

	String findQnaByIdNameEmail(MemberVO memberVO);

	MemberVO findMemberByQna(MemberVO memberVO);

	void updatePasswordById(MemberVO memberVO);

	void registerMemberSize(MemberSizeVO msizeVO);

	void updateMemberSize(MemberSizeVO msizeVO);
}
