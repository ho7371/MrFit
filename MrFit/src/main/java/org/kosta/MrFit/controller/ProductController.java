package org.kosta.MrFit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductSizeVO;
import org.kosta.MrFit.model.ProductVO;
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
	
	// @Secured("ROLE_MEMBER")
	@RequestMapping("registerProductAction.do")
	public ModelAndView registerProduct(){
		System.out.println("   	ProductController/registerProduct()/시작");
		System.out.println("    ProductController/registerProduct()/진행");
		System.out.println("    ProductController/registerProduct()/종료");
		return null;
	}
	
	@RequestMapping("findProductByName.do")
	public ModelAndView findProductByName(String keyword){
		System.out.println("   	ProductController/registerProduct()/시작");
		ModelAndView mv = new ModelAndView();
		List<ProductVO> list = productService.findProductByName(keyword);
		System.out.println("    ProductController/registerProduct()/진행");
		if(!list.isEmpty()) {
			mv.setViewName("product/findProductByName_ok");
			mv.addObject("list", list);
		}else {
			mv.setViewName("prodcut/findProductByName_fail");
		}
		System.out.println("    ProductController/registerProduct()/종료");
		return mv;
	}
	/*
	 * 상품 번호로 상품의 상세정보 페이지 이동
	 */
	@RequestMapping("findProductDetailByPno.do")
	public ModelAndView findProductDetailByPno(String pno) {
		ModelAndView mv=new ModelAndView();
		ProductVO pvo=productService.findProductDtailByPno(pno);
			mv.setViewName("product/productDetail.tiles");
			mv.addObject("pvo", pvo);	
		return mv;
	}
	/*
	 * 상품 디테일 page에서 pdno를 조건으로 
	 * 색상별 size를 JSON 형식으로 통신한다
	 */
	
	@RequestMapping("findProductDetailByColorAjax.do")
	@ResponseBody
	public List<ProductSizeVO> findProductDetailByColorAjax(String pdno){
		List<ProductSizeVO> sizeList=productService.findProductDetailByColorAjax(pdno);
		return sizeList;
	}
}




















