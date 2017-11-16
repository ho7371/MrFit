package org.kosta.MrFit.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	
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
		return null;
	}

	@Override
	public List<Authority> selectAuthorityByUsername(String id) {
		return null;
	}
	
	
}
