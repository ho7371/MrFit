package org.kosta.MrFit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.GradeVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.OrderProductVO;
import org.kosta.MrFit.model.OrderService;
import org.kosta.MrFit.model.OrderVO;
import org.kosta.MrFit.model.ProductDetailVO;
import org.kosta.MrFit.model.ProductReviewVO;
import org.kosta.MrFit.model.ProductVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	@Resource
	private OrderService orderService;

	/**
	 * [현민][11/21][16:10] 
	 * 장바구니 보기 기능 회원의 아이디로 
	 * 회원이 장바구니에 담은 상품들을 불러온다 
	 * 그 후 회원의 정보를 사용할
	 * 수 있도록 회원 정보도 set해준다. 
	 * 그 다음 list로 반환 한다.
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("cartForm.do")
	public ModelAndView cartForm() {
		System.out.println("   	OrderController/cartForm()/시작");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(mvo.getId());
		System.out.println("    OrderController/cartForm()/진행1");
		OrderVO ovo = orderService.findMyCart(mvo.getId());
		System.out.println("    OrderController/cartForm()/진행2");
		if(ovo != null) {
			ovo.setMemberVO(mvo);
			System.out.println("    OrderController/cartForm()/진행3 ovo : " + ovo);
			System.out.println("    OrderController/cartForm()/종료");
			return new ModelAndView("product/myCart.tiles", "ovo", ovo);
		}else {
			return new ModelAndView("product/myCart_fail.tiles"); 
		}
	}

	/**
	 * [정현][11/24][장바구니 담기]
	 *  해당 아이디에 장바구니가 있는지 조회후 
	 *  없으면 order에 주문번호를 생성해 주고 
	 *  order_Product에 어떤 상품을 주문했는지 생성한다.
	 *  만약 장바구니가 존재한다면 orders에서 총가격만 수정해준다.
	 * @param request
	 * @return
	 */
	@Transactional
	@RequestMapping("registerCart.do")
	public String registerCart(HttpServletRequest request,ProductVO prodeuctVO) {
		System.out.println("   	OrderController/registerCart()/시작");
		OrderVO ovo = new OrderVO();
		OrderProductVO opvo = new OrderProductVO();
		List<OrderProductVO> opList = new ArrayList<OrderProductVO>();
			
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		int cartCount = orderService.findMyCartCount(mvo.getId());

		int quantity =Integer.parseInt( request.getParameter("quantity"));
		
		int price =quantity* Integer.parseInt(request.getParameter("price"));			
			
			ProductDetailVO pdvo=new ProductDetailVO();
			pdvo.setPcno(request.getParameter("pcno"));
			pdvo.setPsno(request.getParameter("psno"));
			
		opvo.setPdno(orderService.findPdno(pdvo));		
		opvo.setQuantity(quantity);
		opList.add(opvo);
		ovo.setOrderProductList(opList);
		
		ovo.setTotalprice(price);
		ovo.setMemberVO(mvo);
		
		System.out.println("    OrderController/registerCart()/진행 ovo : " + ovo);
		if (cartCount==0) {
			orderService.registerOrder(ovo);
			orderService.registerOrderProduct(ovo);
			System.out.println("    OrderController/registerCart()/종료");
			return "redirect:cartForm.do";
		} else {
			OrderProductVO opCount=orderService.findCartOderproduct(ovo);
			if(opCount==null) {
				orderService.updateOrder(ovo);
				orderService.registerOrderProduct(ovo);
				System.out.println("    OrderController/registerCart()/종료");
				return "redirect:cartForm.do";
			}else {
				
				System.out.println("    OrderController/registerCart()/종료");
				return "order/existOrder.tiles";
			}
		}
		
	}

	/**
	 * [정현][11/24][장바구니삭제]
	 * order_product에서 해당 데이터를 삭제하고
	 * orders에서 가격을 계산해준다. 
	 * @param request
	 * @return
	 */
	@Transactional
	@RequestMapping("deleteCart.do")
	public String deleteCart(HttpServletRequest request,OrderProductVO orpvo) {
		System.out.println("   	OrderController/deleteCart()/시작");
		OrderVO ovo = new OrderVO();
		OrderProductVO opvo = new OrderProductVO();
		List<OrderProductVO> opList = new ArrayList<OrderProductVO>();
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int quantity = Integer.parseInt( request.getParameter("quantity"));
		int price =  Integer.parseInt(request.getParameter("price"));
				
		int Totalprice= quantity*price;
		opvo.setPdno(request.getParameter("pdno"));
		opvo.setQuantity(quantity);
		opvo.setOno(request.getParameter("ono"));
		opList.add(opvo);		
		ovo.setOno(request.getParameter("ono"));
		ovo.setOrderProductList(opList);
		ovo.setTotalprice(-Totalprice);
		ovo.setMemberVO(mvo);
		System.out.println("   	OrderController/deleteCart()/진행 ovo : " + ovo);
		orderService.deleteOrderProduct(opvo);
		orderService.updateOrder(ovo);

		System.out.println("   	OrderController/deleteCart()/종료");

		return "redirect:cartForm.do";
	}

	/**
	 * [현민][11/22][장바구니 상품 주문] 
	 * 장바구니에 담긴 상품을 주문하기 위해 상품들을 가져가는 기능
	 * 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("orderForm.do")
	public ModelAndView orderForm() {
		System.out.println("   	OrderController/orderForm()/시작");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(mvo.getId());
		System.out.println("    OrderController/orderForm()/진행1");
		OrderVO ovo = orderService.findMyCart(mvo.getId());
		System.out.println("    OrderController/orderForm()/진행2");
		ovo.setMemberVO(mvo);
		System.out.println("    OrderController/orderForm()/진행3 ovo : " + ovo);
		System.out.println("    OrderController/orderForm()/종료");
		return new ModelAndView("order/orderForm.tiles", "ovo", ovo);
	}

	/**
	 * [영훈][][주문내역보기]
	 * 
	 * @param id
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("myOrderList.do")
	public ModelAndView myOrderList(String id) {
		System.out.println("      OrderController/myOrderList()/시작");
		List<OrderVO> list = orderService.myOrderList(id);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getStatus().equals("장바구니")) {
				list.remove(i);
			}
		}
		System.out.println("      OrderController/myOrderList()/중간" + list);
		return new ModelAndView("order/myOrderList.tiles", "list", list);
	}
	
	
	/**
	 * [영훈][][주문상품리스트가져오기]
	 * @param ono
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("myOrderPrductList.do")
	public ModelAndView myOrderPrductList(String ono) {
		ModelAndView mv = new ModelAndView();
		System.out.println("      OrderController/myOrderPrductList()/시작");
		List<OrderProductVO> list = orderService.myOrderPrductList(ono);
		System.out.println("      OrderController/myOrderPrductList()/중간" + list);
		mv.addObject("list", list);
		mv.setViewName("order/myOrderProductList.tiles");
		return mv;
	}

	/**[석환][11.22][장바구니 수량 수정]
	 * 
	 * @param opvo
	 * @return
	 */
	@RequestMapping("updateOrderQuantity.do")
	public String updateOrderQuantity(OrderProductVO opvo) {
		System.out.println("주문번호 : "+opvo.getOno()+"가격 : "+opvo.getPrice()+"수량 : "+opvo.getQuantity());
		System.out.println("총 가격 :"+(opvo.getPrice()*opvo.getQuantity()) );
		int totalprice=opvo.getPrice()*opvo.getQuantity();
		OrderVO ovo=new OrderVO();
		ovo.setOno(opvo.getOno());
		ovo.setTotalprice(totalprice);
		orderService.updateOrderCartTotalPrice(ovo);
		orderService.updateOrderQuantity(opvo);
		return "redirect:cartForm.do";
	}
	/* [석환][11.23][주문결제]
	 * 
	 */
	@Transactional
	@RequestMapping("order.do")
	public String productOrderPayment(int payPoint,int depositMethod,OrderVO ovo,HttpServletRequest request) {
		MemberVO vo=(MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String[] pdno=request.getParameterValues("pdno");
		String[] quantity=request.getParameterValues("quantity");
		System.out.println("사용 포인트 : "+payPoint+" 사용자 아이디 주문결제 : "+vo.getId());
		System.out.println("totalprice : "+ovo.getTotalprice());
		vo.setPoint(payPoint);
		orderService.productOrderPayment(vo, payPoint, depositMethod, ovo);
		System.out.println("상품주문 변경 :  "+ovo);
		System.out.println(depositMethod);
		for(int i=0;i<pdno.length;i++) {
			ProductDetailVO pdvo=new ProductDetailVO();
			System.out.println(pdno[i]);
			System.out.println(Integer.parseInt(quantity[i]));
			pdvo.setPdno(pdno[i]);
			pdvo.setInventory(Integer.parseInt(quantity[i]));
			orderService.updateProductDetailInventory(pdvo);
			
		}
		return "redirect:myOrderList.do?id="+vo.getId();
	}
	
	/**
	 * [영훈][11/24][회원 주문내역 상태변경]
	 * [석환][11/25][구매 확정시 포인트 및 멤버 총 토탈금액 수정]
	 * @param request
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@Transactional
	@RequestMapping("myOrderStatusChange.do")
	public String myOrderStatusChange(String ono,String id,int totalprice) {
		orderService.myOrderStatusChange(ono);
		MemberVO mvo = new MemberVO();
		GradeVO gvo=new GradeVO();
		mvo.setId(id);
		mvo.setTotalSpent(totalprice);
		orderService.updateMemberTotalSpent(mvo);
		//회원 등급 찾기		
		String grade=orderService.findMemberGardeById(id);
		gvo.setGrade(grade);
		//포인트 적립 비율 
		int percent=orderService.findMemberGradePointPercent(gvo.getGrade());		
		mvo.setPoint(totalprice*percent/100);
		orderService.updateOrderMembetPoint(mvo);
		return "redirect:myOrderList.do?id="+id;
	}
	
	@RequestMapping("reviewCheckAjax.do")
	@ResponseBody
	public String reviewCheckAjax(ProductReviewVO rvo) {
		System.out.println("   	OrderController/reviewCheckAjax()/시작 rvo:"+rvo);
		String message = orderService.reviewCheckAjax(rvo);
		System.out.println("   	OrderController/reviewCheckAjax()/종료 message:"+message);
		return message;
	}
	
	
	
}
