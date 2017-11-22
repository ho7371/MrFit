package org.kosta.MrFit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.OrderProductVO;
import org.kosta.MrFit.model.OrderService;
import org.kosta.MrFit.model.OrderVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	@Resource
	private OrderService orderService;
	
	/**[현민][11/21][16:10]
	 * 장바구니 보기 기능
	 * 회원의 아이디로 회원이 장바구니에 담은 상품들을 불러온다
	 * 그 후 회원의 정보를 사용할 수 있도록 회원 정보도 set해준다.
	 * 그 다음 list로 반환 한다.
	 * @return
	 */
	@Secured("ROLE_MEMBER")
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
		ovo.setOrderProductList(opList);
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
		ovo.setOrderProductList(opList);
		ovo.setTotalprice(-price);
		ovo.setMemberVO(mvo);
		System.out.println("   	OrderController/deleteCart()/진행 map : "+ovo);
		
		orderService.updateOrder(ovo);
		orderService.deleteOrderProduct(ovo);
			
		System.out.println("   	OrderController/deleteCart()/종료");
		
		return "cartForm.do";
	}
	
	@Secured("ROLE_MEMBER")
	   @RequestMapping("myOrderList.do")
	   public ModelAndView myOrderList(String id) {
	      System.out.println("      OrderController/myOrderList()/시작");
	      List<OrderVO> list = orderService.myOrderList(id);
	      System.out.println("      OrderController/myOrderList()/중간"+list);
	      return new ModelAndView("order/myOrderList.tiles","list",list);
	   }
	   
	   @Secured("ROLE_MEMBER")
	   @RequestMapping("myOrderPrductList.do")
	   public ModelAndView myOrderPrductList(String ono) {
	      System.out.println("      OrderController/myOrderPrductList()/시작");
	      List<OrderProductVO> list = orderService.myOrderPrductList(ono);
	      System.out.println("      OrderController/myOrderPrductList()/중간"+list);
	      return new ModelAndView("order/myOrderProductList.tiles","list",list);
	   }
		//[석환][11.22][장바구니 수량 수정]
		@RequestMapping("updateOrderQuantity.do")
		public String updateOrderQuantity(OrderProductVO opvo) {
			orderService.updateOrderQuantity(opvo);
			return "redirect:cartForm.do";
		}
		
	
	
	
	
	
	
	
}
