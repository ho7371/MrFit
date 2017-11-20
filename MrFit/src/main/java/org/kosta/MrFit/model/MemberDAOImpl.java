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
		System.out.println("아이디 : "+id);
		System.out.println("                  MemberDAOImpl/findMemberById()/시작");
		MemberVO vo=template.selectOne("member.findMemberById",id);
		System.out.println("daoimpl "+vo);
		return template.selectOne("member.findMemberById",id);
	}

	@Override
	public List<Authority> selectAuthorityById(String id) {
		// TODO Auto-generated method stub
		System.out.println("                  MemberDAOImpl/selectAuthorityById()/시작");
		return template.selectList("member.selectAuthorityById",id);
	}
	
	@Override
	public void registerMember(MemberVO vo) {
		template.insert("member.registerMember",vo);			
	}
	
	@Override	
	public void registerRole(Authority authority){
		template.insert("member.registerRole",authority);
	}
	
	@Override
	public int idcheck(String id) {
		return template.selectOne("member.idcheck",id);				
	}

	@Override
	public List<QuestionVO> findQuestionList(){
		return template.selectList("member.findQuestionList");
	}
	// 주석샘플
	/** 1. 메소드 주석은 꼭 구현 완료 후 작성한다.
	 *  2. 다른 사람이 작성한 코드를 변경해야 할 경우, 원본은 주석처리 후 복사하여 사용한다.
	 *  3. 다른 기능/메소드로 매개변수를 던지는 경우, 해당 문서에 매개변수를 명시해준다.
	 *  4. 하루 작업한 것은 꼭 push를 한다.
	 *  
	 * @return
	 */
	public String findProductById(){
		System.out.println("                  MemberDAOImpl/findProductById()/시작");
		System.out.println("    		      MemberDAOImpl/findProductById()/진행");
		System.out.println("      		      MemberDAOImpl/findProductById()/종료");
		return null;
	}

	@Override
	public String findIdByEmailAndName(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return template.selectOne("member.findIdByEmailAndName",memberVO);
	}

	@Override
	public String findQnaByIdNameEmail(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return template.selectOne("member.findQnaByIdNameEmail",memberVO);
	}

	@Override
	public MemberVO findMemberByQna(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return template.selectOne("member.findMemberByQna",memberVO);
	}

	@Override
	public void updatePasswordById(MemberVO memberVO) {
		// TODO Auto-generated method stub
		template.update("updatePasswordById", memberVO);
	}

	@Override
	public void registerMemberSize(MemberSizeVO msizeVO) {
		template.insert("member.registerMemberSize", msizeVO);
		
	}

	@Override
	public void updateMemberSize(MemberSizeVO msizeVO) {
		template.update("member.updateMemberSize", msizeVO);
		
	}

	@Override
	public MemberSizeVO findMemberSizeById(String id) {
		// TODO Auto-generated method stub
		return template.selectOne("member.findMemberSizeById", id);
	}
}



















