package org.kosta.MrFit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.ListVO;
import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberSizeVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.NoteVO;
import org.kosta.MrFit.model.PagingBean;
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
	private PagingBean pb;
	/**[재현][로그인 실패]
	 * 
	 * @param 
	 * @return
	 */
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
	
	/**
	 * 아이디로 멤버객체를 리턴받는 메서드
	 * 
	 * @return
	 */
	@RequestMapping("findMemberById.do")
	public ModelAndView findMemberById(String id) {
		return null;
	}
	
	/**[재현][로그인]
	 * 
	 * @return
	 */
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "member/loginForm.tiles";
	}
	
	/**[재현][아이디패스워드 찾기 폼]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("findIdPasswordForm.do")
	public String findIdPasswordForm() {
		return "member/findIdPasswordForm.tiles";
	}
	
	/**[재현][아이디 찾기]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("findIdByEmailAndName.do")
	public ModelAndView findIdByEmailAndName(MemberVO memberVO) {
		ModelAndView mv=new ModelAndView();
		String id= memberService.findIdByEmailAndName(memberVO);
		if(id == null) { // 찾는 아이디가 없을 경우
			System.out.println("   	MemberController/findIdByEmailAndName()/진행 - 찾는 아이디 없음");
			mv.setViewName("main/member/findid_fail");
			return mv;
		}
		mv.setViewName("member/findId_ok.tiles");
		mv.addObject("lostid", id);
		return mv;
	}
	
	/**[재현][질문 보여주기]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("findQnaByIdNameEmail.do")
	public ModelAndView findQnaByIdNameEmail(MemberVO memberVO) {
		ModelAndView mv=new ModelAndView();
		String question=memberService.findQnaByIdNameEmail(memberVO);
		if (question == null) { // 입력한 회원의 정보에 질문이 없을 경우
			mv.setViewName("main/member/findid_fail");
			return mv;
		}
		mv.addObject("question", question);
		mv.addObject("memberVO", memberVO);
		mv.setViewName("member/findAnswer.tiles");
		return mv;
	}
	
	/**[재현][비밀번호 찾기]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("findMemberByQna.do")
	public ModelAndView findMemberByQna(MemberVO memberVO) {
		MemberVO mvo=memberService.findMemberByQna(memberVO);
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
		memberService.updatePasswordById(memberVO);
		// updatePasswordById
		return "redirect:updatePassword_ok.do";
	}
	
	/**[재현][비밀번호 업데이트 완료]
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping("updatePassword_ok.do")
	public String updatePassword_ok() {
		// updatePasswordById
		return "member/updatePassword_ok.tiles";
	}
	
	/**[영훈][회원가입 폼]
	 * 
	 * @return
	 */
	@RequestMapping("registerForm.do")
	public ModelAndView findQuestionList() {
		List<QuestionVO> list = memberService.findQuestionList(); 
		return new ModelAndView("member/registerForm.tiles","list",list);
	}
	
	/**[영훈][회원가입]
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "registerMember.do", method = RequestMethod.POST)
	public String register(MemberVO vo) {
		memberService.registerMember(vo);
		memberService.registerMemberSize(vo.getId());
		return "redirect:registerResultView.do?id=" + vo.getId();
	}
	
	/**[영훈][회원가입 후 결과 뷰]
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String id) {
		MemberVO vo = memberService.findMemberById(id);
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
		return "member/myPage.tiles";
	}
	
	/**[영훈][myPage의 회원(사용자 자신)정보]
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("myPageInfo.do")
	public ModelAndView myPageInfo() {
		List<QuestionVO> list = memberService.findQuestionList(); 
		return new ModelAndView("member/myPage_info.tiles","list",list);
	}
	
	/**[영훈][회원정보 수정 폼]
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateMemberForm.do")
	public String updateMemberForm() {
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
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("    MemberController/updateMemberAction()/진행1 - Spring Security 세션 수정 전 회원정보: "+pvo);
		memberService.updateMember(memberVO);		//회원 정보를 DB에 셋팅
		return "member/update_result.tiles";
	}
	/**[정현][회원탈퇴]
	 * 
	 * @param request
	 * @param memberVO
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateStatusMember.do")
	public String updateStatusMember(HttpServletRequest request) {
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId=pvo.getId();
		System.out.println("    MemberController/updateStatusMember()/진행1 - 회원아이디: "+memberId);
		memberService.updateStatusMember(memberId);		//회원 탈퇴를 위해 해당 member의 status 0으로 변경
		memberService.deleteAuth(memberId);			//Auth에서 해당 회원의 정보삭제
		
		return "member/updateStatus_result.tiles";

	}
	
	
	/**[현민][11/24][쪽지함]
	 * 관리자가 회원에게 보낸 쪽지를 볼 수 있다.
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("memberNoteList.do")
	public ModelAndView memberNoteList(HttpServletRequest request) {
		MemberVO vo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ModelAndView mv = new ModelAndView();
		/* 페이징 처리 공통 영역 */
		int totalOrderCount = memberService.totalNoteCount(vo.getId());		// 보여줄 쪽지 총 개수
		int postCountPerPage = 10;											// 한 페이지에 보여줄 상품 개수
		int postCountPerPageGroup = 5;										// 한 페이지 그룹에 들어갈 페이지 개수
		int nowPage = 1;
		String pageNo = request.getParameter("nowPage");					// 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
			if(pageNo != null) {
				nowPage = Integer.parseInt(pageNo);
			}
		pb = new PagingBean(totalOrderCount,nowPage, postCountPerPage, postCountPerPageGroup);
		System.out.println("   	MemberController/memberNoteList()/진행 누른 페이지 번호 nowPage : "+nowPage);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", vo.getId());
		map.put("pagingBean", pb);
		List<NoteVO> list = memberService.memberNoteList(map);
		System.out.println("    MemberController/memberNoteList()/진행 list : "+list);
		ListVO<NoteVO> lvo = new ListVO<NoteVO>();
		if(list!=null&&!list.isEmpty()) {												 // 쪽지함이 있거나 비어있지 않을 때
			lvo.setList(list);															 // list와 pagingBean을 ListVO에 셋팅
			lvo.setPagingBean(pb);
			System.out.println("      MemberController/memberNoteList()/진행2 - 셋팅된 lvo :"+lvo);
		}
		mv.setViewName("board/note.tiles");
		mv.addObject("lvo", lvo);
		return mv;
	}
	
}// class







