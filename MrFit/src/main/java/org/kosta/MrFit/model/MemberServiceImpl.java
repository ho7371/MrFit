package org.kosta.MrFit.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	
	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	public List<Authority> selectAuthorityById(String id) {
		System.out.println("            MemberServiceImpl/selectAuthorityById()/시작");
		return memberDAO.selectAuthorityById(id);
	}
	
	// 주석샘플
	/** 1. 메소드 주석은 꼭 구현 완료 후 작성한다.
	 *  2. 다른 사람이 작성한 코드를 변경해야 할 경우, 원본은 주석처리 후 복사하여 사용한다.
	 *  3. 다른 기능/메소드로 매개변수를 던지는 경우, 해당 문서에 매개변수를 명시해준다.
	 *  4. 하루 작업한 것은 꼭 push를 한다.
	 *  
	 * @return
	 */
	
	@Override
	public MemberVO findMemberById(String id){
		System.out.println("            MemberServiceImpl/findMemberById()/시작");
		System.out.println("    		MemberServiceImpl/findMemberById()/진행");
		System.out.println("      		MemberServiceImpl/findMemberById()/종료");
		return memberDAO.findMemberById(id);
	}
	
	@Transactional
	@Override
	public void registerMember(MemberVO vo) {
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
		String encodedPwd = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encodedPwd);
		memberDAO.registerMember(vo);
		// 회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다
		Authority authority = new Authority(vo.getId(), "ROLE_MEMBER");
		memberDAO.registerRole(authority);
	}
	
	@Override
	public String idcheck(String id) {
		int count = memberDAO.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public String findIdByEmailAndName(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.findIdByEmailAndName(memberVO);
	}

	@Override
	public String findQnaByIdNameEmail(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.findQnaByIdNameEmail(memberVO);
	}

	@Override
	public MemberVO findMemberByQna(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.findMemberByQna(memberVO);
	}

	@Transactional
	@Override
	public void updatePasswordById(MemberVO memberVO) {
		String encodedPwd = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPwd);
		memberDAO.updatePasswordById(memberVO);
	}

	@Transactional
	@Override
	public void registerMemberSize(MemberSizeVO msizeVO) {
		memberDAO.registerMemberSize(msizeVO);
	}

	@Override
	public void updateMemberSize(MemberSizeVO msizeVO) {
		memberDAO.updateMemberSize(msizeVO);

	}
	
	@Override
	public List<QuestionVO> findQuestionList(){
		return memberDAO.findQuestionList();

	}
	
	@Override
	public void updateMember(MemberVO memberVO) {
		// 변경할 비밀번호를 암호화한다
		String encodePassword = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodePassword);
		memberDAO.updateMember(memberVO);
	}

	
}
