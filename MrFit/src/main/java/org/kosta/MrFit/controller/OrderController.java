package org.kosta.MrFit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.GradeVO;
import org.kosta.MrFit.model.ImageVO;
import org.kosta.MrFit.model.ListVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.OrderProductVO;
import org.kosta.MrFit.model.OrderService;
import org.kosta.MrFit.model.OrderVO;
import org.kosta.MrFit.model.PagingBean;
import org.kosta.MrFit.model.ProductDetailVO;
import org.kosta.MrFit.model.ProductVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("    OrderController/cartForm()/진행1 Id : "+mvo.getId());
		OrderVO ovo = orderService.findMyCart(mvo.getId());
		System.out.println("    OrderController/cartForm()/진행2 ovo : "+ovo);
		if(ovo != null) {
			ovo.setMemberVO(mvo);
			return new ModelAndView("product/myCart.tiles", "ovo", ovo);
		}else {
			return new ModelAndView("product/myCart_fail.tiles"); 
		}//else
	}//method

	/**
	 * [정현][11/24][장바구니 담기]
	 *  해당 아이디에 장바구니가 있는지 조회후 
	 *  없으면 order에 주문번호를 생성해 주고 
	 *  order_Product에 어떤 상품을 주문했는지 생성한다.
	 *  만약 장바구니가 존재한다면 orders에서 총가격만 수정해준다.
	 * @param request
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@Transactional
	@RequestMapping("registerCart.do")
	public String registerCart(HttpServletRequest request,ProductVO productVO) {
		OrderVO ovo = new OrderVO(); 											//registerCart 생성을 위해 사용하는 객체들 생성 주문,주문상품,주문상품리스트,회원~
		OrderProductVO opvo = new OrderProductVO();
		List<OrderProductVO> opList = new ArrayList<OrderProductVO>();
		ProductDetailVO pdvo=new ProductDetailVO();
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//member security적용
		System.out.println("   	OrderController/registerCart()/진행 pno : "+productVO.getPno());
		int cartCount = orderService.findMyCartCount(mvo.getId());				// 장바구니에서 상품 담기 장바구니 상태의 주문이 있는지 확인
		int quantity =Integer.parseInt( request.getParameter("quantity")); 		// 상품 수량 기입 reqeust
		int price =quantity* Integer.parseInt(request.getParameter("price"));	// 수량*request상품가격 => 총상품가격 (변수명바꿀지?)		
		pdvo.setPcno(request.getParameter("pcno")); 							// 상품상세에 색상 사이즈 등 세팅 ~
		pdvo.setPsno(request.getParameter("psno"));
		pdvo.setPno(request.getParameter("pno"));
		opvo.setPdno(orderService.findPdno(pdvo));								// 주문 상품에 pdno와 수량 세팅	~
		opvo.setQuantity(quantity); 
		opList.add(opvo); 
		ovo.setOrderProductList(opList); 										// 주문에 주문상품 리스트와 총가격 회원정보 세팅~
		ovo.setTotalprice(price);
		ovo.setMemberVO(mvo);
		System.out.println("    OrderController/registerCart()/진행 ovo : " + ovo);
		if (cartCount==0) {
			orderService.registerOrder(ovo);
			orderService.registerOrderProduct(ovo);
			return "redirect:cartForm.do";
		} else {
			OrderProductVO opCount=orderService.findCartOderproduct(ovo);
			if(opCount==null) {
				orderService.updateOrder(ovo);
				orderService.registerOrderProduct(ovo);
				return "redirect:cartForm.do";
			}else {
				return "order/existOrder.tiles";
			}//else의 else
		}//else
	}//method

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
		OrderVO ovo = new OrderVO(); 					// 사용 객체 생성 주문,주문상품,주문상품리스트~
		OrderProductVO opvo = new OrderProductVO();
		List<OrderProductVO> opList = new ArrayList<OrderProductVO>();
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int quantity = Integer.parseInt( request.getParameter("quantity")); 
		int price =  Integer.parseInt(request.getParameter("price"));
		int Totalprice= quantity*price;					 // 삭제하는 상품 총가격 
		opvo.setPdno(request.getParameter("pdno"));		 // 주문상품에 request로 받아온 변수들 세팅~
		opvo.setQuantity(quantity); 
		opvo.setOno(request.getParameter("ono"));
		opList.add(opvo); 								//주문상품리스트 세팅
		ovo.setOno(request.getParameter("ono")); 		//주문에 변수들 세팅~
		ovo.setOrderProductList(opList);
		ovo.setTotalprice(-Totalprice);					// 주문의 총가격에서 삭제하는 상품 총가격 계산 후 세팅
		ovo.setMemberVO(mvo);
		System.out.println("   	OrderController/deleteCart()/진행 ovo : " + ovo);
		orderService.deleteOrderProduct(opvo);
		orderService.updateOrder(ovo);
		return "redirect:cartForm.do";
	}

	/**
	 * [현민][11/22][장바구니 상품 주문] 
	 * 장바구니에 담긴 상품을 주문하기 위해 상품들을 가져가는 기능 
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("orderForm.do")
	public String orderForm(Model model) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int point=orderService.findMemberPointById(mvo.getId());
		System.out.println("    OrderController/orderForm()/진행 id : "+mvo.getId());
		OrderVO ovo = orderService.findMyCart(mvo.getId());						
		System.out.println("    OrderController/orderForm()/진행 ovo : "+ovo);
		ovo.setMemberVO(mvo);
		model.addAttribute("ovo", ovo);
		model.addAttribute("point", point);
		return "order/orderForm.tiles";
	}

	/**
	 * [영훈][11/20][주문내역보기]
	 * 자신의 주문 내역을 리스트로 보여준다
	 * 추후
	 * 각각의 주문은 주문의 상세내역으로 이동해 주문상품 리스트를 보여줄 수 있다
	 * @param id
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("myOrderList.do")
	public ModelAndView myOrderList(String id, HttpServletRequest request) {
		int totalCount = orderService.getTotalMyOrderCount(id);
		int postCountPerPage = 10;					 						// 한 페이지에 보여줄 상품 개수
		int postCountPerPageGroup = 5;										// 한 페이지 그룹에 들어갈 페이지 개수
		int nowPage = 1;
		String pageNo = request.getParameter("pageNo");						// 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
		if(pageNo != null) {
			nowPage = Integer.parseInt(pageNo);
		}
		PagingBean pb = new PagingBean(totalCount,nowPage, postCountPerPage, postCountPerPageGroup);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pagingBean", pb);
		System.out.println("      OrderController/myOrderList()/진행 map : " + map);
		List<OrderVO> list = orderService.myOrderList(map);
		System.out.println("      OrderController/myOrderList()/진행 list : " + list);
		ListVO<OrderVO> lvo = new ListVO<OrderVO>(list,pb);
		return new ModelAndView("order/myOrderList.tiles", "lvo", lvo);
	}
	
	
	/**
	 * [영훈][11/20][주문상품리스트가져오기]
	 * 주문을 선택시 주문의 상세내역을 보여준다
	 * 상세내역은 주문의 주문상품 리스트이다
	 * 
	 *  상세내역의 각 주문상품에 리뷰작성 폼이 제공
	 *  리뷰작성 폼은 주문상태가 구매확정을 한 상태에서 가능 && 해당 상품에 리뷰를 작성을 하지 않은 경우에만 가능
	 *  아이디 주문번호 상품번호를 맵으로 매개변수로 사용하여 리뷰작성을 체크한다
	 *  동일한 맵을 매개변수로 사용하여 주문상태를 체크한다
	 *  if 주문상태가 구매확정인 경우를 체크하여 아닌경우는(0인경우)는 리뷰작성을 못하게 하기위해 
	 *  임의적으로 리뷰작성이 있는 것으로 간주하여(reviewCheck==1) 폼을 볼 수 없게 세팅
	 *  else 즉 주문상태가 구매확정인 경우에는 rewviwCheck 값을  list에 세팅 후 addObject한다
	 *  reviewCheck==0인 경우 리뷰작성하지 않음 => 리뷰 작성 허용
	 *  reviewCheck==1인 경우 리뷰작성 => 리뷰 작성 불허가 
	 * 
	 * @param ono
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("myOrderPrductList.do")
	public ModelAndView myOrderPrductList(String ono, String id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<OrderProductVO> list = orderService.myOrderPrductList(ono);							// 주문번호로 주문상품리스트 생성
		for(int i=0;i<list.size();i++) {
			System.out.println("      OrderController/myOrderPrductList()/진행 for문 "+i+" 번 시작");	// for문은 리뷰작성 폼에 조건 주기위해 필요(리뷰작성체크,주문상태체크) 
			Map<String, String> map = new HashMap<String, String>();								// id,ono,pdno를 이용해 맵 세팅 후 매개변수로 사용
			System.out.println("      OrderController/myOrderPrductList()/for문 id :" + id);
			map.put("id", id);						
			map.put("ono", ono);
			String pdno = list.get(i).getPdno();
			System.out.println("      OrderController/myOrderPrductList()/for문 pdno :" + pdno);
			map.put("pdno", pdno);
			int reviewCheck = orderService.reviewCheck(map);										
			System.out.println("      OrderController/myOrderPrductList()/for문 reviewCheck :" + reviewCheck);
			int statusCheck = orderService.statusCheck(map);
			System.out.println("      OrderController/myOrderPrductList()/for문 statusCheck :" + statusCheck);
			if(statusCheck==0) {																	
				list.get(i).setReviewCheck(1);														
			}else {																					
				list.get(i).setReviewCheck(reviewCheck);											
			}
			System.out.println("      OrderController/myOrderPrductList()/진행 for문 "+i+" 번 종료");
		}//for
		mv.addObject("list", list);
		mv.setViewName("order/myOrderProductList.tiles");
		return mv;
	}

	/**[석환][11.22][장바구니 수량 총 금액 수정]
	 * 
	 * @param opvo
	 * @return
	 */
	@RequestMapping("updateOrderQuantity.do")
	@ResponseBody
	public OrderProductVO updateOrderQuantity(OrderProductVO opvo) {
		System.out.println(opvo.getOno());
		int beforeQuantity=orderService.findBeforeQuantityByOnoAndPdno(opvo); //이전 수량
		int quantity=opvo.getQuantity();									  //변경될 수량
		int gapQuantity=quantity-beforeQuantity;							  //변결될 수량-이전 수량
		int updateTotalprice=opvo.getPrice()*gapQuantity;					  //차감될 totalprice
		OrderVO ovo=new OrderVO();
		ovo.setOno(opvo.getOno());
		ovo.setTotalprice(updateTotalprice);
		orderService.updateOrderCartTotalPrice(ovo);
		orderService.updateOrderQuantity(opvo);
		return opvo;
	}
	
	/**[석환][11.23][주문결제]
	 * 
	 * @param payPoint,depositMethod,ovo
	 * @return id=> vo.getId()
	 */
	@Transactional
	@RequestMapping("order.do")
	public String productOrderPayment(int payPoint,String depositMethod,OrderVO ovo,HttpServletRequest request) {
		MemberVO vo=(MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String[] pdno=request.getParameterValues("pdno");											// 상품상세번호 수량 배열 세팅
		String[] quantity=request.getParameterValues("quantity");
		System.out.println("      OrderController/productOrderPayment()/진행 사용포인트 : "+payPoint+" 사용자 아이디 주문결제 : "+vo.getId());
		System.out.println("      OrderController/productOrderPayment()/진행 totalprice : "+ovo.getTotalprice());
		int totalprice=ovo.getTotalprice()-payPoint;
		ovo.setTotalprice(totalprice);
		vo.setPoint(payPoint);
		ovo.setStatus(depositMethod);
		orderService.productOrderPayment(vo, payPoint, ovo);
		System.out.println("      OrderController/productOrderPayment()/진행 상품주문변경 : "+ovo);
		System.out.println("      OrderController/productOrderPayment()/진행 depositMethod : "+depositMethod);
		for(int i=0;i<pdno.length;i++) {
			System.out.println("      OrderController/productOrderPayment()/진행 for문 "+i+" 번 시작");
			ProductDetailVO pdvo=new ProductDetailVO();
			System.out.println("      OrderController/productOrderPayment()/진행 pdno"+pdno[i]);
			System.out.println(Integer.parseInt(quantity[i]));
			pdvo.setPdno(pdno[i]);
			pdvo.setInventory(Integer.parseInt(quantity[i]));
			orderService.updateProductDetailInventory(pdvo);
			System.out.println("      OrderController/productOrderPayment()/진행 for문 "+i+" 번 종료");
		}
		if(payPoint!=0) {
			Map<String, Object> map = new HashMap<String, Object>();				// 포인트 이력에 작성될 
			map.put("point", -payPoint);											// 사용 포인트 
			map.put("id", vo.getId());												// 회원 id를 
			orderService.reportPoint(map);											// 포인트 이력 작성
		}
		return "redirect:myOrderList.do?id="+vo.getId();
	}
	
	/**
	 * [영훈][11/24][회원 주문내역 상태변경]
	 * [석환][11/25][구매 확정시 포인트 및 멤버 총 토탈금액 수정]
	 * [현민][11/30][포인트 이력 작성]
	 * 회원이 주문완료시 주문상태를 구매확정으로 변경한다
	 * @param request
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@Transactional
	@RequestMapping("myOrderStatusChange.do")
	public String myOrderStatusChange(String ono,String id,int totalprice) {
		orderService.myOrderStatusChange(ono);									// 주문상태 변경
		MemberVO mvo = new MemberVO();											// 멤버, 등급 객체생성
		GradeVO gvo=new GradeVO();
		mvo.setId(id);
		mvo.setTotalSpent(totalprice);
		orderService.updateMemberTotalSpent(mvo);								// 구매확정시 총구매금액 업데이트
		String grade=orderService.findMemberGardeById(id);						// 회원 등급 찾기
		gvo.setGrade(grade);
		int percent=orderService.findMemberGradePointPercent(gvo.getGrade());	// 포인트 적립 비율 		
		mvo.setPoint(totalprice*percent/100);
		orderService.updateOrderMembetPoint(mvo);								// 구매확정시 멤버포인트 업데이트
		Map<String, Object> map = new HashMap<String, Object>();				// 포인트 이력에 작성될 
		map.put("point", totalprice*percent/100);								// 사용 포인트 
		map.put("id", mvo.getId());												// 회원 id를 
		orderService.reportPoint(map);											// 포인트 이력 작성
		
		int changeTotalSpent=orderService.findChangeTotalCount(mvo.getId());    // 변경된 회원 totalspent값 가져오기
		System.out.println(changeTotalSpent);
		if(changeTotalSpent>=500000) {			
			mvo.setTotalSpent(changeTotalSpent);
			mvo.setId(id);
			orderService.updateMemberGrade(mvo);
		}
		return "redirect:myOrderList.do?id="+id;
	}
	/**
	 * [석환][11/26][즉시구매 기능]
	 * @param quantity, pdvo, image
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("immediatelyPay.do")
	public String immediatelyPay(int quantity,ProductDetailVO pdvo,Model model) {
		String pdno=orderService.findPdno(pdvo);														
		ProductVO pvo=orderService.findProductDetailByPdno(pdno);									
		ProductDetailVO npdvo=orderService.findProductImmediatelyPay(pdno);
		System.out.println(pdvo.getPno());
		List<ImageVO> imageList=orderService.findProductImageByPdno(pdvo.getPno());
		String image=imageList.get(0).getUrl();
		System.out.println(image);
		int price=pvo.getPrice();
		int totalprice=quantity*price;
		MemberVO mvo=(MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int point=orderService.findMemberPointById(mvo.getId());
		OrderVO ovo=new OrderVO(null,totalprice,mvo.getAddress(),null,"즉시주문",mvo,null);
		orderService.immediatelyPayRegisterOrder(ovo);
		OrderProductVO opvo=new OrderProductVO();
		String ono=ovo.getOno();
		opvo.setOno(ono);
		opvo.setPdno(pdno);
		opvo.setQuantity(quantity);
		orderService.immediatelyPayRegisterOrderpProduct(opvo);
		
		model.addAttribute("image", image);
		model.addAttribute("totalprice", totalprice);
		model.addAttribute("pvo", pvo);
		model.addAttribute("pdvo", npdvo);
		model.addAttribute("quantity", quantity);
		model.addAttribute("ono", ono);
		model.addAttribute("point", point);
		return "order/immediatelyOrderForm.tiles";
	}
	
	/**
	 * [석환][11.27] 즉시 구매 취소시 관련 테이블 삭제
	 * @param quantity, pdvo, image
	 * @return
	 */
	@Transactional
	@Secured("ROLE_MEMBER")
	@RequestMapping("immediatelyPayOrderCancle.do")
	public String immediatelyPayOrderCancle(OrderProductVO opvo) {
		System.out.println("      OrderController/immediatelyPayOrderCancle()/진행 즉시 구매 pdno : "+opvo.getPdno()+" 즉시 구매 ono : "+opvo.getOno());
		orderService.deleteImmediatelyPayOrdersProduct(opvo);
		orderService.deleteImmediatelyPayOrders(opvo);
		return "redirect:home.do";
	}
	
	
	@RequestMapping(value="kakaoPayComplete.do", method=RequestMethod.POST)
	//@RequestMapping("kakaoPayComplete.do")
	@ResponseBody
	public HashMap<String, String> kakaoPayComplete(String imp_uid) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("imp_uid", imp_uid);
		System.out.println("      @@@@@ 카카오페이 로그 : "+imp_uid);
		return map;
	}
}
