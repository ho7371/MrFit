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
	 * 삼풍 상세보기
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
	@Override
	public List<ProductVO> findProductByName(String keyword) {
		List<ProductVO> list = template.selectList("product.findProductByName",keyword);
		if(!list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				List<ProductDetailVO> pdList=template.selectList("product.findProductDetailList", list.get(i).getPno());
				for (int k = 0; k < pdList.size(); k++) {					
					List<ProductSizeVO> psList=template.selectList("product.findProductSizeList",list.get(i).getPno());
				}
			    List<ImageVO> iList=template.selectList("product.findProductImageList",list.get(i).getPno());
			    for (int j = 0; j < pdList.size(); j++) {
				//	pdList.get(j).setSizeList(psList);
				}
			    list.get(i).setProductDetailList(pdList);
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
