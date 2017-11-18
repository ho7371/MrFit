package org.kosta.MrFit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.MrFit.model.ImageVO;
import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@Resource
	private ProductService productService;
	// 주석 샘플
	/** 1. 메소드 주석은 꼭 구현 완료 후 작성한다.
	 *  2. 다른 사람이 작성한 코드를 변경해야 할 경우, 원본은 주석처리 후 복사하여 사용한다.
	 *  3. 다른 기능/메소드로 매개변수를 던지는 경우, 해당 문서에 매개변수를 명시해준다.
	 *  4. 하루 작업한 것은 꼭 push를 한다.
	 *  
	 * @return
	 */
	@RequestMapping("home.do")
	public String home(Model model){
		System.out.println("      HomeController/home()/시작");
		List<ProductVO> ProductList=productService.ProductList();		
		System.out.println("      HomeController/home()/진행"+ProductList);		
		if(ProductList!=null&&!ProductList.isEmpty()) {
			model.addAttribute("ProductList",ProductList);
			System.out.println("      HomeController/home()/종료");
			return "home.tiles";
		}else {
			System.out.println("      HomeController/home()/종료");
			return "home.tiles";
		}
	}
	
	/*@RequestMapping("{viewName}.do")
	public String showView(@PathVariable String viewName){
		return viewName+".tiles";
	}
	
	@RequestMapping("{dirName}/{viewName}.do")
	public String showView(@PathVariable String dirName,@PathVariable String viewName){
		return dirName+"/"+viewName+".tiles";
	}	*/
	
	@RequestMapping("contact.do")
	public String contact(){
		System.out.println("      HomeController/contact()/시작");
		System.out.println("      HomeController/contact()/진행");
		System.out.println("      HomeController/contact()/종료");
		return "contact.tiles";
	}
	
	@RequestMapping("notice.do")
	public String notice(){
		System.out.println("      HomeController/notice()/시작");
		System.out.println("      HomeController/notice()/진행");
		System.out.println("      HomeController/notice()/종료");
		return "notice.tiles";
	}
	
}
