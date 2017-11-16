package org.kosta.MrFit.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;

	@Override
	public MemberVO findMemberById(String id) {
		// TODO Auto-generated method stub
		return memberDAO.findMemberById(id);
	}

	@Override
	public List<Authority> selectAuthorityById(String id) {
		// TODO Auto-generated method stub
		return memberDAO.selectAuthorityById(id);
	}
	
}
