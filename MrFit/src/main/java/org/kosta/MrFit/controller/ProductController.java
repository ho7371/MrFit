package org.kosta.MrFit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.OrderVO;
import org.kosta.MrFit.model.ProductDetailVO;
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
	/* [석환][11/18[]
	 * 상품 번호로 상품의 상세정보 페이지 이동
	 */
	@RequestMapping("findProductDetailByPno.do")
	public ModelAndView findProductDetailByPno(String pno) {
		ModelAndView mv=new ModelAndView();
		ProductVO pvo=productService.findProductDtailByPno(pno);
     	List<ProductDetailVO> clist=productService.findProductColorBypno(pno);
			mv.setViewName("product/productDetail.tiles");
			mv.addObject("clist", clist);
			mv.addObject("pvo", pvo);	
		return mv;
	}
	
	/* [석환][11/19][]
	 * 상품 디테일 page에서 pdno를 조건으로 
	 * 색상별 size를 JSON 형식으로 통신한다
	 */
	@RequestMapping("findProductDetailByColorAjax.do")
	@ResponseBody
	public List<ProductSizeVO> findProductDetailByColorAjax(String pcno){
 	List<ProductSizeVO> sizeList=productService.findProductDetailByColorAjax(pcno);
		return sizeList;
	}
	
	/**[][][]
	 * 
	 * @param psno
	 * @param pcno
	 * @return
	 */
	@RequestMapping("findProductDetailBySizeAjax.do")
	@ResponseBody
	public Object findProductDetailBySizeAjax(String psno,String pcno) {
		System.out.println("pnco :"+pcno);
		System.out.println("psno :"+psno);
		return null;
	}
}




















