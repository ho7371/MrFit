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

}