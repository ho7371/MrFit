package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderDAO orderDAO;

	// [현민][11/21][장바구니 보기]
	@Override
	public OrderVO findMyCart(String id) {
		return orderDAO.findMyCart(id);
	}

	// [영훈][2017.11.24][회원 주문내역 리스트]
	@Override
	public List<OrderVO> myOrderList(Map<String, Object> map) {
		return orderDAO.myOrderList(map);
	}

	// [영훈][2017.11.24][회원 주문상품내역 리스트]
	@Override
	public List<OrderProductVO> myOrderPrductList(String ono) {
		return orderDAO.myOrderPrductList(ono);
	}

	// [정현][11/24] 장바구니가 존재하는지 체크
	@Override
	public int findMyCartCount(String id) {
		int cartCount = orderDAO.findMyCartCount(id);
		System.out.println("            OrderServiceImpl/findMyCart()/종료 - map :" + cartCount);
		return cartCount;
	}

	// [정현][11/24] 주문 생성
	@Override
	public void registerOrder(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/registerOrder()/시작 ovo : " + ovo);
		orderDAO.registerOrder(ovo);
	}

	// [정현][11/24] 주문과 상품 상세 정보를 엮어 주문 수량을 저장
	@Override
	public void registerOrderProduct(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/registerOrderProduct()/시작 ovo : " + ovo);
		orderDAO.registerOrderProduct(ovo);
	}

	// [정현][11/24] 주문에서 총가격을 수정하여 준다.
	@Override
	public void updateOrder(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/updateOrder()/시작 ovo : " + ovo);
		orderDAO.updateOrder(ovo);
	}

	// [김석환][2017.11.22][장바구니 상품 수량 수정]
	@Override
	public void updateOrderQuantity(OrderProductVO opvo) {
		orderDAO.updateOrderQuantity(opvo);
	}

	// [정현][11/24] 주문에 해당 주문 정보가 있는지 체크해서 있으면 그값을 리턴해준다.
	@Override
	public OrderProductVO findCartOderproduct(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/findCartOderproduct()/진행 ovo : " + ovo);
		OrderProductVO opCount = orderDAO.findCartOderproduct(ovo);
		System.out.println("            OrderServiceImpl/findCartOderproduct()/종료 opCount : " + opCount);
		return opCount;

	}

	// [정현][11/24] 주문 상품상세에서 해당 정보를 삭제한다.
	@Override
	public void deleteOrderProduct(OrderProductVO opvo) {

		System.out.println("            OrderServiceImpl/deleteOrderProduct()/시작 ovo : " + opvo);
		orderDAO.deleteOrderProduct(opvo);
	}

	// [정현][11/24] pcno와psno를 통하여 pdno를 찾는다.
	@Override
	public String findPdno(ProductDetailVO pdvo) {
		System.out.println("            OrderServiceImpl/findPdno()/시작 pdvo : " + pdvo);
		String pdno = orderDAO.findPdno(pdvo);
		return pdno;
	}

	// [석환][11.23] 주문 결제
	@Transactional
	@Override
	public void productOrderPayment(MemberVO vo, int payPoint, int depositMethod, OrderVO ovo) {
		// 상품 구매시 포인트 차감
		orderDAO.updatePointOrder(vo);
		// 무통장 입금시 입금대기로 변경
		if (depositMethod == 1) {
			orderDAO.updateStatusOrder(ovo);
		}else
		// 무통장 외 입금시 배송준비중으로 변경
		orderDAO.updateStatusOrderEtc(ovo);
	}

	// [영훈][2017.11.21][회원 주문내역 상태변경]
	@Override
	public void myOrderStatusChange(String ono) {
		orderDAO.myOrderStatusChange(ono);
	}

	// [영훈][2017.11.25][회원 주문상품의 주문상태 체크]
	@Override
	public String checkOrderProductStatus(String ono) {
		return orderDAO.checkOrderProductStatus(ono);
	}

	// [영훈][2017.11.25][회원 상품리뷰 작성 폼으로(pdVO객체)]
	@Override
	public ProductReviewVO orderProductReviewForm(String pdno) {
		return orderDAO.orderProductReviewForm(pdno);
	}
		//[영훈][11.27]리뷰작성 주문상태확인
		@Override
		public int statusCheck(Map<String, String> map) {
			System.out.println("            OrderServiceImpl/statusCheck()/시작 map : "+ map);
			return orderDAO.statusCheck(map);
		}

	// [석환][11.25]장바구니 수정시 총금액 변경
	@Override
	public void updateOrderCartTotalPrice(OrderVO ovo) {
		orderDAO.updateOrderCartTotalPrice(ovo);
	}

	// [석환][11/25][멤버 총 토탈금액 수정]
	@Override
	public void updateMemberTotalSpent(MemberVO mvo) {
		orderDAO.updateMemberTotalSpent(mvo);
	}

	// [석환][11.25]회원 등급 퍼센트 비율 검색
	@Override
	public int findMemberGradePointPercent(String grade) {
		return orderDAO.findMemberGradePointPercent(grade);
	}

	// [석환[11.25]구매 후 회원 포인트 업데이트
	@Override
	public void updateOrderMembetPoint(MemberVO mvo) {
		orderDAO.updateOrderMembetPoint(mvo);
	}

	// [석환][11.25]구매 시 회원 등급 찾기
	@Override
	public String findMemberGardeById(String id) {
		return orderDAO.findMemberGardeById(id);
	}

	// [석환][11.25]구매 시 상품재고 업데이트
	@Override
	public void updateProductDetailInventory(ProductDetailVO pdvo) {
		orderDAO.updateProductDetailInventory(pdvo);
	}

	// [영훈][11.27]리뷰작성 확인 Ajax
	@Override
	public int reviewCheck(Map<String, String> map) {
		System.out.println("            OrderServiceImpl/reviewCheck()/시작 map : " + map);
		return orderDAO.reviewCheck(map);
	}

	// [석환][11.27] 즉시 구매시 pdno 검색
	@Override
	public ProductVO findProductDetailByPdno(String pdno) {
		return orderDAO.findProductDetailByPdno(pdno);
	}

	// [석환][11.27] 즉시 구매시 orders 테이블 등록
	@Override
	public void immediatelyPayRegisterOrder(OrderVO ovo) {
		orderDAO.immediatelyPayRegisterOrder(ovo);
	}

	// [석환][11.27] 즉시 구매시 orders_product 테이블 등록
	@Override
	public void immediatelyPayRegisterOrderpProduct(OrderProductVO opvo) {
		orderDAO.immediatelyPayRegisterOrderpProduct(opvo);
	}

	// [석환][11.27] 즉시 구매시 상품검색
	@Override
	public ProductDetailVO findProductImmediatelyPay(String pdno) {
		return orderDAO.findProductImmediatelyPay(pdno);
	}

	// [석환][11.27] 즉시 구매 취소 시 orders_product 테이블 삭제
	@Override
	public void deleteImmediatelyPayOrdersProduct(OrderProductVO opvo) {
		orderDAO.deleteImmediatelyPayOrdersProduct(opvo);
	}

	// [석환][11.27] 즉시 구매 취소 시 orders 테이블 삭제
	@Override
	public void deleteImmediatelyPayOrders(OrderProductVO opvo) {
		orderDAO.deleteImmediatelyPayOrders(opvo);
	}
	// [석환][11.27] 즉시 결제 취소시 home.do 에서 즉시 결제 값 삭제
	@Override
	public void findImmediatelyPayGarbage(String id) {
		List<OrderVO> olist=orderDAO.findImmediatelyPayGarbage(id);

		for(int i=0;i<olist.size();i++) {
			if(olist.get(i).getStatus().equals("즉시결제")) {
				orderDAO.deleteImmediatelyPayGarbageOrdersProduct(olist.get(i).getOno());
				orderDAO.deleteImmediatelyPayGarbageOrders(olist.get(i).getOno());
			}
		}
	}
	// [석환][11.29] 장바구니 수량 수정시 이전 수량 검색
	@Override
	public int findBeforeQuantityByOnoAndPdno(OrderProductVO opvo) {
		return orderDAO.findBeforeQuantityByOnoAndPdno(opvo);
	}
	// [석환][11.29] 즉시 구매 이미지
	@Override
	public List<ImageVO> findProductImageByPdno(String pno) {
		return orderDAO.findProductImageByPdno(pno);
	}
	// [석환][11.29] 회원 포인트 
	@Override
	public int findMemberPointById(String id) {
		return orderDAO.findMemberPointById(id);
	}

	@Override
	public void reportPoint(Map<String, Object> map) {
		orderDAO.reportPoint(map);
	}
	// [영훈][11/30] 회원 주문 총건수
	@Override
	public int getTotalMyOrderCount(String id) {
		return orderDAO.getTotalMyOrderCount(id);
	}
	// [영훈][11/30] 회원 주문의 주문상품 총개수
	@Override
	public int getTotalMyOrderProductCount(String ono) {
		return orderDAO.getTotalMyOrderProductCount(ono);
	}
}
