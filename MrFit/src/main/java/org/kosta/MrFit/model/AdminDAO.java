package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	void adminUpdateMemberStatus(String id);

	void adminDeleteMemberAuthority(String id);

	MemberVO adminSearchMember(String id);

	List<MemberVO> commonMemberList(Map<String, Object> map);

	int getTotalCommonMemberCount(int status);

	void adminGivePointToMember(MemberVO mvo);

}