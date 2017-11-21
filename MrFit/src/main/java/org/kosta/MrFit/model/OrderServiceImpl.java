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
		//System.out.println("            OrderServiceImpl/findMyCart()/종료 - list :"+ovoList);*/
		return orderDAO.findMyCart(id);
	}

}
