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
	
	@Override
	public MemberVO adminSearchMember(String id) {
		return template.selectOne("admin.adminSearchMember",id);
	}
	
	@Override
	public List<MemberVO> commonMemberList(Map<String, Object> map){
		return template.selectList("admin.commonMemberList",map);
	}
	
	@Override
	public int getTotalCommonMemberCount(int status) {
		return template.selectOne("admin.getTotalCommonMemberCount",status);
	}


	@Override
	public List<OrderVO> adminAllOrderList(PagingBean pb) {
		List<OrderVO> list =  template.selectList("admin.adminAllOrderList",pb);
		for (int i = 0; i < list.size(); i++) {
			List<OrderProductVO> orderProductList = template.selectList("order.findOrderProductInfoByPdnoAndOno",list.get(i).getOno());
			list.get(i).setOrderProductList(orderProductList);
		}
		return list;
	}

	@Override
	public int adminTotalOrderCount() {
		return template.selectOne("admin.adminTotalOrderCount");
	}
	
	@Override
	public void adminGivePointToMember(MemberVO mvo) {
		template.update("admin.adminGivePointToMember", mvo);
	}

	@Override
	public List<OrderVO> adminSearchOrder(Map<String, Object> map) {
		List<OrderVO> list = template.selectList("admin.adminSearchOrder", map);
		for (int i = 0; i < list.size(); i++) {
			List<OrderProductVO> orderProductList = template.selectList("order.findOrderProductInfoByPdnoAndOno",list.get(i).getOno());
			list.get(i).setOrderProductList(orderProductList);
		}
		return list;
	}

	@Override
	public int adminSearchMemberOrderCount(String memberId) {
		return template.selectOne("admin.adminSearchMemberOrderCount", memberId);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

	

}

















