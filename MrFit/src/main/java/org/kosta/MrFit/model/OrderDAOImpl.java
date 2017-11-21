package org.kosta.MrFit.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class OrderDAOImpl implements OrderDAO {
	@Resource
	private SqlSessionTemplate template;
	/**[현민][11/21][16:07]
	 * 장바구니 보기 기능
	 * 회원이 담아놓은 상품을 불러온다
	 * 회원 아이디로 주문, 주문상품 테이블에서 
	 * 주문상태가 장바구니로 되어있는 주문 정보를 불러온다
	 * 그 다음 주문 번호로 상품과 상품상세 정보들을 불러와 set한후 
	 * List로 반환한다.
	 */
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
