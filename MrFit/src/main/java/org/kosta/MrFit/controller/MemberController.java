package org.kosta.MrFit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.QuestionVO;
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
		return "member/loginForm.tiles";
	}
	
	@RequestMapping("registerForm.do")
	public ModelAndView findQuestionList() {
		List<QuestionVO> list = memberService.findQuestionList(); 
		return new ModelAndView("member/registerForm.tiles","list",list);
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







