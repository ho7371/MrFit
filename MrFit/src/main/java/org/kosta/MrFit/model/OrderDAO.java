package org.kosta.MrFit.model;

import java.util.List;

public interface OrderDAO {
	List<OrderVO> findMyCart(String id);

	List<OrderVO> myOrderList(String id);

	List<OrderProductVO> myOrderPrductList(String ono);

	int findMyCartCount(String id);

	void registerOrder(OrderVO ovo);

	void registerOrderProduct(OrderVO ovo);

	void updateOrder(OrderVO ovo);

	void updateOrderQuantity(OrderProductVO opvo);

	OrderProductVO findCartOderproduct(OrderVO ovo);

	void updateOrderProduct(OrderVO ovo);

	void deleteOrderProduct(OrderProductVO opvo);

	String findPdno(ProductDetailVO pdvo);

	void updatePointOrder(MemberVO vo);

	void updateStatusOrder(OrderVO ovo);

	void updateStatusOrderEtc(OrderVO ovo);
}
