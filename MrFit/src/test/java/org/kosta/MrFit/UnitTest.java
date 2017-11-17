package org.kosta.MrFit;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml"})
public class UnitTest {
	@Resource
	private MemberService memberService;
	
	@Test
	public void findMemberById(){
		System.out.println(memberService);
		MemberVO member = memberService.findMemberById("mrfit");
		System.out.println(member);
	}

}
