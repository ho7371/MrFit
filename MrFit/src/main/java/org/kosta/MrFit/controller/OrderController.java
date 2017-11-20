package org.kosta.MrFit.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.OrderService;
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
}
