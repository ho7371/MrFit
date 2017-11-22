package org.kosta.MrFit.model;

import java.util.HashMap;
import java.util.List;

public interface ProductService {
	
	List<ProductVO> ProductList(PagingBean pb);

	List<ProductVO> findProductByName(String keyword);

	ProductVO findProductDtailByPno(String pno);
	
	int getTotalProductCount();

	List<ProductSizeVO> findProductDetailByColorAjax(String pdno);

	List<ProductVO> findProductByCategory(HashMap<String, Object> map);

	int getCategoryProductCount(String category);

	List<ProductDetailVO> findProductColorBypno(String pno);

	ProductVO findProductCategoryByPno(String pno);

	ProductSizeVO findProductDetailBySizeAjax(String psno);
	
	List<ProductReviewVO> findProductReplyByPno(String pno);

	void registerProductReview(ProductReviewVO prvo);


}