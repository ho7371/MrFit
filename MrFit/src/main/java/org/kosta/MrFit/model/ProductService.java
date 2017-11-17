package org.kosta.MrFit.model;

import java.util.List;

public interface ProductService {

	List<ProductVO> findProductByName(String keyword);

	

}