package org.kosta.MrFit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.ListVO;
import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberSizeVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.PagingBean;
import org.kosta.MrFit.model.ProductDAO;
import org.kosta.MrFit.model.ProductDetailVO;
import org.kosta.MrFit.model.ProductReviewVO;
import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductSizeGapVO;
import org.kosta.MrFit.model.ProductSizeVO;
import org.kosta.MrFit.model.ProductVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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

	/** 코드 작성 규칙
	 *  1. 메소드 주석은 꼭 구현 완료 후 작성한다.
	 *  2. 다른 사람이 작성한 코드를 변경해야 할 경우, 원본은 주석처리 후 복사하여 사용한다.
	 *  3. 다른 기능/메소드로 매개변수를 던지는 경우, 해당 문서에 매개변수를 명시해준다.
	 *  4. 하루 작업한 것은 꼭 push를 한다.
	 *  @RequestMapping("home.do")
		public String findProductById(){
			System.out.println("   	ProductController/findProductById()/시작");
			System.out.println("    ProductController/findProductById()/진행");
			System.out.println("    ProductController/findProductById()/종료");
			return null;
		}
	 * @return
	 */
	
	

	/**[정현][2017.11.20][분류별 상품 리스트 뽑기]
	    * 
	    * @param category
	    * @return
	    */
	   @RequestMapping("findProductByCategory.do")
	   public ModelAndView findProductByCategory(HttpServletRequest request, String category, Model model){
	      System.out.println("      ProductController/findProductByCategory()/시작");         
	      
			/* 페이징 처리 공통 영역 */
			int totalCount = productService.getCategoryProductCount(category);
			int postCountPerPage = 10;
			int postCountPerPageGroup = 5;
			int nowPage = 1;
			String pageNo = request.getParameter("pageNo");
			if(pageNo != null) {
				nowPage = Integer.parseInt(pageNo);
			}
			pb = new PagingBean(totalCount,nowPage, postCountPerPage, postCountPerPageGroup);
	      
			ModelAndView mv = new ModelAndView();
	      ListVO<ProductVO> lvo= new ListVO<ProductVO>();
	      
	      HashMap<String,Object> map=new HashMap<String,Object>();
	      map.put("startNumber",pb.getStartRowNumber());
	      map.put("endNumber",pb.getEndRowNumber());
	      map.put("category",category);
	      List<ProductVO> productList=productService.findProductByCategory(map);
	      
	      System.out.println("      ProductController/findProductByCategory()/진행 - 리스트 : "+productList);      
	      if(productList!=null&&!productList.isEmpty()) {         
	         lvo.setList(productList);      
	      }
	      lvo.setPagingBean(pb);
	      mv.addObject("lvo", lvo);
	      mv.setViewName("product/productList.tiles");
	      System.out.println("      ProductController/findProductByCategory()/종료");
	      return mv;
	   }
	   
	   
	/**[현민][상품검색]
	 * 액터가 검색한 키워드를 받아 그 키워드에 해당하는 상품을 
	 * 찾는 기능 
	 * 키워드에 해당하는 상품이 있는 경우 해당 상품을 보여주고
	 * 키워드에 해당하는 상품이 없는 경우 검색 실패 메세지를 보여주는 jsp로 보낸다.
	 * @param keyword
	 * @return
	 */
	@RequestMapping("findProductByName.do")
	public ModelAndView findProductByName(String keyword){
		System.out.println("   	ProductController/registerProduct()/시작");
		ModelAndView mv = new ModelAndView();
		List<ProductVO> list = productService.findProductByName(keyword);
		if(list!= null) {
			System.out.println("    ProductController/registerProduct()/진행 list : "+list);
			mv.setViewName("product/findProductByName_ok.tiles");
			mv.addObject("list", list);
		}else {
			mv.setViewName("main/product/findProductByName_fail");
		}
		System.out.println("    ProductController/registerProduct()/종료");
		return mv;
	}
	
	/* [석환][11/18]
	 * 상품 번호로 상품의 상세정보 페이지 이동
	 */
	@RequestMapping("findProductDetailByPno.do")
	public ModelAndView findProductDetailByPno(String pno) {
		ModelAndView mv=new ModelAndView();
		ProductVO pvo=productService.findProductDtailByPno(pno);
		List<ProductSizeVO> psList=productDAO.sizeGapMemberAndProduct(pno);
		System.out.println("    ProductController/findProductDetailByPno()/진행1 - @@@@@ " + SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal()!="anonymousUser") {			
			MemberVO vo=(MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			MemberSizeVO msvo=memberService.findMemberSizeById(vo.getId());
			ArrayList<ProductSizeGapVO> psglist=productService.sizeGapMemberAndProduct(pno,msvo,pvo.getCategory());
			mv.addObject("psglist", psglist);
		}
		mv.addObject("psList", psList);
		List<ProductDetailVO> clist=productService.findProductColorBypno(pno);
     	// 해당 상품 리뷰 불러오는 메서드
		List<ProductReviewVO> prvolist=productService.findProductReplyByPno(pno);
			mv.setViewName("product/productDetail.tiles");
			mv.addObject("clist", clist);
			mv.addObject("pvo", pvo);	
			mv.addObject("prvolist", prvolist);
		return mv;
	}
	
	/* [석환][2017.11.21]
	 * 상품 디테일 page에서 pdno를 조건으로 
	 * 색상별 size를 JSON 형식으로 통신한다
	 */
	@RequestMapping("findProductDetailByColorAjax.do")
	@ResponseBody
	public List<ProductSizeVO> findProductDetailByColorAjax(ProductDetailVO pdVO){
		List<ProductSizeVO> sizeList=productService.findProductDetailByColorAjax(pdVO);
		return sizeList;
	}
	
	/**[재현][2017.11.21]
	 * 상품 리뷰 작성 미완
	 * @param prvo
	 * @return 미정
	 */
	@RequestMapping("registerProductReview.do")
	@ResponseBody
	public String registerProductReview(ProductReviewVO prvo) {
		productService.registerProductReview(prvo);
		return "";
	}
	
	
	
}//class




















