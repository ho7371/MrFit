package org.kosta.MrFit.model;

import java.util.List;

public interface OrderService {
	List<OrderVO> findMyCart(String id);
}
