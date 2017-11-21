package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

public interface OrderService {
	List<OrderVO> findMyCart(String id);

	List<OrderVO> myOrderList(String id);

	List<OrderProductVO> myOrderPrductList(String ono);

	int findMyCartCount(String id);

	void registerOrder(OrderVO ovo);

	void registerOrderProduct(OrderVO ovo);

	void updateOrder(OrderVO ovo);

	void deleteOrderProduct(OrderVO ovo);
}
