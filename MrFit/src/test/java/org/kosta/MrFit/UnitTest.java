package org.kosta.MrFit;

import javax.annotation.Resource;

import org.junit.Test;
import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberVO;

public class UnitTest {
	@Resource
	private MemberService memberService;
	
	@Test
	public void findMemberById(){
		System.out.println(memberService);
	/*	MemberVO member = memberService.findMemberById("mrfit");
		System.out.println(member);*/
	}

}
