package org.kosta.MrFit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.PagingBean;
import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@Resource
	private ProductService productService;
	private PagingBean pb;

	@RequestMapping("adminPage.do")
	public String adminPage() {
		System.out.println("   	AdminController/adminPage()/시작");
		return "admin/adminPage.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminProductList.do")
	public String adminProductList(HttpServletRequest request, Model model) {
		System.out.println("   	AdminController/adminProductList()/시작");
		
		int pbCount=productService.getTotalProductCount();
		String pno=request.getParameter("pageNo");
		System.out.println("      AdminController/adminProductList()/진행1");
		if(pno==null){
			pb = new PagingBean(pbCount);
		}else{
			pb = new PagingBean(pbCount,Integer.parseInt(pno));
		}
		List<ProductVO> ProductList=productService.ProductList(pb);
		System.out.println("      AdminController/adminProductList()/진행2 - pno:"+pno+", 상품목록:"+ProductList);		
		
		if(ProductList!=null&&!ProductList.isEmpty()) {
			model.addAttribute("ProductList",ProductList);
			model.addAttribute("pb",pb);
		}
		System.out.println("      AdminController/adminProductList()/종료");
		return "admin/adminProductList.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/registerProductForm.do")
	public String registerProductForm() {
		System.out.println("   	AdminController/registerProduct()/시작");
		return "admin/registerProductForm.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/updateProductForm.do")
	public String updateProductForm() {
		System.out.println("   	AdminController/updateProductForm()/시작");
		return "admin/updateProductForm.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/deleteProduct.do")
	public String deleteProduct(String pno) {
		System.out.println("   	AdminController/deleteProduct()/시작");
		// 현재는 null
		return null;
	}
	
}
