package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO {
	@Resource
	private SqlSessionTemplate template;

	/**
	 * [현민][11/21][16:07] 장바구니 보기 기능 회원이 담아놓은 상품을 불러온다 회원 아이디로 주문, 주문상품 테이블에서 주문상태가
	 * 장바구니로 되어있는 주문 정보를 불러온다 그 다음 주문 번호로 상품과 상품상세 정보들을 불러와 set한후 List로 반환한다.
	 */
	@Override
	public OrderVO findMyCart(String id) {
		System.out.println("                  OrderDAOImpl/findMyCart()/시작 - template :" + template);
		OrderVO ovo = template.selectOne("order.findMyCart", id);
		System.out.println("                  OrderDAOImpl/findMyCart()/진행1 - ovo :" + ovo);
		if (ovo != null) {
			List<OrderProductVO> orderProductList = template.selectList("order.findOrderProductInfoByPdnoAndOno",
					ovo.getOno());
			ovo.setOrderProductList(orderProductList);
			System.out.println("                  OrderDAOImpl/findMyCart()/진행2 - ovo :" + ovo);
		}
		System.out.println("                  OrderDAOImpl/findMyCart()/종료 ");
		return ovo;
	}

	// [정현][11/24] 해당아이디에 장바구니가 있는지 체크
	@Override
	public int findMyCartCount(String id) {
		System.out.println("                  OrderDAOImpl/findMyCartCount()/시작 ");
		int cartCount = template.selectOne("order.findMyCartCount", id);
		System.out.println("                  OrderDAOImpl/findMyCartCount()/진행 cartCount : " + cartCount);
		System.out.println("                  OrderDAOImpl/findMyCartCount()/종료");
		return cartCount;
	}

	// [정현][11/24] 해당 아이디에 장바구니 생성
	@Override
	public void registerOrder(OrderVO ovo) {
		System.out.println("                  OrderDAOImpl/registerOrder()/시작 ovo : " + ovo);
		template.insert("order.registerOrder", ovo);
		System.out.println("                  OrderDAOImpl/registerOrder()/종료");
	}

	// [정현][11/24] 장바구니에 상품 상세 정보를 엮어 주문수량 저장
	@Override
	public void registerOrderProduct(OrderVO ovo) {
		System.out.println("                  OrderDAOImpl/registerOrderProduct()/시작 ovo : " + ovo);
		template.insert("order.registerOrderProduct", ovo);
		System.out.println("                  OrderDAOImpl/registerOrderProduct()/종료");
	}

	// [정현][11/24] 주문에서 해당 정보의 가격 수정
	@Override
	public void updateOrder(OrderVO ovo) {
		System.out.println("                  OrderDAOImpl/updateOrder()/시작 ovo : " + ovo);
		System.out.println("                  OrderDAOImpl/updateOrder()/종료");
		template.update("order.updateOrder", ovo);

	}

	// [영훈][2017.11.24][회원 주문내역 리스트]
	@Override
	public List<OrderVO> myOrderList(String id) {
		return template.selectList("order.myOrderList", id);
	}

	// [영훈][2017.11.24][회원 주문상품내역 리스트]
	@Override
	public List<OrderProductVO> myOrderPrductList(String ono) {
		return template.selectList("order.myOrderPrductList", ono);
		/* return template.selectList("order.findOrderProductInfoByPdnoAndOno",ono); */
	}

	// [김석환][2017.11.22][장바구니 상품 수량 수정]
	@Override
	public void updateOrderQuantity(OrderProductVO opvo) {
		template.update("order.updateOrderQuantity", opvo);
	}

	// [정현][11/24] 해당 정보에 값이 order_Product에 존재하는지 체크
	@Override
	public OrderProductVO findCartOderproduct(OrderVO ovo) {
		System.out.println("                  OrderDAOImpl/findCartOderproduct()/시작 ");

		OrderProductVO opCount = template.selectOne("order.findCartOderproduct", ovo);
		System.out.println("                  OrderDAOImpl/findCartOderproduct()/진행 opCount : " + opCount);
		System.out.println("                  OrderDAOImpl/findCartOderproduct()/종료");
		return opCount;
	}

	@Override
	public void updateOrderProduct(OrderVO ovo) {
		System.out.println("                  OrderDAOImpl/updateOrderProduct()/시작 ovo : " + ovo);
		System.out.println("                  OrderDAOImpl/updateOrderProduct()/종료");
		template.update("order.updateOrderProduct", ovo);

	}

	// [정현][11/24] 주문 삭제
	@Override
	public void deleteOrderProduct(OrderProductVO opvo) {
		System.out.println("                  OrderDAOImpl/deleteOrderProduct()/시작 ovo : " + opvo);
		System.out.println("opvo.pdno : " + opvo.getPdno());
		template.update("order.deleteOrderProduct", opvo);
		System.out.println("                  OrderDAOImpl/deleteOrderProduct()/종료");
	}

	// [정현][11/24] 해당 주문 정보가 있는지 체크
	@Override
	public String findPdno(ProductDetailVO pdvo) {
		System.out.println("                  OrderDAOImpl/findPdno()/시작 pdvo : " + pdvo);

		String pdno = template.selectOne("order.findPdno", pdvo);
		System.out.println("                  OrderDAOImpl/findPdno()/종료");
		return pdno;
	}

	// [석환][11.23] 주문시 포인트 차감
	@Override
	public void updatePointOrder(MemberVO vo) {
		template.update("order.updatePointOrder", vo);
	}

	// [석환][11.23] 주문시 무통장일 경우 입금대기로 변경
	@Override
	public void updateStatusOrder(OrderVO ovo) {
		template.update("order.updateStatusOrder", ovo);
	}

	// [석환][11.23]
	@Override
	public void updateStatusOrderEtc(OrderVO ovo) {
		template.update("order.updateStatusOrderEtc", ovo);
	}

	// [영훈][2017.11.24][ 주문내역 상태변경]
	@Override
	public void myOrderStatusChange(String ono) {
		template.update("order.myOrderStatusChange", ono);
	}

	// [영훈][2017.11.25][회원 주문상품의 주문상태 체크]
	@Override
	public String checkOrderProductStatus(String ono) {
		return template.selectOne("order.checkOrderProductStatus", ono);
	}

	// [영훈][2017.11.25][회원 상품리뷰 작성 폼으로(pdVO객체)]
	@Override
	public ProductReviewVO orderProductReviewForm(String pdno) {
		return template.selectOne("order.orderProductReviewForm", pdno);
	}

	// [석환][11.25]장바구니 수정시 총금액 변경
	@Override
	public void updateOrderCartTotalPrice(OrderVO ovo) {
		template.update("order.updateOrderCartTotalPrice", ovo);
	}

	// [석환][11.25]주문결제시 결제 금액 - 포인트
	@Override
	public void updateOrderTotalpriceAndPoint(OrderVO ovo) {
		template.update("order.updateOrderTotalpriceAndPoint", ovo);
	}

	// [석환][11.25][구매 확정시 토탈금액 수정]
	@Override
	public void updateMemberTotalSpent(MemberVO mvo) {
		template.update("order.updateMemberTotalSpent", mvo);
	}

	// [석환][11.25]회원 등급 퍼센트 비율 검색
	@Override
	public int findMemberGradePointPercent(String grade) {
		return template.selectOne("order.findMemberGradePointPercent", grade);
	}

	// [석환[11.25]구매 후 회원 포인트 업데이트
	@Override
	public void updateOrderMembetPoint(MemberVO mvo) {
		template.update("order.updateOrderMembetPoint", mvo);
	}

	// [석환][11.25]구매 시 회원 등급 찾기
	@Override
	public String findMemberGardeById(String id) {
		return template.selectOne("order.findMemberGardeById", id);
	}

	// [석환][11.25]구매 시 상품재고 업데이트
	@Override
	public void updateProductDetailInventory(ProductDetailVO pdvo) {
		template.update("order.updateProductDetailInventory", pdvo);
	}

	// [영훈][11.27]리뷰작성 확인
	@Override
	public int reviewCheck(Map<String, String> map) {
		System.out.println("                  OrderDAOImpl/reviewCheck()/시작 map : " + map);
		return template.selectOne("order.reviewCheck", map);
	}

	// [석환][11.27] 즉시 구매시 pdno 검색
	@Override
	public ProductVO findProductDetailByPdno(String pdno) {
		return template.selectOne("order.findProductDetailByPdno", pdno);
	}
	// [석환][11.27] 즉시 구매시 orders 테이블 등록
	@Override 
	public void immediatelyPayRegisterOrder(OrderVO ovo) {
		template.insert("order.immediatelyPayRegisterOrder", ovo);
	}

	// [석환][11.27] 즉시 구매시 orders_product 테이블 등록
	@Override
	public void immediatelyPayRegisterOrderpProduct(OrderProductVO opvo) {
		template.insert("order.immediatelyPayRegisterOrderpProduct", opvo);
	}

	// [석환][11.27] 즉시 구매시 상품검색
	@Override
	public ProductDetailVO findProductImmediatelyPay(String pdno) {
		return template.selectOne("order.findProductImmediatelyPay", pdno);
	}

	// [석환][11.27] 즉시 구매 취소 시 orders_product 테이블 삭제
	@Override
	public void deleteImmediatelyPayOrdersProduct(OrderProductVO opvo) {
		template.delete("order.deleteImmediatelyPayOrdersProduct", opvo);
	}

	// [석환][11.27] 즉시 구매 취소 시 orders 테이블 삭제
	@Override
	public void deleteImmediatelyPayOrders(OrderProductVO opvo) {
		template.delete("order.deleteImmediatelyPayOrders", opvo);
	}

}
