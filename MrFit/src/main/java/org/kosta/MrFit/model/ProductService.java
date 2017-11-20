package org.kosta.MrFit.model;

import java.util.List;

public interface ProductService {
	
	List<ProductVO> ProductList(PagingBean pb);


	List<ProductVO> findProductByName(String keyword);

	ProductVO findProductDtailByPno(String pno);
	
	int getTotalProductCount();

	List<ProductSizeVO> findProductDetailByColorAjax(String pdno);


	

}