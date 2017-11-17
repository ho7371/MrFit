package org.kosta.MrFit.model;

import java.util.List;

public interface ProductDAO {


	ProductVO findProductDtailByPno(String pno);

	List<ProductVO> findProductByName(String keyword);

}