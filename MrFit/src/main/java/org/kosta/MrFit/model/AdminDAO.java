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

	int adminSearchOrderCountByOrderNumber(String ono);

	OrderVO adminSearchOrderByOno(String ono);
	
	void sendMessage(Map<String, Object> map);

	List<NoteVO> getNoteList(PagingBean pb);

	List<OrderProductVO> orderProductInfo(String ono);

	void deleteProduct(String pno);

	int totalNoteCount();

	void reportPoint(Map<String, Object> map);

	List<PointVO> adminPointList(PagingBean pb);

	int totalPointListCount();

	int adminSearchPointCount(String searchKeyword);

	List<PointVO> adminSearchPoint(Map<String, Object> map);

	int adminSearchPointCountByStatus(String searchKeyword);

	List<PointVO> adminSearchPointByStatus(Map<String, Object> map);
	
	List<ProductDetailVO> updateProductForm(String pno);

	void updateProductInventory(ProductDetailVO pdvo);
	
	void restoreMemberStatus(String id);

	List<ProductVO> adminProductList(PagingBean pb);
}