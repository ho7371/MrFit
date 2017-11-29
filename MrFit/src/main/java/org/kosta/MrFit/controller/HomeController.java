package org.kosta.MrFit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.BoardService;
import org.kosta.MrFit.model.InquiryVO;
import org.kosta.MrFit.model.ListVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.OrderService;
import org.kosta.MrFit.model.PagingBean;
import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@Resource
	private ProductService productService;
	@Resource
	private BoardService boardService;
	@Resource
	private OrderService orderService;
	private PagingBean pb;
	// 주석 샘플
	/** 1. 메소드 주석은 꼭 구현 완료 후 작성한다.
	 *  2. 다른 사람이 작성한 코드를 변경해야 할 경우, 원본은 주석처리 후 복사하여 사용한다.
	 *  3. 다른 기능/메소드로 매개변수를 던지는 경우, 해당 문서에 매개변수를 명시해준다.
	 *  4. 하루 작업한 것은 꼭 push를 한다.
	 *  
	 * @return
	 */
	
	/** [정현] - 수정자 : 진호
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	/*@RequestMapping("home.do")
	public String home(HttpServletRequest request,Model model){
		System.out.println("      HomeController/home()/시작");
			
		int pbCount=productService.getTotalProductCount();
		String pno=request.getParameter("pageNo");
		
		if(pno==null){
			pb = new PagingBean(pbCount);
		}else{
			pb = new PagingBean(pbCount,Integer.parseInt(pno));
		}
		
		List<ProductVO> ProductList=productService.ProductList(pb);
		System.out.println("      HomeController/home()/진행 - pno:"+pno+", 상품목록:"+ProductList);		
		if(ProductList!=null&&!ProductList.isEmpty()) {
			model.addAttribute("ProductList",ProductList);
			model.addAttribute("pb",pb);
			System.out.println("      HomeController/home()/종료");
			return "home.tiles";
		}else {
			System.out.println("      HomeController/home()/종료");
			return "home.tiles";
		}
	}*/
	
	@RequestMapping("home.do")
	public ModelAndView home(HttpServletRequest request,Model model){
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal()!="anonymousUser") {			
			MemberVO vo=(MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			orderService.findImmediatelyPayGarbage(vo.getId());
		}
		System.out.println("      HomeController/home()/시작");
		ModelAndView mv = new ModelAndView();
		ListVO<ProductVO> lvo = new ListVO<ProductVO>();
		
			/* 페이징 처리 공통 영역 */
			int totalCount = productService.getTotalProductCount();
			int postCountPerPage = 9;
			int postCountPerPageGroup = 5;
			int nowPage = 1;
			String pageNo = request.getParameter("pageNo");
				if(pageNo != null) {
					nowPage = Integer.parseInt(pageNo);
				}
			pb = new PagingBean(totalCount,nowPage, postCountPerPage, postCountPerPageGroup);
		
		List<ProductVO> productList=productService.ProductList(pb);
		System.out.println("      HomeController/home()/진행 - productList :"+productList);
		if(productList!=null&&!productList.isEmpty()) {
			lvo.setList(productList);
			lvo.setPagingBean(pb);
		}
			
		mv.addObject("lvo", lvo);		
		mv.setViewName("home.tiles");
		System.out.println("      HomeController/home()/종료");
		return mv;
	}

	
	/**[현민][11/27][고객문의 리스트]
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("inquiry.do")
	public String inquiry(Model model,HttpServletRequest request){
		System.out.println("      HomeController/inquiry()/시작");
			
		/* 페이징 처리 공통 영역 */
	      int totalCount = boardService.getTotalInquiryCount();         // 보여줄 상품 총 개수
	      int postCountPerPage = 10;                              // 한 페이지에 보여줄 상품 개수
	      int postCountPerPageGroup = 5;                           // 한 페이지 그룹에 들어갈 페이지 개수
	      int nowPage = 1;   
	      String pageNo = request.getParameter("pageNo");               // 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
	      if(pageNo != null) {
	         nowPage = Integer.parseInt(pageNo);
	      }
	         
	      pb = new PagingBean(totalCount,nowPage, postCountPerPage, postCountPerPageGroup);
	      
		List<InquiryVO> ivoList = boardService.inquiry(pb);
		System.out.println("      HomeController/inquiry()/진행 list : "+ivoList);
		model.addAttribute("list", ivoList);
		model.addAttribute("pb", pb);
		System.out.println("      HomeController/inquiry()/종료");
		return "board/inquiry.tiles";
	}
	
	/**	[현민,진호]
	 * 	고객문의 상세보기
	 * @param bno
	 * @return
	 */
	@RequestMapping("inquiryDetail.do")
	public String inquiryDetail(String iqno, Model model){
		System.out.println("      HomeController/inquiryDetail()/시작");
		System.out.println("      HomeController/inquiryDetail()/진행 iqno : "+iqno);
		InquiryVO inquiryVO = boardService.inquiryDetail(iqno);
		System.out.println("      HomeController/inquiryDetail()/진행 inquiryVO : "+inquiryVO);
		model.addAttribute("ivo", inquiryVO);
		System.out.println("      HomeController/inquiryDetail()/종료");
		return "board/inquiryDetail.tiles";
	}
	
	/**[진호, 현민][고객문의 댓글]
	 * 
	 * @param message
	 * @param iqno
	 * @param model
	 * @return
	 */
	@RequestMapping("inquiryReply.do")
	public String inquiryReply(String message, String iqno, Model model) {
		System.out.println("      HomeController/inquiryReply()/시작");
		Map<String, String> map = new HashMap<String, String>();
		map.put("message", message);
		map.put("iqno", iqno);
		boardService.inquiryReply(map);
		System.out.println("      HomeController/inquiryDetail()/종료");
		return "board/inquiryReply_ok.tiles";
	}
	
	
	
	//[정현][11/29][ 고객문의 삭제 ]
		@Secured("ROLE_MEMBER")
		@RequestMapping("deleteInquiry.do")	
		public String deleteInquiry(HttpServletRequest  request){	
			System.out.println("   	HomeController/deleteInquiry()/시작");		
			String iqno=request.getParameter("iqno");
			System.out.println("   	HomeController/deleteInquiry()/진행");		
			boardService.deleteInquiry(iqno);		
			System.out.println("   	HomeController/deleteInquiry()/종료");
			
			return "redirect:inquiry.do";
		}
		
		//[정현][11/29][ 고객문의 등록 폼으로 넘기기 ]	
		@Secured("ROLE_MEMBER")
		@RequestMapping("registerInquiryForm.do")			
			public String registerNoticeForm(HttpServletRequest  request){		
			System.out.println("   	HomeController/registerInquiryForm()/시작");
			System.out.println("   	HomeController/registerInquiryForm()/종료");		
				return "board/registerInquiryForm.tiles";
			}
			
		//[정현][11/29][ 고객문의 등록 후 공지사항 리스트로 ]
		@Secured("ROLE_MEMBER")
		@RequestMapping("registerInquiry.do")	
			public String registerNotice(HttpServletRequest  request){
			System.out.println("   	HomeController/registerInquiry()/시작");
				MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				InquiryVO ivo=new InquiryVO();
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				ivo.setId(mvo.getId());
				ivo.setTitle(title);
				ivo.setContent(content);
				System.out.println("   	HomeController/registerInquiry()/진행 ivo : "+ivo);
				boardService.registerInquiry(ivo);	
				System.out.println("   	HomeController/registerNotice()/종료");
				return "redirect:inquiry.do";
			}
		
		
		//[정현][11/29]고객문의 수정폼 
		@Secured("ROLE_MEMBER")
		@RequestMapping("updateInquiryForm.do")
		public ModelAndView updateInquiryForm(HttpServletRequest  request) {
			System.out.println("   	HomeController/updateInquiryForm()/시작");
			ModelAndView mv = new ModelAndView();
			String iqno=request.getParameter("iqno");
			InquiryVO ivo=boardService.inquiryDetail(iqno);
			System.out.println("   	HomeController/updateInquiryForm()/진행");
			mv.addObject("ivo",ivo);
			mv.setViewName("board/updateInquiryForm.tiles");
			System.out.println("   	HomeController/updateInquiryForm()/종료");
			return mv;
		}
		//고객문의 수정 
			@Secured("ROLE_MEMBER")
			@RequestMapping("updateInquiry.do")
			public String updateInquiry(HttpServletRequest  request) {
				System.out.println("   	AdminController/updateInquiry()/시작");
				MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				String iqno=request.getParameter("iqno");
				InquiryVO ivo=new InquiryVO();
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				System.out.println("   	HomeController/updateInquiry()/진행");
				ivo.setId(mvo.getId());
				ivo.setIqno(iqno);
				ivo.setTitle(title);
				ivo.setContent(content);		
				boardService.updateInquiry(ivo);		
				System.out.println("   	HomeController/updateInquiry()/종료");
				return "redirect:inquiry.do";
			}
	
	
		/* 단순 페이지 맵핑 */
	@RequestMapping("{viewName}.do")
	public String showView(@PathVariable String viewName){
		return viewName+".tiles";
	}	/* 단순 페이지 맵핑 */
	@RequestMapping("{dirName}/{viewName}.do")
	public String showView(@PathVariable String dirName,@PathVariable String viewName){
		return dirName+"/"+viewName+".tiles";
	}
	
}
