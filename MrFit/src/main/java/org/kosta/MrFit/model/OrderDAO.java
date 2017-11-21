package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

public interface OrderDAO {
	Map<String, Object> findMyCart(String id);
}
