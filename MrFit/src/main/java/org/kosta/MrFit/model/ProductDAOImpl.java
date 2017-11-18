package org.kosta.MrFit.model;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Resource
	SqlSessionTemplate template;
	/*
	 * @see org.kosta.MrFit.model.ProductDAO#findProductDtail(java.lang.String)
	 * 상품 상세보기
	 */
	@Override
	public ProductVO findProductDtailByPno(String pno) {	
		ProductVO pvo=null;
		ProductDetailVO pdvo=new ProductDetailVO();
		pvo=template.selectOne("product.findProductDetail", pno);
		List<ProductDetailVO> pdList=template.selectList("product.findProductDetailList", pno);
		List<ProductSizeVO> psList=template.selectList("product.findProductSizeList",pno);
		List<ImageVO> iList=template.selectList("product.findProductImageList",pno);
		pdvo.setSizeList(psList);
		pvo.setProductDetailList(pdList);
		pvo.setImageList(iList);
		return pvo;
	}
	/**[현민][상품검색]
	 * 검색한 키워드를 찾아 리스트에 담은 후 
	 * 하나하나 상품에 해당하는 이미지를 리스트로 불러와
	 * 리턴한다.
	 */
	@Override
	public List<ProductVO> findProductByName(String keyword) {
		List<ProductVO> list = template.selectList("product.findProductByName",keyword);
		if(!list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
			    List<ImageVO> iList=template.selectList("product.findProductImageList",list.get(i).getPno());
			    list.get(i).setImageList(iList);
			}
			return list;
		}
		return null;
	}

/*	@Override
	public ProductVO findProductDtailByPno(String pno) {   
	   ProductVO pvo=null;
	   pvo=template.selectOne("product.findProductDetail", pno);
	   
	   return pvo;
	}*/
}
