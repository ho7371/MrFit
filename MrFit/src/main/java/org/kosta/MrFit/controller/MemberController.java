package org.kosta.MrFit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberSizeVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.NoteVO;
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
	
	/**[재현][로그인 실패]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("login_fail.do")
	public String loginFail() {
		System.out.println("   	MemberController/loginFail()/시작");
		System.out.println("    MemberController/loginFail()/종료");
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
	
	/**
	 * 아이디로 멤버객체를 리턴받는 메서드
	 * 
	 * @return
	 */
	@RequestMapping("findMemberById.do")
	public ModelAndView findMemberById(String id) {
		System.out.println("   	MemberController/findMemberById()/시작");
		System.out.println("    MemberController/findMemberById()/종료");
		return null;
	}
	
	/**[재현][로그인]
	 * 
	 * @return
	 */
	@RequestMapping("loginForm.do")
	public String loginForm() {
		System.out.println("   	MemberController/loginForm()/시작");
		System.out.println("    MemberController/loginForm()/종료");
		return "member/loginForm.tiles";
	}
	
	/**[재현][아이디패스워드 찾기 폼]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("findIdPasswordForm.do")
	public String findIdPasswordForm() {
		System.out.println("   	MemberController/findId()/시작");
		System.out.println("    MemberController/findId()/종료");
		return "member/findIdPasswordForm.tiles";
	}
	
	/**[재현][아이디 찾기]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("findIdByEmailAndName.do")
	public ModelAndView findIdByEmailAndName(MemberVO memberVO) {
		System.out.println("   	MemberController/findIdByEmailAndName()/시작");
		ModelAndView mv=new ModelAndView();
		String id= memberService.findIdByEmailAndName(memberVO);
		if(id == null) { // 찾는 아이디가 없을 경우
			System.out.println("   	MemberController/findIdByEmailAndName()/진행 - 찾는 아이디 없음");
			mv.setViewName("main/member/findid_fail");
			return mv;
		}
		mv.setViewName("member/findId_ok.tiles");
		mv.addObject("lostid", id);
		System.out.println("    MemberController/findIdByEmailAndName()/종료");
		return mv;
	}
	
	/**[재현][질문 보여주기]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("findQnaByIdNameEmail.do")
	public ModelAndView findQnaByIdNameEmail(MemberVO memberVO) {
		System.out.println("   	MemberController/findQnaByIdNameEmail()/시작");
		ModelAndView mv=new ModelAndView();
		String question=memberService.findQnaByIdNameEmail(memberVO);
		if (question == null) { // 입력한 회원의 정보에 질문이 없을 경우
			mv.setViewName("main/member/findid_fail");
			return mv;
		}
		mv.addObject("question", question);
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/findAnswer.tiles");
		System.out.println("    MemberController/findQnaByIdNameEmail()/종료");
		return mv;
	}
	
	/**[재현][비밀번호 찾기]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("findMemberByQna.do")
	public ModelAndView findMemberByQna(MemberVO memberVO) {
		System.out.println("   	MemberController/findPassword()/시작");
		MemberVO mvo=memberService.findMemberByQna(memberVO);
		System.out.println("    MemberController/findPassword()/종료");
		// match answer
		return new ModelAndView("member/updatePasswordForm.tiles","upid",mvo);
	}
	
	/**[재현][새 비밀번호 업데이트]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(value = "updatePasswordById.do", method = RequestMethod.POST)
	public String updatePasswordById(MemberVO memberVO) {
		System.out.println("   	MemberController/updatePasswordById()/시작");
		memberService.updatePasswordById(memberVO);
		// updatePasswordById
		System.out.println("    MemberController/updatePasswordById()/종료");
		return "redirect:updatePassword_ok.do";
	}
	
	/**[재현][비밀번호 업데이트 완료]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("updatePassword_ok.do")
	public String updatePassword_ok() {
		System.out.println("   	MemberController/updatePassword_ok()/시작");
		System.out.println("    MemberController/updatePassword_ok()/종료");
		// updatePasswordById
		return "member/updatePassword_ok.tiles";
	}
	
	/**[영훈][회원가입 폼]
	 * 
	 * @return
	 */
	@RequestMapping("registerForm.do")
	public ModelAndView findQuestionList() {
		System.out.println("   	MemberController/findQuestionList()/시작");
		List<QuestionVO> list = memberService.findQuestionList(); 
		System.out.println("    MemberController/findQuestionList()/종료");
		return new ModelAndView("member/registerForm.tiles","list",list);
	}
	
	/**[영훈][회원가입]
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "registerMember.do", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		System.out.println("   	MemberController/register()/시작");
		memberService.registerMember(vo);
		memberService.registerMemberSize(vo.getId());
		System.out.println("    MemberController/register()/종료");
		return "redirect:registerResultView.do?id=" + vo.getId();
	}
	
	/**[영훈][회원가입 후 결과 뷰]
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String id) {
		System.out.println("   	MemberController/registerResultView()/시작");
		MemberVO vo = memberService.findMemberById(id);
		System.out.println("    MemberController/registerResultView()/종료");
		return new ModelAndView("member/registerMemberResult.tiles", "memberVO", vo);
	}
	
	/**[영훈][회원가입시 id 중복확인 Ajax]
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		System.out.println("   	MemberController/idcheckAjax()/시작");
		System.out.println("     MemberController/idcheckAjax()/종료");
		return memberService.idcheck(id);
	}
	
	/**[재현][아이디로 회원치수 보기]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("findMemberSizeById.do")
	public String findMemberSizeById(String id) {
		System.out.println("   	MemberController/findMemberSizeById()/시작 id : "+id);
		return "member/memberSizeView.tiles";
	}
	
	/**[재현][회원치수 수정폼]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("updateMemberSizeForm.do")
	public String updateMemberSizeForm() {
		System.out.println("   	MemberController/updateMemberSizeForm()/시작");
		return "member/updateMemberSizeForm.tiles";
	}
	
	/**[재현][회원치수 수정]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("updateMemberSize.do")
	public String updateMemberSize(MemberSizeVO msizeVO) {
		System.out.println("   	MemberController/updateMemberSize()/시작");
		memberService.updateMemberSize(msizeVO);
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		pvo.setMsvo(msizeVO);
		System.out.println("   	MemberController/updateMemberSize()/종료");
		return "member/memberSizeView.tiles";
	}
	
	/**[현민][myPage]
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("myPage.do")
	public String myPage() {
		System.out.println("   	MemberController/myPage()/시작");
		System.out.println("    MemberController/myPage()/종료");
		return "member/myPage.tiles";
	}
	
	/**[영훈][myPage의 회원(사용자 자신)정보]
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("myPageInfo.do")
	public ModelAndView myPageInfo() {
		System.out.println("   	MemberController/myPageInfo()/시작");
		List<QuestionVO> list = memberService.findQuestionList(); 
		System.out.println("    MemberController/myPageInfo()/종료");
		return new ModelAndView("member/myPage_info.tiles","list",list);
	}
	
	/**[영훈][회원정보 수정 폼]
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateMemberForm.do")
	public String updateMemberForm() {
		System.out.println("   	MemberController/updateMemberForm()/시작");
		System.out.println("    MemberController/updateMemberForm()/종료");
		return"member/updateMemberForm.tiles";
	}
	
	/**[영훈][회원정보 수정]
	 * 
	 * @param request
	 * @param memberVO
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping(value="updateMemberAction.do", method=RequestMethod.POST)
	public String updateMemberAction(HttpServletRequest request, MemberVO memberVO) {
		System.out.println("   	MemberController/updateMemberAction()/시작");
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("    MemberController/updateMemberAction()/진행1 - Spring Security 세션 수정 전 회원정보: "+pvo);
		memberService.updateMember(memberVO);		//회원 정보를 DB에 셋팅
		pvo.setPassword(memberVO.getPassword());	//회원 정보를 객체에 셋팅
		pvo.setName(memberVO.getName());
		pvo.setPhone(memberVO.getPhone());
		pvo.setAddress(memberVO.getAddress());
		pvo.setEmail(memberVO.getEmail());
		System.out.println("    MemberController/updateMemberAction()/종료1");
		return "member/update_result.tiles";
	}
	
	/**[현민][11/24][쪽지함]
	 * 관리자가 회원에게 보낸 쪽지를 볼 수 있다.
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("memberNoteList.do")
	public ModelAndView memberNoteList() {
		System.out.println("    MemberController/memberNoteList()/시작");
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ModelAndView mv = new ModelAndView();
		List<NoteVO> list = memberService.memberNoteList(pvo.getId());
		System.out.println("    MemberController/memberNoteList()/진행 list : "+list);
		mv.setViewName("board/note.tiles");
		mv.addObject("list", list);
		System.out.println("    MemberController/memberNoteList()/종료");
		return mv;
	}
	
}// class







