package org.kosta.MrFit.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource	
	private SqlSessionTemplate template;

	@Override
	public MemberVO findMemberById(String id) {
		// TODO Auto-generated method stub
		return template.selectOne("member.findMemberById",id);
	}

	@Override
	public List<Authority> selectAuthorityById(String id) {
		// TODO Auto-generated method stub
		return template.selectList("member.selectAuthorityById",id);
	}
	
}



















