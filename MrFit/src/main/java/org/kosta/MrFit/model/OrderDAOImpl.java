package org.kosta.MrFit.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class OrderDAOImpl implements OrderDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public Map<String, Object> findMyCart(String id) {
		System.out.println("                  OrderDAOImpl/findMyCart()/시작 - template :"+template);
		List<OrderVO> list = template.selectList("order.findMyCart",id);
		System.out.println("                  OrderDAOImpl/findMyCart()/진행1 - list:"+list);
		System.out.println("                  OrderDAOImpl/findMyCart()/진행2 - list.get(0) :"+list.get(0));
		System.out.println("                  OrderDAOImpl/findMyCart()/진행2 - list.get(0).getOrderProductVO:"+list.get(0).getOrderProductVO());
		System.out.println("                  OrderDAOImpl/findMyCart()/진행2 - list.get(0).getOrderProductVO.getPdno:"+list.get(0).getOrderProductVO().getPdno());
		List<ProductVO> pdList = template.selectList("order.findProductDetailByPdno", list.get(0).getOrderProductVO().getPdno());
		System.out.println(pdList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cart", list);
		map.put("product", pdList);
		return map;
	}
	//정현 장바구니 담기 
	@Override
	public int findMyCartCount(String id) {
		System.out.println("                  OrderDAOImpl/findMyCartCount()/시작 ");
		int cartCount=template.selectOne("order.findMyCartCount",id);
		System.out.println("                  OrderDAOImpl/findMyCartCount()/진행 cartCount : "+cartCount);
		System.out.println("                  OrderDAOImpl/findMyCartCount()/종료");
		return cartCount;
	}
	//정현 장바구니 담기 
	@Override
	public void registerOrder(OrderVO ovo) {
		System.out.println("                  OrderDAOImpl/registerOrder()/시작 ");
		template.insert("order.registerOrder",ovo);		
		System.out.println("                  OrderDAOImpl/registerOrder()/종료");		
	}
	//정현 장바구니 담기 
	@Override
	public void registerOrderProduct(OrderVO ovo) {
		System.out.println("                  OrderDAOImpl/registerOrderProduct()/시작 ovo : "+ovo);
		template.insert("order.registerOrderProduct",ovo);		
		System.out.println("                  OrderDAOImpl/registerOrderProduct()/종료");	
	}
	//정현 장바구니 담기 
	@Override
	public void updateOrder(OrderVO ovo) {
		System.out.println("                  OrderDAOImpl/updateOrder()/시작 ovo : "+ovo);
		System.out.println("                  OrderDAOImpl/updateOrder()/종료");
		template.update("order.updateOrder",ovo);		
			
	}
	@Override
	public void deleteOrderProduct(OrderVO ovo) {
		System.out.println("                  OrderDAOImpl/deleteOrderProduct()/시작 ovo : "+ovo);
		template.delete("order.deleteOrderProduct",ovo);		
		System.out.println("                  OrderDAOImpl/deleteOrderProduct()/종료");	
	}
	
	

}
