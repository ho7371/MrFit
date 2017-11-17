package org.kosta.MrFit.controller;

import javax.annotation.Resource;

import org.kosta.MrFit.model.MemberService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController {
	//@Resource 		// 객체주입때문에 서버 구동이 안되서 일단 주석처리합니다 - 진호
	private MemberService memberService;
	
	//@Resource 		// 객체주입때문에 서버 구동이 안되서 일단 주석처리합니다 - 진호
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login_fail";
	}

	/** 코드 작성 규칙
	 *  1. 메소드 주석은 꼭 구현 완료 후 작성한다.
	 *  2. 다른 사람이 작성한 코드를 변경해야 할 경우, 원본은 주석처리 후 복사하여 사용한다.
	 *  3. 다른 기능/메소드로 매개변수를 던지는 경우, 해당 문서에 매개변수를 명시해준다.
	 *  4. 하루 작업한 것은 꼭 push를 한다.
	 *  
	 *  @RequestMapping("home.do")
		public String findMemberById(){
			System.out.println("   	MemberController/findMemberById()/시작");
			System.out.println("    MemberController/findMemberById()/진행");
			System.out.println("    MemberController/findMemberById()/종료");
			return null;
		}
	 * @return
	 */

	@RequestMapping("findMemberById.do")
	public ModelAndView findMemberById(String id) {
		System.out.println("   	MemberController/findMemberById()/시작");
		System.out.println("    MemberController/findMemberById()/진행");
		System.out.println("    MemberController/findMemberById()/종료");
		return null;
	}
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		System.out.println("   	MemberController/loginForm()/시작");
		System.out.println("    MemberController/loginForm()/진행");
		System.out.println("    MemberController/loginForm()/종료");
		return "loginForm.tiles";
	}
}
