package org.kosta.MrFit.model;

import java.util.List;

public interface MemberDAO {

	MemberVO findMemberById(String id);

	List<Authority> selectAuthorityById(String id);

}