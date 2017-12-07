package org.kosta.MrFit.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Resource
	private SqlSessionTemplate template;
	
	
	@Override
	public void adminUpdateMemberStatus(String id) {
		template.update("admin.adminUpdateMemberStatus", id);
	}
	
	@Override
	public void adminDeleteMemberAuthority(String id) {
		template.delete("admin.adminDeleteMemberAuthority", id);
	}
	
	//[영훈][관리자 회원검색]
	@Override
	public MemberVO adminSearchMember(String id) {
		return template.selectOne("admin.adminSearchMember",id);
	}
	
	//[영훈][관리자 회원리스트(회원/탈퇴회원)]
	@Override
	public List<MemberVO> commonMemberList(Map<String, Object> map){
		return template.selectList("admin.commonMemberList",map);
	}
	
	//[영훈][관리자 회원리스트 count(페이징처리시 필요)]
	@Override
	public int getTotalCommonMemberCount(int status) {
		return template.selectOne("admin.getTotalCommonMemberCount",status);
	}

	//[현민][관리자 주문 관리 리스트]
	@Override
	public List<OrderVO> adminAllOrderList(PagingBean pb) {
		List<OrderVO> list =  template.selectList("admin.adminAllOrderList",pb);
		for (int i = 0; i < list.size(); i++) {
			System.out.println("                  AdminDAOImpl/adminAllOrderList()/진행 ");
			List<OrderProductVO> orderProductList = template.selectList("order.findOrderProductInfoByPdnoAndOno",list.get(i).getOno());
			list.get(i).setOrderProductList(orderProductList);
		}
		return list;
	}

	//[현민][관리자 주문 관리 리스트 개수]
	@Override
	public int adminTotalOrderCount() {
		return template.selectOne("admin.adminTotalOrderCount");
	}
	
	//[영훈][관리자 회원포인트 지급]
	@Override
	public void adminGivePointToMember(MemberVO mvo) {
		template.update("admin.adminGivePointToMember", mvo);
	}

	//[현민][관리자 주문관리에서 회원 검색]
	@Override
	public List<OrderVO> adminSearchOrder(Map<String, Object> map) {
		List<OrderVO> list = template.selectList("admin.adminSearchOrder", map);
		System.out.println("                  AdminDAOImpl/adminSearchOrder()/진행1 ");
		for (int i = 0; i < list.size(); i++) {
			List<OrderProductVO> orderProductList = template.selectList("order.findOrderProductInfoByPdnoAndOno",list.get(i).getOno());
			list.get(i).setOrderProductList(orderProductList);
			System.out.println("                  AdminDAOImpl/adminSearchOrder()/진행2 list :  "+list.get(i));
		}
		return list;
	}
	
	//[현민][관리자 주문관리에서 검색시 회원 수]
	@Override
	public int adminSearchMemberOrderCount(String memberId) {
		return template.selectOne("admin.adminSearchMemberOrderCount", memberId);
	}

	//[현민][관리자 주문관리에서 주문상태 변경]
	@Override
	public void updateOrderStatus(Map<String, String> map) {
		template.update("admin.updateOrderStatus", map);
	}

	@Override
	public OrderVO adminfindOrderByOno(String ono) {
		return template.selectOne("admin.adminfindOrderByOno",ono);
	}

	@Override
	public int adminSearchOrderCountByOrderNumber(String ono) {
		return template.selectOne("admin.adminSearchOrderCountByOrderNumber",ono);
	}

	@Override
	public OrderVO adminSearchOrderByOno(String ono) {
		OrderVO orderVO = template.selectOne("admin.adminSearchOrderByOno",ono);
		return orderVO;
	}
	
	//[현민][관리자 쪽지보내기]
	@Override
	public void sendMessage(Map<String, Object> map) {
		template.insert("admin.sendMessage", map);
	}

	//[현민][쪽지함 리스트]
	@Override
	public List<NoteVO> getNoteList(PagingBean pb) {
		return template.selectList("admin.getNoteList",pb);
	}

	@Override
	public List<OrderProductVO> orderProductInfo(String ono) {
		return template.selectList("order.findOrderProductInfoByPdnoAndOno", ono);
	}

	//[재현][상품 삭제]
	@Override
	public void deleteProduct(String pno) {
		template.delete("admin.deleteProduct",pno);
		
	}
	
	//[현민][관리자 쪽지함 리스트 개수]
	@Override
	public int totalNoteCount() {
		return template.selectOne("admin.totalNoteCount");
	}

	//[현민][관리자 포인트 지급 이력 작성]
		@Override
		public void reportPoint(Map<String, Object> map) {
			template.insert("admin.reportPoint", map);
		}
		//[현민][포인트 내역]
		@Override
		public List<PointVO> adminPointList(PagingBean pb) {
			return template.selectList("admin.adminPointList",pb);
		}
		//[현민][포인트 내역 개수]
		@Override
		public int totalPointListCount() {
			return template.selectOne("admin.totalPointListCount");
		}
		//[현민][포인트 내역 아이디 검색시 개수]
		@Override
		public int adminSearchPointCount(String searchKeyword) {
			return template.selectOne("admin.adminSearchPointCount", searchKeyword);
		}
		//[현민][포인트 내역 아이디 검색]
		@Override
		public List<PointVO> adminSearchPoint(Map<String, Object> map) {
			return template.selectList("admin.adminSearchPoint", map);
		}
		
		//[현민][포인트 내역 지급형태 검색시 개수]
		@Override
		public int adminSearchPointCountByStatus(String searchKeyword) {
			return template.selectOne("admin.adminSearchPointCountByStatus",searchKeyword);
		}
		//[현민][포인트 내역 지급형태 검색]
		@Override
		public List<PointVO> adminSearchPointByStatus(Map<String, Object> map) {
			return template.selectList("admin.adminSearchPointByStatus", map);
		}
	
		//[재현][상품 재고 수정 폼]
		@Override
		public List<ProductDetailVO> updateProductForm(String pno) {
			//template.selectList("product.findProductDetailList",pno);
			//findProductColorList
			return template.selectList("admin.updateProductForm",pno);
		}
		
		//[재현][상품 재고 업데이트]
		@Override
		public void updateProductInventory(ProductDetailVO pdvo) {
			template.update("admin.updateProductInventory", pdvo);
			
		}
		//[현민][탈퇴회원 살리기]
		@Override
		public void restoreMemberStatus(String id) {
			template.insert("admin.restoreMemberAuthority",id);
			template.insert("admin.restoreMemberStatus",id);
		}
		
		@Override
		public List<ProductVO> adminProductList(PagingBean pb) {
			List<ProductVO> ProductList=template.selectList("admin.adminProductList", pb);
		      for(int i=0;i<ProductList.size();i++) {         
		         List<ImageVO> ivo=template.selectList("product.findProductImageList",ProductList.get(i).getPno());
		         if(ivo!=null&&!ivo.isEmpty()&&!ivo.equals("")) {
		            ProductList.get(i).setImageList(ivo);
		         }
		         //System.out.println("                  ProductDAOImpl/ProductList()/진행"+ProductList.get(i));
		      }      
		      return ProductList;
		}
		
}

















