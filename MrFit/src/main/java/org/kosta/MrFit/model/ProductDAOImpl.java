package org.kosta.MrFit.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
   @Resource
   SqlSessionTemplate template;
   /* 
    * @see org.kosta.MrFit.model.ProductDAO#findProductDtail(java.lang.String)
    * [석환][상품 상세보기]
    * 상품 상세보기 메서드(상품번호로 검색)
    */
   @Override
   public ProductVO findProductDetailByPno(String pno) {
      ProductVO pvo=template.selectOne("product.findProductDetail", pno);
      pvo.setImageList(template.selectList("product.findProductImageList",pno));
      pvo.setProductDetailList(template.selectList("product.findProductDetailList",pno));
      return pvo;
   }
   /* 석환
    * (non-Javadoc)
    * @see org.kosta.MrFit.model.ProductDAO#findProductColorBypno(java.lang.String)
    */
   @Override
   public List<ProductDetailVO> findProductColorBypno(String pno) {
      return template.selectList("product.findProductColorList", pno);
   }
   /**[현민][상품검색]
    * 검색한 키워드를 찾아 리스트에 담은 후 
    * 하나하나 상품에 해당하는 이미지를 리스트로 불러와
    * 리턴한다.
    */
   @Override
   public List<ProductVO> findProductByName(Map<String, Object> map) {
      List<ProductVO> list = template.selectList("product.findProductByName",map);
      System.out.println("                  ProductDAOImpl/findProductByName(keyword)/진행 1 list : "+list);
      if(!list.isEmpty()) {
         for (int i = 0; i < list.size(); i++) {
             List<ImageVO> iList=template.selectList("product.findProductImageList",list.get(i).getPno());
             list.get(i).setImageList(iList);
         }
         return list;
      }
      return null;
   }
   
   @Override
   public List<ProductVO> ProductList(PagingBean pb) {
      List<ProductVO> ProductList=template.selectList("product.ProductList",pb);
      for(int i=0;i<ProductList.size();i++) {         
         List<ImageVO> ivo=template.selectList("product.findProductImageList",ProductList.get(i).getPno());
         if(ivo!=null&&!ivo.isEmpty()&&!ivo.equals("")) {
            ProductList.get(i).setImageList(ivo);
         }
         //System.out.println("                  ProductDAOImpl/ProductList()/진행"+ProductList.get(i));
      }      
      
      return ProductList;
   }

   @Override
   public List<ImageVO> findProductImageList(String pno) {
      List<ImageVO> iList=template.selectList("product.findProductImageList",pno);
      System.out.println("                  ProductDAOImpl/findProductImageList(pno)/진행 - iList:"+iList);      
      return iList;
   }
   @Override
   public int getTotalProductCount() {
      int pc=template.selectOne("product.getTotalProductCount");
      System.out.println("                  ProductDAOImpl/getTotalProductCount()/진행 - pc:"+pc);      
      return pc;
   }

   //[김석환][2017.11.18][상품디테일정보에서 color 값을 통해 사이즈 정보 ajax형식으로 표시하기위함]
   @Override
   public List<ProductDetailVO> findProductDetailByColorAjax(ProductDetailVO pdVO){
      return template.selectList("product.findProductListByPcnoAjax", pdVO);
   }
/*   @Override
   public ProductVO findProductDtailByPno(String pno) {   
      ProductVO pvo=null;
      pvo=template.selectOne("product.findProductDetail", pno);
      
      return pvo;
   }*/
 //[정현][11/24] 해당 카테고리 리스트 받아오기
   @Override
   public List<ProductVO> findProductByCategory(HashMap<String, Object> map) {
      
      List<ProductVO> ProductList=template.selectList("product.findProductByCategory",map);
      for(int i=0;i<ProductList.size();i++) {         
         List<ImageVO> ivo=template.selectList("product.findProductImageList",ProductList.get(i).getPno());
         if(ivo!=null&&!ivo.isEmpty()&&!ivo.equals("")) {
            ProductList.get(i).setImageList(ivo);
         }
         System.out.println("                  ProductDAOImpl/ProductList()/진행"+ProductList.get(i));
      }      
      
      return ProductList;
   }
 //[정현][11/21] 해당 카테고리의 총갯수 파악
   @Override
   public int getCategoryProductCount(String category) {
      int pc=template.selectOne("product.getCategoryProductCount",category);
      System.out.println("                  ProductDAOImpl/getCategoryProductCount()/진행"+pc);      
      return pc;
   }
	//[김석환][2017.11.21][상품사이즈 번호를 가지고 AJAX통신을 이용해 고객의 치수비교]
	@Override
	public ProductSizeVO findProductDetailBySizeAjax(String psno) {
		return template.selectOne("product.findProductDetailBySizeAjax", psno);
	}
	//[김석환][2017.11.21][상품 카테고리 검색]
	@Override
	public ProductVO findProductCategoryByPno(String pno) {
		return template.selectOne("product.findProductDetail", pno);
	}

/*   @Override
   public ProductVO findProductDtailByPno(String pno) {   
      ProductVO pvo=null;
      pvo=template.selectOne("product.findProductDetail", pno);
      
      return pvo;
   }*/
 
	/** [재현][1122][]
	 *  상품상세에서 리뷰 불러오기
	 */
	@Override
	public List<ProductReviewVO> findProductReplyByPno(Map<String, Object> map) {
		return template.selectList("product.findProductReplyByPno", map);
	}
	
	/** [재현][1122][]
	 *  상품리뷰 작성
	 */
	@Override
	public void registerProductReview(ProductReviewVO prvo) {
		template.insert("product.registerProductReview", prvo);
		
	}
	/*
	 * [석환][11.22][치수차이]
	 */
	@Override
	public List<ProductSizeVO> sizeGapMemberAndProduct(String pno){
		return template.selectList("product.sizeGapMemberAndProduct", pno);
	}
	
	//[재현][이미지 업로드]
	@Override
	public void registerImage(ImageVO ivo) {
		template.insert("product.registerImage", ivo);
		
	}

	//[재현][상품 등록]
	@Override
	public void registerProduct(ProductVO productVO) {
		template.insert("product.registerProduct", productVO);
		
	}
	
	//[재현][상품 치수 등록]
	@Override
	public void registerProductSize(ProductSizeVO psvo) {
		template.insert("product.registerProductSize",psvo);
		
	}
	
	//[재현][상품 색상 등록]
	@Override
	public void registerColor(ProductDetailVO pdvo) {
		template.insert("product.registerColor",pdvo);
		
	}
	
	//[재현][상품 상세 등록]
	@Override
	public void registerProductDetail(ProductDetailVO pdvo) {
		template.insert("product.registerProductDetail", pdvo);
		
	}
	
	// [][]
	@Override
	public String findColorByName(ProductDetailVO pdvo) {
		// TODO Auto-generated method stub
		return template.selectOne("product.findColorByName", pdvo);
	}
	
	//[현민][상품검색 개수]
	@Override
	public int productTotalCount(String keyword) {
		return template.selectOne("product.productTotalCount", keyword);
	}
	
	//[영훈][11/29][상품리뷰 총 개수]
	@Override
	public int getTotalProductReviewCount(String pno) {
		return template.selectOne("product.getTotalProductReviewCount",pno);
	}
	//[정현][11/30][상품 상세보기시 hit +1]
	@Override
	public void hitUpByPno(String pno) {
		 template.update("product.hitUpByPno",pno);
		
	}
	//[정현][11/30][조회순 리스트]
	@Override
	public List<ProductVO> productListByHit(PagingBean pb) {
	      List<ProductVO> ProductList=template.selectList("product.productListByHit",pb);
	      for(int i=0;i<ProductList.size();i++) {         
	         List<ImageVO> ivo=template.selectList("product.findProductImageList",ProductList.get(i).getPno());
	         if(ivo!=null&&!ivo.isEmpty()&&!ivo.equals("")) {
	            ProductList.get(i).setImageList(ivo);
	         }
	         System.out.println("                  ProductDAOImpl/productListByHit()/진행"+ProductList.get(i));
	      }      
	      
	      return ProductList;
	}
	//[석환][11/30][상품문의 총 개수]
	@Override
	public int getTotalProductQnaCountByPno(String pno) {
		return template.selectOne("product.getTotalProductQnaCount",pno);
	}
	//[석환][11/30][상품문의 페이징 처리]
	@Override
	public List<ProductQnaVO> findProductQnaByPno(Map<String, Object> map){
		return template.selectList("product.findProductQnaByPno", map);
	}
	//[영훈][12/1][리뷰수정]
	@Override
	public void reviewUpdateAjax(ProductReviewVO prvo) {
		template.update("product.reviewUpdateAjax", prvo);
	}
	//[석환][12/02][상품문의 글 작성]
	@Override
	public void registerProductQnA(ProductQnaVO pqvo) {
		template.insert("product.registerProductQnA", pqvo);
	}
	@Override
	public int getTotalProductReviewCountAdmin() {
		return template.selectOne("product.getTotalProductReviewCountAdmin");
	}
	@Override
	public List<ProductReviewVO> findProductReply(PagingBean pb) {
		return template.selectList("product.findProductReply");
	}
	@Override
	public int getTotalProductQnaCountAdmin() {
		return template.selectOne("product.getTotalProductQnaCountAdmin");
	}
	@Override
	public List<ProductQnaVO> findProductQna(PagingBean pb) {
		return template.selectList("product.findProductQna");
	}
}

