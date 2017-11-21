package org.kosta.MrFit.model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	private OrderDAO orderDAO;
	
	@Override
	public List<OrderVO> findMyCart(String id) {
		System.out.println("            OrderServiceImpl/findMyCart()/시작");
		return orderDAO.findMyCart(id);
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




















