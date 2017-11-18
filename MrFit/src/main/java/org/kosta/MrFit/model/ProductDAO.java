package org.kosta.MrFit.model;

import java.util.List;

public interface ProductDAO {

	List<ProductVO> ProductList(PagingBean pb);

	List<ImageVO> findProductImageList(String pno);

	ProductVO findProductDtailByPno(String pno);

	List<ProductVO> findProductByName(String keyword);
	
	int getTotalProductCount();

}