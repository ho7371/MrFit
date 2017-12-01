package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

public interface OrderDAO {
	OrderVO findMyCart(String id);

	List<OrderVO> myOrderList(Map<String, Object> map);

	List<OrderProductVO> myOrderPrductList(String ono);

	int findMyCartCount(String id);

	void registerOrder(OrderVO ovo);

	void registerOrderProduct(OrderVO ovo);

	void updateOrder(OrderVO ovo);

	void updateOrderQuantity(OrderProductVO opvo);

	OrderProductVO findCartOderproduct(OrderVO ovo);

	void updateOrderProduct(OrderVO ovo);

	void deleteOrderProduct(OrderProductVO opvo);

	String findPdno(ProductDetailVO pdvo);

	void updatePointOrder(MemberVO vo);

	void updateStatusOrder(OrderVO ovo);

	void updateStatusOrderEtc(OrderVO ovo);

	void myOrderStatusChange(String ono);

	String checkOrderProductStatus(String ono);

	ProductReviewVO orderProductReviewForm(String pdno);
	
	void updateOrderCartTotalPrice(OrderVO ovo);

	void updateOrderTotalpriceAndPoint(OrderVO ovo);

	void updateMemberTotalSpent(MemberVO mvo);

	int findMemberGradePointPercent(String grade);

	void updateOrderMembetPoint(MemberVO mvo);

	String findMemberGardeById(String id);

	void updateProductDetailInventory(ProductDetailVO pdvo);

	int reviewCheck(Map<String, String> map);

	int statusCheck(Map<String, String> map);
	
	ProductVO findProductDetailByPdno(String pdno);

	void immediatelyPayRegisterOrder(OrderVO ovo);

	void immediatelyPayRegisterOrderpProduct(OrderProductVO opvo);

	ProductDetailVO findProductImmediatelyPay(String pdno);

	void deleteImmediatelyPayOrdersProduct(OrderProductVO opvo);

	void deleteImmediatelyPayOrders(OrderProductVO opvo);

	List<OrderVO> findImmediatelyPayGarbage(String id);

	void deleteImmediatelyPayGarbageOrdersProduct(String ono);

	void deleteImmediatelyPayGarbageOrders(String ono);

	int findBeforeQuantityByOnoAndPdno(OrderProductVO opvo);

	List<ImageVO> findProductImageByPdno(String pno);

	int findMemberPointById(String id);

	void reportPoint(Map<String, Object> map);

	int getTotalMyOrderCount(String id);

	int getTotalMyOrderProductCount(String ono);
}
