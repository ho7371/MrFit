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
	
	@Override
	public List<ProductVO> ProductList(PagingBean pb) {
		System.out.println("      		      ProductDAOImpl/ProductList()/시작");
		List<ProductVO> ProductList=template.selectList("product.ProductList",pb);
		for(int i=0;i<ProductList.size();i++) {			
			List<ImageVO> ivo=template.selectList("product.findProductImageList",ProductList.get(i).getPno());
			if(ivo!=null&&!ivo.isEmpty()&&!ivo.equals("")) {
				ProductList.get(i).setImageList(ivo);
			}
			System.out.println("      		      ProductDAOImpl/ProductList()/진행"+ProductList.get(i));
		}		
		
		System.out.println("      		      ProductDAOImpl/ProductList()/종료");		
		return ProductList;
	}

	@Override
	public List<ImageVO> findProductImageList(String pno) {
		System.out.println("      		      ProductDAOImpl/findProductImageList(pno)/시작");
		List<ImageVO> iList=template.selectList("product.findProductImageList",pno);
		System.out.println("      		      ProductDAOImpl/findProductImageList(pno)/진행"+iList);		
		System.out.println("      		      ProductDAOImpl/findProductImageList(pno)/종료");
		return iList;
	}
	@Override
	public int getTotalProductCount() {
		System.out.println("      		      ProductDAOImpl/getTotalProductCount()/시작");
		int pc=template.selectOne("product.getTotalProductCount");
		System.out.println("      		      ProductDAOImpl/getTotalProductCount()/진행"+pc);		
		System.out.println("      		      ProductDAOImpl/getTotalProductCount()/종료");
		return pc;
	}
/*	@Override
	public ProductVO findProductDtailByPno(String pno) {   
	   ProductVO pvo=null;
	   pvo=template.selectOne("product.findProductDetail", pno);
	   
	   return pvo;
	}*/
}
