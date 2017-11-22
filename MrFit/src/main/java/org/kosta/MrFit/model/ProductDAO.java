package org.kosta.MrFit.model;

import java.util.HashMap;
import java.util.List;

public interface ProductDAO {

	List<ProductVO> ProductList(PagingBean pb);

	List<ImageVO> findProductImageList(String pno);

	ProductVO findProductDtailByPno(String pno);

	List<ProductVO> findProductByName(String keyword);
	
	int getTotalProductCount();

	List<ProductSizeVO> findProductDetailByColorAjax(String pdno);

	List<ProductVO> findProductByCategory(HashMap<String, Object> map);

	int getCategoryProductCount(String category);

	List<ProductDetailVO> findProductColorBypno(String pno);

	ProductSizeVO findProductDetailBySizeAjax(String psno);

	ProductVO findProductCategoryByPno(String pno);
	
	List<ProductReviewVO> findProductReplyByPno(String pno);

	void registerProductReview(ProductReviewVO prvo);

	List<ProductSizeVO> sizeGapMemberAndProduct(String pno);


}