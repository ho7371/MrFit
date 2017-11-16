package org.kosta.MrFit.model;

import java.util.List;

public interface MemberService {

	MemberVO findMemberById(String id);

	List<Authority> selectAuthorityByUsername(String id);
	
}
