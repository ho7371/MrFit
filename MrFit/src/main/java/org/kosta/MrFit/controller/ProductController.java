package org.kosta.MrFit.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
}




















