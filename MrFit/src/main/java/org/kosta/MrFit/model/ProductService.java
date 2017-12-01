package org.kosta.MrFit.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ProductService {
	
	List<ProductVO> ProductList(PagingBean pb);

	List<ProductVO> findProductByName(Map<String, Object> map);

	ProductVO findProductDetailByPno(String pno);
	
	int getTotalProductCount();

	List<ProductSizeVO> findProductDetailByColorAjax(ProductDetailVO pdVO);

	List<ProductVO> findProductByCategory(HashMap<String, Object> map);

	int getCategoryProductCount(String category);

	List<ProductDetailVO> findProductColorBypno(String pno);

	ProductVO findProductCategoryByPno(String pno);

	ProductSizeVO findProductDetailBySizeAjax(String psno);
	
	List<ProductReviewVO> findProductReplyByPno(Map<String, Object> map);

	void registerProductReview(ProductReviewVO prvo);

	ArrayList<ProductSizeGapVO> sizeGapMemberAndProduct(String pno, MemberSizeVO msvo, String pvo);
	
	void uploadImages(UploadVO vo);

	void registerImage(ImageVO ivo);

	void registerProduct(ProductVO productVO);

	void registerProductSize(ProductSizeVO psvo);

	void registerColor(ProductDetailVO pdvo);

	void registerProductDetail(ProductDetailVO pdvo);

	String findColorByName(ProductDetailVO pdvo);

	int productTotalCount(String keyword);

	int getTotalProductReviewCount();

	void hitUpByPno(String pno);

	List<ProductVO> productListByHit(PagingBean pb);
	
	int getTotalProductQnaCountByPno(String pno);

	List<ProductQnaVO> findProductQnaByPno(Map<String, Object> map);
}