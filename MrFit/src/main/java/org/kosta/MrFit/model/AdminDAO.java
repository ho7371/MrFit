package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	void adminUpdateMemberStatus(String id);

	void adminDeleteMemberAuthority(String id);

	MemberVO adminSearchMember(String id);

	List<MemberVO> commonMemberList(Map<String, Object> map);

	int getTotalCommonMemberCount(int status);

	List<OrderVO> adminAllOrderList(PagingBean pb);

	int adminTotalOrderCount();

	void adminGivePointToMember(MemberVO mvo);

	List<OrderVO> adminSearchOrder(Map<String, Object> map);

	int adminSearchMemberOrderCount(String memberId);

	void updateOrderStatus(Map<String, String> map);

	OrderVO adminfindOrderByOno(String ono);

	int adminSearchOrderCountByOrderNumber(int parseInt);

	OrderVO adminSearchOrderByOno(int ono);
	
	void sendMessage(Map<String, Object> map);

	List<NoteVO> getNoteList();

	List<OrderProductVO> orderProductInfo(String ono);
}