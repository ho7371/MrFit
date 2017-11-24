package org.kosta.MrFit.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderDAO orderDAO;
	
	@Override
	public List<OrderVO> findMyCart(String id) {
		System.out.println("            OrderServiceImpl/findMyCart()/시작");
		return orderDAO.findMyCart(id);
	}
	
	@Override
	public List<OrderVO> myOrderList(String id){
		return orderDAO.myOrderList(id);
	}
	
	@Override
	public List<OrderProductVO> myOrderPrductList(String ono){
		return orderDAO.myOrderPrductList(ono);
	}

	@Override
	public int findMyCartCount(String id) {
		System.out.println("            OrderServiceImpl/findMyCart()/시작");
		int cartCount= orderDAO.findMyCartCount(id);
		System.out.println("            OrderServiceImpl/findMyCart()/종료 - map :"+cartCount);
		return cartCount;
	}

	@Override
	public void registerOrder(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/registerOrder()/시작 ovo : "+ovo);
		orderDAO.registerOrder(ovo);
		System.out.println("            OrderServiceImpl/registerOrder()/종료");
	}

	@Override
	public void registerOrderProduct(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/registerOrderProduct()/시작 ovo : "+ ovo);
		orderDAO.registerOrderProduct(ovo);
		System.out.println("            OrderServiceImpl/registerOrderProduct()/종료");
	}

	@Override
	public void updateOrder(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/updateOrder()/시작 ovo : "+ ovo);
		orderDAO.updateOrder(ovo);
		System.out.println("            OrderServiceImpl/updateOrder()/종료");
	}

	
	//[김석환][2017.11.22][장바구니 상품 수량 수정]
	@Override
	public void updateOrderQuantity(OrderProductVO opvo) {
		orderDAO.updateOrderQuantity(opvo);
	}

	@Override
	public OrderProductVO findCartOderproduct(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/findCartOderproduct()/진행 ovo : "+ ovo);
		OrderProductVO opCount=orderDAO.findCartOderproduct(ovo);
		System.out.println("            OrderServiceImpl/findCartOderproduct()/종료 opCount : "+ opCount);
		return opCount;		
		
	}

	@Override
	public void deleteOrderProduct(OrderProductVO opvo) {
		
		System.out.println("            OrderServiceImpl/deleteOrderProduct()/시작 ovo : "+ opvo);
		orderDAO.deleteOrderProduct(opvo);
		System.out.println("            OrderServiceImpl/deleteOrderProduct()/종료");
	}

	@Override
	public String findPdno(ProductDetailVO pdvo) {
		System.out.println("            OrderServiceImpl/findPdno()/시작 pdvo : "+ pdvo);
		String pdno=orderDAO.findPdno(pdvo);
		System.out.println("            OrderServiceImpl/findPdno()/종료");
		return pdno;
	}
	//[석환][11.23] 주문 결제
	@Transactional
	@Override
	public OrderVO productOrderPayment(MemberVO vo,int payPoint,int depositMethod,OrderVO ovo) {
		//상품 구매시 포인트 차감
		orderDAO.updatePointOrder(vo);
		//무통장 입금시 입금대기로 변경
		if(depositMethod==1) {
		orderDAO.updateStatusOrder(ovo);
		}	
		//무통장 외 입금시 배송준비중으로 변경
		orderDAO.updateStatusOrderEtc(ovo);
		return null;
	}
	
}
