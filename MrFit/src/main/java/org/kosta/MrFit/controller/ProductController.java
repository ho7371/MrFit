package org.kosta.MrFit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberSizeVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.ProductDetailVO;
import org.kosta.MrFit.model.ProductReviewVO;
import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductSizeVO;
import org.kosta.MrFit.model.ProductVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	@Resource
	private ProductService productService;
	@Resource
	private MemberService memberService;
	private String uploadPath;

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
	
	/**[][][]
	 * 
	 * @return
	 */
	// @Secured("ROLE_MEMBER")
	@RequestMapping("registerProductAction.do")
	public ModelAndView registerProduct(){
		System.out.println("   	ProductController/registerProduct()/시작");
		System.out.println("    ProductController/registerProduct()/진행");
		System.out.println("    ProductController/registerProduct()/종료");
		return null;
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
		System.out.println("    ProductController/registerProduct()/진행");
		if(list!= null) {
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
	public List<ProductSizeVO> findProductDetailByColorAjax(String pcno){
 	List<ProductSizeVO> sizeList=productService.findProductDetailByColorAjax(pcno);
		return sizeList;
	}
	
	/**[석환][2017.11.21]
	 * 상품 사이즈 회원과 비교해서 보내줌
	 * @param psno
	 * @param pcno
	 * @return
	 */
	@RequestMapping("findProductDetailBySizeAjax.do")
	@ResponseBody
	public ProductSizeVO findProductDetailBySizeAjax(String psno,String pcno,String pno) {
		MemberVO vo=(MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberSizeVO msvo=memberService.findMemberSizeById(vo.getId());
		ProductSizeVO psvo=productService.findProductDetailBySizeAjax(psno);
		ProductVO pvo=productService.findProductCategoryByPno(pno);
		int size1=psvo.getSize1();
		int size2=psvo.getSize2();
		int size3=psvo.getSize3();
		int size4=psvo.getSize4();
		int size5=psvo.getSize5();
		if(pvo.getCategory().equals("하의")) {
			psvo.setSize1(msvo.getWaist()-size1);
			psvo.setSize2(msvo.getCrotch()-size2);
			psvo.setSize3(msvo.getThigh()-size3);
			psvo.setSize4(msvo.getHem()-size4);
			psvo.setSize5(msvo.getBottomlength()-size5);
		}else {
			psvo.setSize1(msvo.getShoulder()-size1);
			psvo.setSize2(msvo.getChest()-size2);
			psvo.setSize3(msvo.getSleeve()-size3);
			psvo.setSize4(msvo.getArmhole()-size4);
			psvo.setSize5(msvo.getToplength()-size5);
		}
		return psvo;
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




















