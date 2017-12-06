package org.kosta.MrFit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.ListVO;
import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberSizeVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.PagingBean;
import org.kosta.MrFit.model.ProductDAO;
import org.kosta.MrFit.model.ProductDetailVO;
import org.kosta.MrFit.model.ProductQnaVO;
import org.kosta.MrFit.model.ProductReviewVO;
import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductSizeGapVO;
import org.kosta.MrFit.model.ProductSizeVO;
import org.kosta.MrFit.model.ProductVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	@Resource
	private ProductService productService;

	@Resource
	private MemberService memberService;

	@Resource
	private ProductDAO productDAO;
	private PagingBean pb;

	/**
	 * 코드 작성 규칙 
	 * 1. 메소드 주석은 꼭 구현 완료 후 작성한다. 
	 * 2. 다른 사람이 작성한 코드를 변경해야 할 경우, 원본은 주석처리 후 복사하여 사용한다.
	 * 3. 다른 기능/메소드로 매개변수를 던지는 경우, 해당 문서에 매개변수를 명시해준다. 
	 * 4. 하루 작업한 것은 꼭 push를 한다.
	 * @RequestMapping("home.do") public String findProductById(){
	 * System.out.println(" ProductController/findProductById()/시작");
	 * System.out.println(" ProductController/findProductById()/진행");
	 * System.out.println(" ProductController/findProductById()/종료"); return null; }
	 * 
	 * @return
	 */

	/**
	 * [정현][11/20] 상품의 카테고리 별 리스트를 페이징 처리해서 jsp로 보내줌
	 * 
	 * @param category
	 * @return
	 */
	@RequestMapping("findProductByCategory.do")
	public ModelAndView findProductByCategory(HttpServletRequest request, String category, Model model) {
		// 페이징 처리 공통 영역 
		int totalCount = productService.getCategoryProductCount(category); //카테고리 별 상품의 개수
		int postCountPerPage = 8;										   //한 페이지에 보여줄 상품 개수
		int postCountPerPageGroup = 5;									   //한 페이지 그룹에 들어갈 페이지 개수
		int nowPage = 1;												   //처음 시작시 페이지 번호
		String pageNo = request.getParameter("pageNo");					   //현재 페이지 번호
		if (pageNo != null) {											   //요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
			nowPage = Integer.parseInt(pageNo);							   
		}
		//페이징 처리시 상품리스트의 총개수,현재페이지,페이징 리스트 개수,페이징 처리시 페이지 개수
		pb = new PagingBean(totalCount, nowPage, postCountPerPage, postCountPerPageGroup);
		ModelAndView mv = new ModelAndView();
		//페이징 처리 하기 위해 ListVO 변수 선언
		ListVO<ProductVO> lvo = new ListVO<ProductVO>();
		// 상품의 카테고리 와 페이징 시작 번호와 마지막 번호를 HashMap으로 담아 매개 변수로 보내줌
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNumber", pb.getStartRowNumber());
		map.put("endNumber", pb.getEndRowNumber());
		map.put("category", category);
		//Select한 pno, name, price, content, category 값을 리스트처리
		List<ProductVO> productList = productService.findProductByCategory(map);

		System.out.println("      ProductController/findProductByCategory()/진행 - 리스트 : " + productList);
		if (productList != null && !productList.isEmpty()) {
		//위 에서 select한 리스트 값을 ListVO<ProductVO>에 set 해줌
			lvo.setList(productList);
		}
		//위에서 정의한 상품리스트의 총개수,현재페이지,페이징 리스트 개수,페이징 처리시 페이지 개수를 ListVO에 set 해줌
		lvo.setPagingBean(pb);
		//페이징 처리,카테고리별 리스트를 ListVO 담아 jsp로 보냄
		mv.addObject("lvo", lvo);
		mv.setViewName("product/productList.tiles");
		return mv;
	}
	/**
	 * [현민][상품검색] 액터가 검색한 키워드를 받아 그 키워드에 해당하는 상품을 찾는 기능 키워드에 해당하는 상품이 있는 경우 해당 상품을
	 * 보여주고 키워드에 해당하는 상품이 없는 경우 검색 실패 메세지를 보여주는 jsp로 보낸다.
	 * 
	 * @param keyword
	 * @return
	 */
	@RequestMapping("findProductByName.do")
	public ModelAndView findProductByName(HttpServletRequest request, String keyword) {
		ModelAndView mv = new ModelAndView();
		// 페이징 처리 공통 영역 
		int totalOrderCount = productService.productTotalCount(keyword); //키워드 별 리스트의 총 개수
		int postCountPerPage = 8;										 //한 페이지에 보여줄 상품 개수
		int postCountPerPageGroup = 5;									 //한 페이지 그룹에 들어갈 페이지 개수
		int nowPage = 1;												 //처음 시작시 페이지 번호
		String pageNo = request.getParameter("nowPage");				 //현재 페이지 번호
		if (pageNo != null) {											 // 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
			nowPage = Integer.parseInt(pageNo);
		}
		//페이징 처리시 검색된 리스트의 총개수,현재페이지,페이징 리스트 개수,페이징 처리시 페이지 개수
		pb = new PagingBean(totalOrderCount, nowPage, postCountPerPage, postCountPerPageGroup);
		//검색 키워드 와 정의된 PagingBean을 HashMap으로 담아 매개 변수로 보내줌
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("pagingBean", pb);
		//키워드 별 상품 리스트를 List<ProductVO>로 담음
		List<ProductVO> list = productService.findProductByName(map);
		System.out.println("   	ProductController/registerProduct()/진행1 list : " + list);
		//정의 된 List<ProductVO>와 PagingBean을 ListVO에 담음
		ListVO<ProductVO> lvo = new ListVO<ProductVO>(list, pb);
		if (list != null) {
			System.out.println("    ProductController/registerProduct()/진행2 list : " + list);
			//검색된 값이 있을 경우 ListVO를 jsp로 보냄
			mv.setViewName("product/findProductByName_ok.tiles");
			mv.addObject("lvo", lvo);
			mv.addObject("keyword",keyword);
		} else {
			//검색된 값이 없을 경우 아래 jsp로 보냄
			mv.setViewName("main/product/findProductByName_fail");
		}
		return mv;
	}
	/**
	 * [석환][11/18] 상품의 상품번호(pno)로 상품의 상세보기 페이지로 이동
	 * 회원일 경우는 회원의 치수와 해당 상품의 치수를 비교
	 * [정현][11/30] 상품상세보기시 HIT +1하기
	 * @param pno
	 * @return
	 */
	@RequestMapping("findProductDetailByPno.do")
	public ModelAndView findProductDetailByPno(String pno,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String checkScroll=request.getParameter("checkScroll");
		//상품 번호(pno)로 상품 검색
		ProductVO pvo = productService.findProductDetailByPno(pno);
		//[정현][11/30] hit에 +1
		productService.hitUpByPno(pno);
		//상품 번호(pno)로 상품들의 사이즈 리스트 받아옴
		List<ProductSizeVO> psList = productDAO.sizeGapMemberAndProduct(pno);
		System.out.println("      ProductController/findProductDetailByPno()/진행1");
		//회원 or 비회원을 식별해 회원일 경우에는 회원의 신체 치수와 해당 상품의 치수를 비교함.
		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() != "anonymousUser") {
			MemberVO vo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			MemberSizeVO msvo = memberService.findMemberSizeById(vo.getId());
			//jsp에 상품과 회원의 치수를 비교해 String 값으로 color 값을 보내줌
			ArrayList<ProductSizeGapVO> psglist = productService.sizeGapMemberAndProduct(pno, msvo, pvo.getCategory());
			mv.addObject("psglist", psglist);
			mv.addObject("id", vo.getId());
		}else {
			mv.addObject("id", "anonymousUser");
		}
		mv.addObject("psList", psList);
		//상품 번호(pno)로 상품의 색상 값을 보내줌
		List<ProductDetailVO> clist = productService.findProductColorBypno(pno);
		
		// 해당 상품 리뷰 불러오는 메서드
		/* 페이징 처리 공통 영역  영훈 추가 */
		int totalCount = productService.getTotalProductReviewCount(pno);
		System.out.println("      ProductController/findProductDetailByPno()/진행2 - 리뷰 totalCount : "+totalCount);
		int postCountPerPage = 10;					 						// 한 페이지에 보여줄 상품 개수
		int postCountPerPageGroup = 5;										// 한 페이지 그룹에 들어갈 페이지 개수
		int nowPage = 1;
		String pageNo = request.getParameter("pageNo");						// 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
		if(pageNo != null) {
			nowPage = Integer.parseInt(pageNo);
		}
		pb = new PagingBean(totalCount,nowPage, postCountPerPage, postCountPerPageGroup);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("pagingBean", pb);
		System.out.println("      ProductController/findProductDetailByPno()/진행3 - 리뷰 map : "+map);
		List<ProductReviewVO> prvolist = productService.findProductReplyByPno(map);
		System.out.println("      ProductController/findProductDetailByPno()/진행4 - 리뷰 prvolist : "+prvolist);
		ListVO<ProductReviewVO> prlvo = new ListVO<ProductReviewVO>(prvolist,pb);
		System.out.println("      ProductController/findProductDetailByPno()/진행5 - 리뷰 prlvo : "+prlvo);
		// ProductReview paging처리 완료
		
		// ProductQnA paging 처리 부분(2차)
		int nowPqPage = 1;
		String pqPageNo = request.getParameter("pqPageNo");						// 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
		if(pqPageNo != null) {
			nowPqPage = Integer.parseInt(pqPageNo);
		}
		totalCount=productService.getTotalProductQnaCountByPno(pno);
		pb = new PagingBean(totalCount,nowPqPage, postCountPerPage, postCountPerPageGroup);
		System.out.println("      ProductController/findProductDetailByPno()/진행6 - pqPageNo: "+pqPageNo+", totalCount:"+totalCount+", 엔드로우:"+pb.getEndRowNumber()+", 스타트로우:"+pb.getStartRowNumber());
		Map<String, Object> pqmap = new HashMap<String, Object>();
		pqmap.put("pno", pno);
		pqmap.put("PaingBean", pb);
		List<ProductQnaVO> pqlist=productService.findProductQnaByPno(pqmap);
		ListVO<ProductQnaVO> lpqlist= new ListVO<ProductQnaVO>(pqlist,pb);
		mv.addObject("lpqlist", lpqlist);
		System.out.println("      ProductController/findProductDetailByPno()/진행7 - lpqlist: "+lpqlist);
		//mv.addObject("checkScroll", checkScroll);
		
		mv.setViewName("product/productDetail.tiles");
		mv.addObject("pno", pno);
		mv.addObject("clist", clist);
		mv.addObject("pvo", pvo);
		//해당 상품의 리뷰 리스트 paging처리까지  보내줌
		mv.addObject("prlvo",prlvo);
		mv.addObject("id", null);
		mv.addObject("checkScroll", checkScroll);
		return mv;
	}
	
	/**
	 * [석환][11/21] 상품 상세보기 페이지에서 엑터가 상품의 색을 선택할 경우 해당 색에 포함 된 사이즈를 비교해
	 * JSON 형식으로 통신해 해당 상품의 색상별 사이즈를 보내준다.
	 * @param pdVO
	 * @return
	 */
	@RequestMapping("findProductDetailByColorAjax.do")
	@ResponseBody
	public List<ProductDetailVO> findProductDetailByColorAjax(ProductDetailVO pdVO) {
		//상품의 색상을 조건으로 사이즈를 검색해 jsp에 보내줌
		List<ProductDetailVO> sizeList = productService.findProductDetailByColorAjax(pdVO);
		return sizeList;
	}

	/**
	 * [재현][11/21] 엑터가 상품 구매 한 후 해당 상품에 대한 리뷰 작성
	 * 
	 * @param prvo
	 * @return 미정
	 */
	@RequestMapping("registerProductReview.do")
	@ResponseBody
	public ModelAndView registerProductReview(ProductReviewVO prvo, String ono) {
		ModelAndView mv = new ModelAndView();
		//회원이 리뷰작성 페이지에서 입력한 값을 등록
		productService.registerProductReview(prvo);
		//주문 번호 와 회원의 id값을 등록 완료 jsp로 보내줌
		mv.addObject("ono", ono);
		mv.addObject("id", prvo.getId());
		mv.setViewName("product/productReviewCheck_ok.tiles");
		return mv;
	}
	
	@RequestMapping("reviewUpdateAjax.do")
	@ResponseBody
	public ProductReviewVO reviewUpdateAjax(ProductReviewVO prvo) {
		System.out.println("reviewUpdateAjax 매개변수"+prvo);
		productService.reviewUpdateAjax(prvo);
		System.out.println("reviewUpdateAjax 종료 return"+prvo.getContent());
		return prvo;
	}
	
	@RequestMapping("registerProductQnaView.do")
	public String registerProductQnaView(Model model,String pno) {
		model.addAttribute("pno", pno);
		return "product/registerProductQnaForm.tiles";
	}
	
	@RequestMapping(value="productRegisterQna.do",method=RequestMethod.POST)
	public String registerProductQna(ProductQnaVO pqvo,String pno,String content,String security,Model model) {
		System.out.println("글 작성 controller 실행");
		System.out.println("문의 내용 : "+pqvo.getContent()+"공개 설정 : "+pqvo.getSecurity());
		System.out.println("pno : "+pno+" content : "+content+" security : "+security);
		System.out.println(pqvo.getPno());
		MemberVO vo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		pqvo.setId(vo.getId());
		productService.registerProductQnA(pqvo);
		return "redirect:findProductDetailByPno.do?pno="
		    	+pqvo.getPno()+"&checkScroll=QnAScroll&pqPageNo=1";
	}
	
}// class
