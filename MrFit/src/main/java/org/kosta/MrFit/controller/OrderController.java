package org.kosta.MrFit.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.MrFit.model.MemberVO;
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
		System.out.println(mvo.getId());
		System.out.println("    OrderController/cartForm()/진행1");
		List<OrderVO> ovoList = orderService.findMyCart(mvo.getId());
		System.out.println("    OrderController/cartForm()/진행2");
		for (int i = 0; i < ovoList.size(); i++) {
			ovoList.get(i).setMemberVO(mvo);
		}
		System.out.println("    OrderController/cartForm()/진행3 ovoList : "+ovoList);
		System.out.println("    OrderController/cartForm()/종료");
		return new ModelAndView("product/myCart.tiles","ovoList",ovoList);
	}
}
