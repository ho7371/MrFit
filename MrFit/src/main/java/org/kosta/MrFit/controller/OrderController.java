package org.kosta.MrFit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.OrderProductVO;
import org.kosta.MrFit.model.OrderService;
import org.kosta.MrFit.model.OrderVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	@Resource
	private OrderService orderService;
	
	
	@RequestMapping("cartForm.do")
	public ModelAndView cartForm() {
		System.out.println("   	OrderController/cartForm()/시작");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("    OrderController/cartForm()/진행");
		//List<OrderVO> ovoList = orderService.findMyCart(mvo.getId());
		Map<String, Object> ovoList = orderService.findMyCart(mvo.getId());
		System.out.println("    OrderController/cartForm()/종료");
		return new ModelAndView("product/myCart","list",ovoList);
	}
	// 11/20 정현 장바구니 담기 
	
	@RequestMapping("registerCart.do")
	public String registerCart(HttpServletRequest request) {
		System.out.println("   	OrderController/registerCart()/시작");
		OrderVO ovo = new OrderVO();
		OrderProductVO opvo=new OrderProductVO();
		 List<OrderProductVO> opList=new ArrayList<OrderProductVO>();
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		int cartCount = orderService.findMyCartCount(mvo.getId());
				
		int quantity=(int) request.getAttribute("quantity");
		int price=(int) request.getAttribute("price");
		String pdno=(String) request.getAttribute("pdno");
		
		opvo.setPdno(pdno);
		opvo.setQuantity(quantity);		
		opList.add(opvo);
		ovo.setOpList(opList);
		ovo.setTotalprice(price);
		ovo.setMemberVO(mvo);
		System.out.println("    OrderController/registerCart()/진행 ovo : "+ovo);
		if(cartCount==0) {
			orderService.registerOrder(ovo);
			orderService.registerOrderProduct(ovo);
		}else {
			orderService.updateOrder(ovo);
			orderService.registerOrderProduct(ovo);
		}
		System.out.println("    OrderController/registerCart()/종료");
		return "cartForm.do";
	}
	
	
	
	@RequestMapping("deleteCart.do")
	public String deleteCart(HttpServletRequest request) {
		System.out.println("   	OrderController/deleteCart()/시작");
		OrderVO ovo =new OrderVO();
		OrderProductVO opvo=new OrderProductVO();
		 List<OrderProductVO> opList=new ArrayList<OrderProductVO>();
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
		int quantity=(int) request.getAttribute("quantity");
		int price=(int) request.getAttribute("price");
		String pdno=(String) request.getAttribute("pdno");
		
		opvo.setPdno(pdno);
		opvo.setQuantity(quantity);
		
		opList.add(opvo);
		ovo.setOpList(opList);
		ovo.setTotalprice(-price);
		ovo.setMemberVO(mvo);
		System.out.println("   	OrderController/deleteCart()/진행 map : "+ovo);
		
		orderService.updateOrder(ovo);
		orderService.deleteOrderProduct(ovo);
			
		System.out.println("   	OrderController/deleteCart()/종료");
		
		return "cartForm.do";
	}
	
	
	
	
	
	
	
	
	
	
}
