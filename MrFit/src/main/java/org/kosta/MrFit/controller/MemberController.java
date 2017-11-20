package org.kosta.MrFit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberSizeVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.QuestionVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
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
	

	@RequestMapping("findIdPasswordForm.do")
	public String findIdPasswordForm() {
		System.out.println("   	MemberController/findId()/시작");
		System.out.println("    MemberController/findId()/종료");
		return "member/findIdPasswordForm.tiles";
	}
	
	@RequestMapping("findIdByEmailAndName.do")
	public ModelAndView findIdByEmailAndName(MemberVO memberVO) {
			System.out.println("   	MemberController/findIdByEmailAndName()/시작");
		ModelAndView mv=new ModelAndView();
		String id= memberService.findIdByEmailAndName(memberVO);
			if(id == null) {
				mv.setViewName("main/member/findid_fail");
				return mv;
			}
			mv.setViewName("member/findId_ok.tiles");
			mv.addObject("lostid", id);
			System.out.println("    MemberController/findIdByEmailAndName()/종료");
		return mv;

	}
	
	@RequestMapping("findQnaByIdNameEmail.do")
	public ModelAndView findQnaByIdNameEmail(MemberVO memberVO) {
			System.out.println("   	MemberController/findQnaByIdNameEmail()/시작");
		ModelAndView mv=new ModelAndView();
		String question=memberService.findQnaByIdNameEmail(memberVO);
		if (question == null) {
			mv.setViewName("main/member/findid_fail");
			return mv;
		}
		mv.addObject("question", question);
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/findAnswer.tiles");
			System.out.println("    MemberController/findQnaByIdNameEmail()/종료");
		return mv;
	}
	
	@RequestMapping("findMemberByQna.do")
	public ModelAndView findMemberByQna(MemberVO memberVO) {
			System.out.println("   	MemberController/findPassword()/시작");
		MemberVO mvo=memberService.findMemberByQna(memberVO);
			System.out.println("    MemberController/findPassword()/종료");
		// match answer
		return new ModelAndView("member/updatePasswordForm.tiles","upid",mvo);
	}
	
	@RequestMapping(value = "updatePasswordById.do", method = RequestMethod.POST)
	public String updatePasswordById(MemberVO memberVO) {
			System.out.println("   	MemberController/updatePasswordById()/시작");
			System.out.println("    MemberController/updatePasswordById()/종료");
		memberService.updatePasswordById(memberVO);
		// updatePasswordById
		return "redirect:updatePassword_ok.do";
	}
	
	@RequestMapping("updatePassword_ok.do")
	public String updatePassword_ok() {
			System.out.println("   	MemberController/updatePasswordById()/시작");
			System.out.println("    MemberController/updatePasswordById()/종료");
		// updatePasswordById
		return "member/updatePassword_ok.tiles";
	}

	@RequestMapping("registerForm.do")
	public ModelAndView findQuestionList() {
		List<QuestionVO> list = memberService.findQuestionList(); 
		return new ModelAndView("member/registerForm.tiles","list",list);
	}
	
	@RequestMapping(value = "registerMember.do", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		memberService.registerMember(vo);
		memberService.registerMemberSize(vo.getId());
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
	
	@RequestMapping("findMemberSizeById.do")
	public String findMemberSizeById(String id) {
			System.out.println("   	MemberController/findMemberSizeById()/시작");

		return "member/memberSizeView.tiles";
	}
	
	@RequestMapping(value = "updateMemberSize.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateMemberSize(MemberSizeVO msizeVO) {
			System.out.println("   	MemberController/updateMemberSize()/시작");
		memberService.updateMemberSize(msizeVO);
		return "redirect:updateMsize_ok.do";
	}
	
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("myPage.do")
	public String myPage() {
		return "member/myPage.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("myPageInfo.do")
	public ModelAndView myPageInfo() {
		return new ModelAndView("member/myPage_info.tiles");
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateMemberForm.do")
	public String updateMemberForm() {
		return"member/updateMemberForm.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateMemberAction.do")
	public String updateMemberAction(HttpServletRequest request, MemberVO memberVO) {
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("Spring Security 세션 수정 전 회원정보:" + pvo);		
		memberService.updateMember(memberVO);
		pvo.setPassword(memberVO.getPassword());
		pvo.setName(memberVO.getName());
		pvo.setAddress(memberVO.getAddress());
		pvo.setEmail(memberVO.getEmail());
		return "member/update_result.tiles";
	}

	
}







