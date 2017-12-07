package org.kosta.MrFit.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ProductDAO {

	List<ProductVO> ProductList(PagingBean pb);

	List<ImageVO> findProductImageList(String pno);

	ProductVO findProductDetailByPno(String pno);

	List<ProductVO> findProductByName(Map<String, Object> map);
	
	int getTotalProductCount();

	List<ProductDetailVO> findProductDetailByColorAjax(ProductDetailVO pdVO);

	List<ProductVO> findProductByCategory(HashMap<String, Object> map);

	int getCategoryProductCount(String category);

	List<ProductDetailVO> findProductColorBypno(String pno);

	ProductSizeVO findProductDetailBySizeAjax(String psno);

	ProductVO findProductCategoryByPno(String pno);
	
	List<ProductReviewVO> findProductReplyByPno(Map<String, Object> map);

	void registerProductReview(ProductReviewVO prvo);

	List<ProductSizeVO> sizeGapMemberAndProduct(String pno);

	void registerImage(ImageVO ivo);


	void registerProduct(ProductVO productVO);

	void registerProductSize(ProductSizeVO psvo);

	void registerColor(ProductDetailVO pdvo);

	void registerProductDetail(ProductDetailVO pdvo);

	String findColorByName(ProductDetailVO pdvo);

	int productTotalCount(String keyword);

	int getTotalProductReviewCount(String pno);

	void hitUpByPno(String pno);

	List<ProductVO> productListByHit(PagingBean pb);
	
	int getTotalProductQnaCountByPno(String pno);

	List<ProductQnaVO> findProductQnaByPno(Map<String, Object> map);
	
	void reviewUpdateAjax(ProductReviewVO prvo);
	
	void registerProductQnA(ProductQnaVO pqvo);

	int getTotalProductReviewCountAdmin();

	List<ProductReviewVO> findProductReply(PagingBean pb);

	int getTotalProductQnaCountAdmin();

	List<ProductQnaVO> findProductQna(PagingBean pb);

	void deleteProductQna(String pqno); 
}