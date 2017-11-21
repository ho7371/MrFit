package org.kosta.MrFit.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class OrderDAOImpl implements OrderDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<OrderVO> findMyCart(String id) {
		System.out.println("                  OrderDAOImpl/findMyCart()/시작 - template :"+template);
		List<OrderVO> list = template.selectList("order.findMyCart",id);
		for (int i = 0; i < list.size(); i++) {
			List<OrderProductVO> orderProductList = template.selectList("order.findOrderProductInfoByPdnoAndOno",list.get(i).getOno());
			list.get(i).setOrderProductList(orderProductList);
		}
		return list;
	}

	@Override
	 public List<OrderVO> myOrderList(String id){
	 	return template.selectList("order.myOrderList",id);
	 }
	 
	 @Override
	 public List<OrderProductVO> myOrderPrductList(String ono){
	 	return template.selectList("order.myOrderPrductList",ono);
	 }

}
