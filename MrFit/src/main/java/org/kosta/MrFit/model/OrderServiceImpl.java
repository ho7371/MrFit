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

	@Override
	public int findMyCartCount(String id) {
		System.out.println("            OrderServiceImpl/findMyCart()/시작");
		int cartCount= orderDAO.findMyCartCount(id);
		System.out.println("            OrderServiceImpl/findMyCart()/종료 - map :"+cartCount);
		return cartCount;
	}

	@Override
	public void registerOrder(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/registerOrder()/시작 ovo : "+ovo);
		orderDAO.registerOrder(ovo);
		System.out.println("            OrderServiceImpl/findMyCart()/종료");
	}

	@Override
	public void registerOrderProduct(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/registerOrderProduct()/시작 ovo : "+ ovo);
		orderDAO.registerOrderProduct(ovo);
		System.out.println("            OrderServiceImpl/registerOrderProduct()/종료");
	}

	@Override
	public void updateOrder(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/updateOrder()/시작 ovo : "+ ovo);
		orderDAO.updateOrder(ovo);
		System.out.println("            OrderServiceImpl/updateOrder()/종료");
	}

	@Override
	public void deleteOrderProduct(OrderVO ovo) {
		System.out.println("            OrderServiceImpl/deleteOrderProduct()/시작 ovo : "+ ovo);
		orderDAO.deleteOrderProduct(ovo);
		System.out.println("            OrderServiceImpl/deleteOrderProduct()/종료");
	}

}
