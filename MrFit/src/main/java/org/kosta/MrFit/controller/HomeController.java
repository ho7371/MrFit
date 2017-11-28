package org.kosta.MrFit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.BoardService;
import org.kosta.MrFit.model.BoardVO;
import org.kosta.MrFit.model.InquiryVO;
import org.kosta.MrFit.model.ListVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.OrderService;
import org.kosta.MrFit.model.PagingBean;
import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductVO;
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
	public String inquiry(Model model){
		System.out.println("      HomeController/inquiry()/시작");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<BoardVO> bvoList = boardService.inquiry();
		System.out.println("      HomeController/inquiry()/진행 list : "+bvoList);
		System.out.println("      HomeController/inquiry()/진행 mvo : "+ mvo);
		model.addAttribute("list", bvoList);
		model.addAttribute("mvo", mvo);
		System.out.println("      HomeController/inquiry()/종료");
		return "board/inquiry.tiles";
	}
	
	/**	[현민,진호]
	 * 	고객문의 상세보기
	 * @param bno
	 * @return
	 */
	@RequestMapping("inquiryDetail.do")
	public String inquiryDetail(String bno, Model model){
		System.out.println("      HomeController/inquiryDetail()/시작");
		System.out.println("      HomeController/inquiryDetail()/진행1 bno : "+bno);
		InquiryVO inquiryVO = boardService.inquiryDetail(bno);
		System.out.println("      HomeController/inquiryDetail()/진행2 inquiryVO : "+inquiryVO);
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
