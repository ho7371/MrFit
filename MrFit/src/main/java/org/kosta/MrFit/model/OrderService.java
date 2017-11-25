package org.kosta.MrFit.model;

import java.util.List;

public interface OrderService {
	List<OrderVO> findMyCart(String id);

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

	OrderVO productOrderPayment(MemberVO vo, int payPoint, int depositMethod, OrderVO ovo);

	void myOrderStatusChange(String ono);

	String checkOrderProductStatus(String ono);
	
}
