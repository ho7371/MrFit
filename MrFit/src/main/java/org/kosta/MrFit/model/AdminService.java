package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

public interface AdminService {

	/*List<MemberVO> memberList(PagingBean0 PagingBean);

	int getTotalMemberCount();*/

	void adminUpdateMemberStatus(String id);

	void adminDeleteMemberAuthority(String id);

	/*List<MemberVO> unregisterMemberList(PagingBean0 PagingBean);

	int getTotalUnregisterMemberCount();*/

	MemberVO adminSearchMember(String id);

	List<MemberVO> commonMemberList(Map<String, Object> map);

	int getTotalCommonMemberCount(int status);

	List<OrderVO> adminAllOrderList();

}