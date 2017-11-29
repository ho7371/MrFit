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

	// 주석샘플
	/** 1. 메소드 주석은 꼭 구현 완료 후 작성한다.
	 *  2. 다른 사람이 작성한 코드를 변경해야 할 경우, 원본은 주석처리 후 복사하여 사용한다.
	 *  3. 다른 기능/메소드로 매개변수를 던지는 경우, 해당 문서에 매개변수를 명시해준다.
	 *  4. 하루 작업한 것은 꼭 push를 한다.
	 *  
	 * @return
	 */	
	
	@Override
	public List<Authority> selectAuthorityById(String id) {
		System.out.println("            MemberServiceImpl/selectAuthorityById()/시작");
		return memberDAO.selectAuthorityById(id);
	}
	
	@Override
	public MemberVO findMemberById(String id){
		System.out.println("            MemberServiceImpl/findMemberById()/시작");
		return memberDAO.findMemberById(id);
	}
	
	@Transactional
	@Override
	public void registerMember(MemberVO vo) {
		System.out.println("            MemberServiceImpl/registerMember()/시작");
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
		String encodedPwd = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encodedPwd);
		System.out.println("            MemberServiceImpl/registerMember()/진행1 암호화된 비밀번호 : "+vo.getPassword());
		memberDAO.registerMember(vo);
		System.out.println("            MemberServiceImpl/registerMember()/진행2");
		// 회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다
		Authority authority = new Authority(vo.getId(), "ROLE_MEMBER");
		memberDAO.registerRole(authority);
		System.out.println("            MemberServiceImpl/registerMember()/종료");
	}
	
	@Override
	public String idcheck(String id) {
		System.out.println("            MemberServiceImpl/idcheck()/시작");
		int count = memberDAO.idcheck(id);
		System.out.println("      		MemberServiceImpl/idcheck()/종료");
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public String findIdByEmailAndName(MemberVO memberVO) {
		System.out.println("            MemberServiceImpl/findIdByEmailAndName()/시작");
		return memberDAO.findIdByEmailAndName(memberVO);
	}

	@Override
	public String findQnaByIdNameEmail(MemberVO memberVO) {
		System.out.println("            MemberServiceImpl/findIdByEmailAndName()/시작");
		return memberDAO.findQnaByIdNameEmail(memberVO);
	}

	@Override
	public MemberVO findMemberByQna(MemberVO memberVO) {
		System.out.println("            MemberServiceImpl/findMemberByQna()/시작");
		return memberDAO.findMemberByQna(memberVO);
	}

	@Transactional
	@Override
	public void updatePasswordById(MemberVO memberVO) {
		System.out.println("            MemberServiceImpl/updatePasswordById()/시작");
		String encodedPwd = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPwd);
		memberDAO.updatePasswordById(memberVO);
		System.out.println("            MemberServiceImpl/updatePasswordById()/종료");
	}

	@Transactional
	@Override
	public void updateMemberSize(MemberSizeVO msizeVO) {	
		System.out.println("            MemberServiceImpl/updateMemberSize()/시작");
		memberDAO.updateMemberSize(msizeVO);
	}
	
	@Override
	public List<QuestionVO> findQuestionList(){
		System.out.println("            MemberServiceImpl/findQuestionList()/시작");
		return memberDAO.findQuestionList();

	}
	
	@Override
	public void updateMember(MemberVO memberVO) {
		System.out.println("            MemberServiceImpl/updateMember()/시작");
		// 변경할 비밀번호를 암호화한다
		String encodePassword = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodePassword);
		memberDAO.updateMember(memberVO);
		System.out.println("            MemberServiceImpl/updateMember()/종료");
	}

	@Override
	public MemberSizeVO findMemberSizeById(String id) {
		System.out.println("            MemberServiceImpl/findMemberSizeById()/시작");
		System.out.println("            MemberServiceImpl/findMemberSizeById()/종료");
		return memberDAO.findMemberSizeById(id);
	}

	@Transactional
	@Override
	public void registerMemberSize(String id) {
		System.out.println("            MemberServiceImpl/registerMemberSize()/시작");
		memberDAO.registerMemberSize(id);
		System.out.println("            MemberServiceImpl/registerMemberSize()/종료");
	}

	@Override
	public List<NoteVO> memberNoteList(String id) {
		System.out.println("            MemberServiceImpl/memberNoteList()/시작");
		System.out.println("            MemberServiceImpl/memberNoteList()/종료");
		return memberDAO.memberNoteList(id);
	}

	
}
