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
		/*System.out.println("                  OrderDAOImpl/findMyCart()/시작 - template :"+template);
		List<OrderVO> list = template.selectList("order.findMyCart",id);
		System.out.println("                  OrderDAOImpl/findMyCart()/진행1 - list:"+list);
		System.out.println("                  OrderDAOImpl/findMyCart()/진행2 - list.get(0) :"+list.get(0));
		System.out.println("                  OrderDAOImpl/findMyCart()/진행2 - list.get(0).getOrderProductVO:"+list.get(0).getOrderProductVO());
		System.out.println("                  OrderDAOImpl/findMyCart()/진행2 - list.get(0).getOrderProductVO.getPdno:"+list.get(0).getOrderProductVO().getPdno());
		List<ProductVO> pdList = template.selectList("order.findProductDetailByPdno", list.get(0).getOrderProductVO().getPdno());
		System.out.println(pdList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cart", list);
		map.put("product", pdList);*/
		return null;
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










