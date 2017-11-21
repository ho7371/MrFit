package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

public interface OrderDAO {
	List<OrderVO> findMyCart(String id);
}
