package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderDAO orderDAO;
	
	@Override
	public Map<String, Object> findMyCart(String id) {
		System.out.println("            OrderServiceImpl/findMyCart()/시작");
		Map<String, Object> map = orderDAO.findMyCart(id);
		System.out.println("            OrderServiceImpl/findMyCart()/종료 - map :"+map);
		return map;
	}
	
	@Override
	public List<OrderVO> myOrderList(String id){
		return orderDAO.myOrderList(id);
	}
	
	@Override
	public List<OrderProductVO> myOrderPrductList(String ono){
		return orderDAO.myOrderPrductList(ono);
	}
	
	
	
	

}




















