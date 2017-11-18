package org.kosta.MrFit.controller;

import javax.annotation.Resource;

import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController {
	@Resource 		
	private MemberService memberService;
	
	@Resource 		
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "main/member/login_fail";
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
	
	@RequestMapping("findId.do")
	public ModelAndView findId() {
		System.out.println("   	MemberController/findId()/시작");
		System.out.println("    MemberController/findId()/진행");
		System.out.println("    MemberController/findId()/종료");
		// email
		//findIdByEmail
		return new ModelAndView("findId_ok");
	}
	
	@RequestMapping("findPasswordForm.do")
	public ModelAndView findPasswordForm() {
		System.out.println("   	MemberController/findPasswordForm()/시작");
		System.out.println("    MemberController/findPasswordForm()/진행");
		System.out.println("    MemberController/findPasswordForm()/종료");
		//findQnaById
		return new ModelAndView("findPassword_ok");
	}
	
	@RequestMapping("findPassword.do")
	public ModelAndView findpassword() {
		System.out.println("   	MemberController/findPassword()/시작");
		System.out.println("    MemberController/findPassword()/진행");
		System.out.println("    MemberController/findPassword()/종료");
		// match answer
		return new ModelAndView("updatePasswordForm.do");
	}
	
	@RequestMapping("updatePasswordById.do")
	public String updatePasswordById() {
		System.out.println("   	MemberController/updatePasswordById()/시작");
		System.out.println("    MemberController/updatePasswordById()/진행");
		System.out.println("    MemberController/updatePasswordById()/종료");
		// updatePasswordById
		return "home.do";
	}

	@RequestMapping(value = "registerMember.do", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:registerResultView.do?id=" + vo.getId();
	}
	
	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String id) {
		MemberVO vo = memberService.findMemberById(id);
		return new ModelAndView("member/register_result.tiles", "memberVO", vo);
	}
	
	@RequestMapping("idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		return memberService.idcheck(id);
	}

}







