package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminDAO adminDAO;
	
	
	/*@Override
	public List<MemberVO> memberList(PagingBean0 PagingBean){
		return adminDAO.memberList(PagingBean);
	}
	
	@Override
	public int getTotalMemberCount() {
		return adminDAO.getTotalMemberCount();
	}*/
	
	/*@Override
	public List<MemberVO> unregisterMemberList(PagingBean0 PagingBean){
		return adminDAO.unregisterMemberList(PagingBean);
	}
	
	@Override
	public int getTotalUnregisterMemberCount() {
		return adminDAO.getTotalUnregisterMemberCount();
	}*/
	
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
	public List<OrderVO> adminAllOrderList(PagingBean0 pb) {
		return adminDAO.adminAllOrderList(pb);
	}

	@Override
	public int adminTotalOrderCount() {
		return adminDAO.adminTotalOrderCount();
	}
	
	
	
	
	
}











