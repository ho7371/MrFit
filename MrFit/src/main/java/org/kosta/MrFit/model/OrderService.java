package org.kosta.MrFit.model;

import java.util.Map;

public interface OrderService {
	Map<String, Object> findMyCart(String id);
}
