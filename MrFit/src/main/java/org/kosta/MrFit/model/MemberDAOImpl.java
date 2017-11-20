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
		System.out.println("                  MemberDAOImpl/findMemberById()/시작 - 아이디 :"+id);
		MemberVO vo=template.selectOne("member.findMemberById",id);
		System.out.println("                  MemberDAOImpl/findMemberById()/시작 - vo :"+vo);
		return template.selectOne("member.findMemberById",id);
	}

	@Override
	public List<Authority> selectAuthorityById(String id) {
		System.out.println("                  MemberDAOImpl/selectAuthorityById()/시작");
		System.out.println("                  MemberDAOImpl/selectAuthorityById()/종료");
		return template.selectList("member.selectAuthorityById",id);
	}
	
	@Override
	public void registerMember(MemberVO vo) {
		System.out.println("                  MemberDAOImpl/registerMember()/시작");
		System.out.println("                  MemberDAOImpl/registerMember()/종료");
		template.insert("member.registerMember",vo);			
	}
	
	@Override	
	public void registerRole(Authority authority){
		System.out.println("                  MemberDAOImpl/registerRole()/시작");
		System.out.println("                  MemberDAOImpl/registerRole()/종료");
		template.insert("member.registerRole",authority);
	}
	
	@Override
	public int idcheck(String id) {
		System.out.println("                  MemberDAOImpl/idcheck()/시작");
		System.out.println("                  MemberDAOImpl/idcheck()/종료");
		return template.selectOne("member.idcheck",id);				
	}

	@Override
	public List<QuestionVO> findQuestionList(){
		System.out.println("                  MemberDAOImpl/findQuestionList()/시작");
		System.out.println("                  MemberDAOImpl/findQuestionList()/종료");
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
		System.out.println("      		      MemberDAOImpl/findProductById()/종료");
		return null;
	}

	@Override
	public String findIdByEmailAndName(MemberVO memberVO) {
		System.out.println("                  MemberDAOImpl/findIdByEmailAndName()/시작");
		System.out.println("      		      MemberDAOImpl/findIdByEmailAndName()/종료");
		return template.selectOne("member.findIdByEmailAndName",memberVO);
	}

	@Override
	public String findQnaByIdNameEmail(MemberVO memberVO) {
		System.out.println("                  MemberDAOImpl/findQnaByIdNameEmail()/시작");
		System.out.println("      		      MemberDAOImpl/findQnaByIdNameEmail()/종료");
		return template.selectOne("member.findQnaByIdNameEmail",memberVO);
	}

	@Override
	public MemberVO findMemberByQna(MemberVO memberVO) {
		System.out.println("                  MemberDAOImpl/findMemberByQna()/시작");
		System.out.println("      		      MemberDAOImpl/findMemberByQna()/종료");
		return template.selectOne("member.findMemberByQna",memberVO);
	}

	@Override
	public void updatePasswordById(MemberVO memberVO) {
		System.out.println("                  MemberDAOImpl/updatePasswordById()/시작");
		System.out.println("      		      MemberDAOImpl/updatePasswordById()/종료");
		template.update("updatePasswordById", memberVO);
	}

	@Override
	public void registerMemberSize(MemberSizeVO msizeVO) {
		System.out.println("                  MemberDAOImpl/registerMemberSize()/시작");
		System.out.println("      		      MemberDAOImpl/registerMemberSize()/종료");
		template.insert("member.registerMemberSize", msizeVO);
		
	}

	@Override
	public void updateMemberSize(MemberSizeVO msizeVO) {
		System.out.println("                  MemberDAOImpl/updateMemberSize()/시작");
		System.out.println("      		      MemberDAOImpl/updateMemberSize()/종료");
		template.update("member.updateMemberSize", msizeVO);
		
	}
	
	@Override
	public void updateMember(MemberVO vo) {
		System.out.println("                  MemberDAOImpl/updateMember()/시작");
		System.out.println("      		      MemberDAOImpl/updateMember()/종료");
		template.update("member.updateMember",vo);			
	}
	
}



















