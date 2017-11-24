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
	public void adminGivePointToMember(MemberVO mvo) {
		adminDAO.adminGivePointToMember(mvo);
	}
	
	
	
}











