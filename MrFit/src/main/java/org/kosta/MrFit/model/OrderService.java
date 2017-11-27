package org.kosta.MrFit.model;

import java.util.List;

public interface OrderService {
	OrderVO findMyCart(String id);

	List<OrderVO> myOrderList(String id);

	List<OrderProductVO> myOrderPrductList(String ono);

	int findMyCartCount(String id);

	void registerOrder(OrderVO ovo);

	void registerOrderProduct(OrderVO ovo);

	void updateOrder(OrderVO ovo);

	void deleteOrderProduct(OrderProductVO opvo);

	void updateOrderQuantity(OrderProductVO opvo);

	OrderProductVO findCartOderproduct(OrderVO ovo);

	String findPdno(ProductDetailVO pdvo);

	void productOrderPayment(MemberVO vo, int payPoint, int depositMethod, OrderVO ovo);

	void myOrderStatusChange(String ono);

	String checkOrderProductStatus(String ono);

	ProductReviewVO orderProductReviewForm(String pdno);
	
	void updateOrderCartTotalPrice(OrderVO ovo);

	void updateMemberTotalSpent(MemberVO mvo);

	int findMemberGradePointPercent(String grade);

	void updateOrderMembetPoint(MemberVO mvo);

	String findMemberGardeById(String id);

	void updateProductDetailInventory(ProductDetailVO pdvo);
}
