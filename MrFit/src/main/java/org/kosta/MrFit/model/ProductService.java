package org.kosta.MrFit.model;

import java.util.List;

public interface ProductService {
	
	List<ProductVO> ProductList();

	List<ImageVO> findProductImageList(String pno);

	List<ProductVO> findProductByName(String keyword);

	ProductVO findProductDtailByPno(String pno);

	

}