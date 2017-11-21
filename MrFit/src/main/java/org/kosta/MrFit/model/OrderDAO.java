package org.kosta.MrFit.model;

import java.util.HashMap;
import java.util.Map;

public interface OrderDAO {
	Map<String, Object> findMyCart(String id);

	int findMyCartCount(String id);

	void registerOrder(OrderVO ovo);

	void registerOrderProduct(OrderVO ovo);

	void updateOrder(OrderVO ovo);

	void deleteOrderProduct(OrderVO ovo);
}
