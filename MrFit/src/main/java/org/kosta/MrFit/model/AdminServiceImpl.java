package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminDAO adminDAO;
	
	@Override
	public void adminUpdateMemberStatus(String id) {
		adminDAO.adminUpdateMemberStatus(id);
	}
	
	@Override
	public void adminDeleteMemberAuthority(String id) {
		adminDAO.adminDeleteMemberAuthority(id);
	}
	
	@Override
	public MemberVO adminSearchMember(String id) {
		return adminDAO.adminSearchMember(id);
	}
	
	@Override
	public List<MemberVO> commonMemberList(Map<String, Object> map){
		return adminDAO.commonMemberList(map);
	}
	
	@Override
	public int getTotalCommonMemberCount(int status) {
		return adminDAO.getTotalCommonMemberCount(status);
	}

	@Override
	public List<OrderVO> adminAllOrderList(PagingBean pb) {
		return adminDAO.adminAllOrderList(pb);
	}

	@Override
	public int adminTotalOrderCount() {
		return adminDAO.adminTotalOrderCount();
	}
	
	@Override
	public void adminGivePointToMember(MemberVO mvo) {
		adminDAO.adminGivePointToMember(mvo);
	}

	@Override
	public List<OrderVO> adminSearchOrder(Map<String, Object> map) {
		return adminDAO.adminSearchOrder(map);
	}

	@Override
	public int adminSearchMemberOrderCount(String memberId) {
		return adminDAO.adminSearchMemberOrderCount(memberId);
	}

	@Override
	public void updateOrderStatus(Map<String, String> map) {
		adminDAO.updateOrderStatus(map);
	}

	@Override
	public OrderVO adminfindOrderByOno(String ono) {
		return adminDAO.adminfindOrderByOno(ono);
	}

	@Override
	public void sendMessage(Map<String, Object> map) {
		adminDAO.sendMessage(map);
	}

	@Override
	public List<NoteVO> getNoteList(PagingBean pb) {
		return adminDAO.getNoteList(pb);
	}

	@Override
	public List<OrderProductVO> orderProductInfo(String ono) {
		return adminDAO.orderProductInfo(ono);
	}
	
	@Override
	public int adminSearchOrderCountByOrderNumber(String ono) {
		return adminDAO.adminSearchOrderCountByOrderNumber(ono);
	}

	@Override
	public OrderVO adminSearchOrderByOno(String ono) {
		System.out.println("            AdminServiceImpl/adminSearchOrderByOno()/시작");
		return adminDAO.adminSearchOrderByOno(ono);
	}

	@Override
	public void deleteProduct(String pno) {
		adminDAO.deleteProduct(pno);
	}

	@Override
	public int totalNoteCount() {
		return adminDAO.totalNoteCount();
	}

	@Override
	public void reportPoint(Map<String, Object> map) {
		adminDAO.reportPoint(map);
	}

	@Override
	public List<PointVO> adminPointList(PagingBean pb) {
		return adminDAO.adminPointList(pb);
	}

	@Override
	public int totalPointListCount() {
		return adminDAO.totalPointListCount();
	}
	
	
}











