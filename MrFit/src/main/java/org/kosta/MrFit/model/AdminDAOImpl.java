package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Resource
	private SqlSessionTemplate template;
	
	
	
	@Override
	public void adminUpdateMemberStatus(String id) {
		template.update("admin.adminUpdateMemberStatus", id);
	}
	
	@Override
	public void adminDeleteMemberAuthority(String id) {
		template.delete("admin.adminDeleteMemberAuthority", id);
	}
	
	//[영훈][관리자 회원검색]
	@Override
	public MemberVO adminSearchMember(String id) {
		return template.selectOne("admin.adminSearchMember",id);
	}
	
	//[영훈][관리자 회원리스트(회원/탈퇴회원)]
	@Override
	public List<MemberVO> commonMemberList(Map<String, Object> map){
		return template.selectList("admin.commonMemberList",map);
	}
	
	//[영훈][관리자 회원리스트 count(페이징처리시 필요)]
	@Override
	public int getTotalCommonMemberCount(int status) {
		return template.selectOne("admin.getTotalCommonMemberCount",status);
	}


	@Override
	public List<OrderVO> adminAllOrderList(PagingBean pb) {
		System.out.println("                  AdminDAOImpl/adminAllOrderList()/시작 ");
		List<OrderVO> list =  template.selectList("admin.adminAllOrderList",pb);
		for (int i = 0; i < list.size(); i++) {
			System.out.println("                  AdminDAOImpl/adminAllOrderList()/진행 ");
			List<OrderProductVO> orderProductList = template.selectList("order.findOrderProductInfoByPdnoAndOno",list.get(i).getOno());
			list.get(i).setOrderProductList(orderProductList);
		}
		System.out.println("                  AdminDAOImpl/adminAllOrderList()/종료 ");
		return list;
	}

	@Override
	public int adminTotalOrderCount() {
		System.out.println("                  AdminDAOImpl/adminTotalOrderCount()/시작 ");
		System.out.println("                  AdminDAOImpl/adminTotalOrderCount()/종료 ");
		return template.selectOne("admin.adminTotalOrderCount");
	}
	
	//[영훈][관리자 회원포인트 지급]
	@Override
	public void adminGivePointToMember(MemberVO mvo) {
		template.update("admin.adminGivePointToMember", mvo);
	}

	@Override
	public List<OrderVO> adminSearchOrder(Map<String, Object> map) {
		System.out.println("                  AdminDAOImpl/adminSearchOrder()/시작 ");
		List<OrderVO> list = template.selectList("admin.adminSearchOrder", map);
		System.out.println("                  AdminDAOImpl/adminSearchOrder()/진행1 ");
		for (int i = 0; i < list.size(); i++) {
			List<OrderProductVO> orderProductList = template.selectList("order.findOrderProductInfoByPdnoAndOno",list.get(i).getOno());
			list.get(i).setOrderProductList(orderProductList);
			System.out.println("                  AdminDAOImpl/adminSearchOrder()/진행2 list :  "+list.get(i));
		}
		System.out.println("                  AdminDAOImpl/adminSearchOrder()/종료 ");
		return list;
	}
	
	@Override
	public int adminSearchMemberOrderCount(String memberId) {
		System.out.println("                  AdminDAOImpl/adminSearchMemberOrderCount()/시작 ");
		System.out.println("                  AdminDAOImpl/adminSearchMemberOrderCount()/종료 ");
		return template.selectOne("admin.adminSearchMemberOrderCount", memberId);
	}

	@Override
	public void updateOrderStatus(Map<String, String> map) {
		System.out.println("                  AdminDAOImpl/updateOrderStatus()/시작 ");
		template.update("admin.updateOrderStatus", map);
		System.out.println("                  AdminDAOImpl/updateOrderStatus()/종료 ");
	}

	@Override
	public OrderVO adminfindOrderByOno(String ono) {
		// TODO Auto-generated method stub
		return template.selectOne("admin.adminfindOrderByOno",ono);
	}

	@Override
	public void sendMessage(Map<String, Object> map) {
		System.out.println("                  AdminDAOImpl/sendMessage()/시작 ");
		System.out.println("                  AdminDAOImpl/sendMessage()/종료 ");
		template.insert("admin.sendMessage", map);
	}

	@Override
	public List<NoteVO> getNoteList() {
		System.out.println("                  AdminDAOImpl/getNoteList()/시작 ");
		System.out.println("                  AdminDAOImpl/getNoteList()/종료 ");
		return template.selectList("admin.getNoteList");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	

}

















