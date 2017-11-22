package org.kosta.MrFit.model;

import java.util.HashMap;
import java.util.List;

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
   public ProductVO findProductDtailByPno(String pno) {
      System.out.println("                  ProductDAOImpl/findProductDtailByPno()/시작");
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
   public List<ProductVO> findProductByName(String keyword) {
      System.out.println("                  ProductDAOImpl/findProductByName(keyword)/시작");
      List<ProductVO> list = template.selectList("product.findProductByName",keyword);
      if(!list.isEmpty()) {
         for (int i = 0; i < list.size(); i++) {
             List<ImageVO> iList=template.selectList("product.findProductImageList",list.get(i).getPno());
             list.get(i).setImageList(iList);
         }
         System.out.println("                  ProductDAOImpl/findProductByName(keyword)/종료");
         return list;
      }
      System.out.println("                  ProductDAOImpl/findProductByName(keyword)/종료");
      return null;
   }
   
   @Override
   public List<ProductVO> ProductList(PagingBean pb) {
      System.out.println("                  ProductDAOImpl/ProductList()/시작");
      List<ProductVO> ProductList=template.selectList("product.ProductList",pb);
      for(int i=0;i<ProductList.size();i++) {         
         List<ImageVO> ivo=template.selectList("product.findProductImageList",ProductList.get(i).getPno());
         if(ivo!=null&&!ivo.isEmpty()&&!ivo.equals("")) {
            ProductList.get(i).setImageList(ivo);
         }
         System.out.println("                  ProductDAOImpl/ProductList()/진행"+ProductList.get(i));
      }      
      
      System.out.println("                  ProductDAOImpl/ProductList()/종료");      
      return ProductList;
   }

   @Override
   public List<ImageVO> findProductImageList(String pno) {
      System.out.println("                  ProductDAOImpl/findProductImageList(pno)/시작");
      List<ImageVO> iList=template.selectList("product.findProductImageList",pno);
      System.out.println("                  ProductDAOImpl/findProductImageList(pno)/진행 - iList:"+iList);      
      System.out.println("                  ProductDAOImpl/findProductImageList(pno)/종료");
      return iList;
   }
   @Override
   public int getTotalProductCount() {
      System.out.println("                  ProductDAOImpl/getTotalProductCount()/시작");
      int pc=template.selectOne("product.getTotalProductCount");
      System.out.println("                  ProductDAOImpl/getTotalProductCount()/진행 - pc:"+pc);      
      System.out.println("                  ProductDAOImpl/getTotalProductCount()/종료");
      return pc;
   }

   //[김석환][2017.11.18][상품디테일정보에서 color 값을 통해 사이즈 정보 ajax형식으로 표시하기위함]
   @Override
   public List<ProductSizeVO> findProductDetailByColorAjax(String pcno){
      return template.selectList("product.findProductListByPcnoAjax", pcno);
   }
/*   @Override
   public ProductVO findProductDtailByPno(String pno) {   
      ProductVO pvo=null;
      pvo=template.selectOne("product.findProductDetail", pno);
      
      return pvo;
   }*/
   @Override
   public List<ProductVO> findProductByCategory(HashMap<String, Object> map) {
      
      System.out.println("                  ProductDAOImpl/ProductList()/시작");
      List<ProductVO> ProductList=template.selectList("product.findProductByCategory",map);
      for(int i=0;i<ProductList.size();i++) {         
         List<ImageVO> ivo=template.selectList("product.findProductImageList",ProductList.get(i).getPno());
         if(ivo!=null&&!ivo.isEmpty()&&!ivo.equals("")) {
            ProductList.get(i).setImageList(ivo);
         }
         System.out.println("                  ProductDAOImpl/ProductList()/진행"+ProductList.get(i));
      }      
      
      System.out.println("                  ProductDAOImpl/ProductList()/종료");      
      return ProductList;
   }
   @Override
   public int getCategoryProductCount(String category) {
      System.out.println("                  ProductDAOImpl/getCategoryProductCount()/시작");
      int pc=template.selectOne("product.getCategoryProductCount",category);
      System.out.println("                  ProductDAOImpl/getCategoryProductCount()/진행"+pc);      
      System.out.println("                  ProductDAOImpl/getCategoryProductCount()/종료");
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

	@Override
	public List<ProductReviewVO> findProductReplyByPno(String pno) {
		return template.selectList("product.findProductReplyByPno", pno);
	}
	@Override
	public void registerProductReview(ProductReviewVO prvo) {
		template.insert("product.registerProductReview", prvo);
		
	}
}

