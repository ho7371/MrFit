package org.kosta.MrFit.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductServiceImpl implements ProductService {
	@Resource
	private ProductDAO productDAO;
	
	// 주석샘플
	/** 1. 메소드 주석은 꼭 구현 완료 후 작성한다.
	 *  2. 다른 사람이 작성한 코드를 변경해야 할 경우, 원본은 주석처리 후 복사하여 사용한다.
	 *  3. 다른 기능/메소드로 매개변수를 던지는 경우, 해당 문서에 매개변수를 명시해준다.
	 *  4. 하루 작업한 것은 꼭 push를 한다.
	 *  
	 * @return
	 */
	public String findProductById(){
		return null;
	}
	/*
	 * [유정현][2017.11.17][ProductList생성]
	 * @see org.kosta.MrFit.model.ProductService#ProductList()
	 */
	@Override
	public List<ProductVO> ProductList(PagingBean pb) {
		List<ProductVO> ProductList=productDAO.ProductList(pb);
		System.out.println("      		ProductServiceImpl/ProductList()/종료 - ProductList:"+ProductList);
		return ProductList;
	}
	
	@Override
	public List<ProductVO> findProductByName(Map<String, Object> map) {
		return productDAO.findProductByName(map);
	}
	@Override
	public ProductVO findProductDetailByPno(String pno) {	
		return productDAO.findProductDetailByPno(pno);
	}
	@Override
	public int getTotalProductCount() {	
		return productDAO.getTotalProductCount();
	}
	//[김석환][2017.11.18][상품디테일정보에서 color 값을 통해 사이즈 정보 ajax형식으로 표시하기위함]

	/*@Override
	public List<ProductSizeVO> findProductDetailByColorAjax(String pdno){
		return productDAO.findProductDetailByColorAjax(pdno);
	}*/
	@Override
		public List<ProductSizeVO> findProductDetailByColorAjax(ProductDetailVO pdVO){
			return productDAO.findProductDetailByColorAjax(pdVO);
	}	
	//[정현][11/24] 해당 카테고리 리스트 받아오기
	@Override
	public List<ProductVO> findProductByCategory(HashMap<String, Object> map) {
		List<ProductVO> ProductList=productDAO.findProductByCategory(map);
		System.out.println("            ProductServiceImpl/findProductByCategory()/진행"+ProductList);
		
		return ProductList;
	}
	//[정현][11/24] 해당 카테고리의 총갯수 파악
	@Override
	public int getCategoryProductCount(String category) {
		System.out.println("            ProductServiceImpl/getCategoryProductCount()/시작"+category);
		return productDAO.getCategoryProductCount(category);
	}	
	/* [2017.11.20][김석환
	 * 상세정보 컬러 값가져가기
	 * (non-Javadoc)
	 * @see org.kosta.MrFit.model.ProductDAO#findProductColorBypno(java.lang.String)
	 */
	@Override
	public List<ProductDetailVO> findProductColorBypno(String pno) {
		return productDAO.findProductColorBypno(pno);
	}
	//[김석환][2017.11.21][상품사이즈 번호를 가지고 AJAX통신을 이용해 고객의 치수비교]
	@Override
	public ProductSizeVO findProductDetailBySizeAjax(String psno) {
		return productDAO.findProductDetailBySizeAjax(psno);
	}
	//[김석환][2017.11.21][상품 카테고리 검색]
	@Override
	public ProductVO findProductCategoryByPno(String pno) {
		return productDAO.findProductCategoryByPno(pno);
	}
	
	/** [재현][1122][]
	 *  상품상세에서 리뷰 불러오기
	 */
	@Override
	public List<ProductReviewVO> findProductReplyByPno(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return productDAO.findProductReplyByPno(map);
	}
	
	/** [재현][1122][]
	 *  상품리뷰 작성
	 */
	@Override
	public void registerProductReview(ProductReviewVO prvo) {
		productDAO.registerProductReview(prvo);
		
	}
	/*
	 * [석환][11.22][치수차이]
	 */
	@Override
	public ArrayList<ProductSizeGapVO> sizeGapMemberAndProduct(String pno,MemberSizeVO msvo,String pvo){
		List<ProductSizeVO> psList=productDAO.sizeGapMemberAndProduct(pno);
		ArrayList<ProductSizeGapVO> psgList=new ArrayList<ProductSizeGapVO>();
		System.out.println(pno);
		System.out.println(msvo);
		System.out.println(pvo);
		System.out.println(psList);
		int sizeGap1=0;
		int sizeGap2=0;
		int sizeGap3=0;
		int sizeGap4=0;
		int sizeGap5=0;
		String colorGap1="#ff0000";
		String colorGap2="#ff0000";
		String colorGap3="#ff0000";
		String colorGap4="#ff0000";
		String colorGap5="#ff0000";
		// #ffffff #ffffb3 #ffcc99 #ff471a #ff0000
		for(int i=0;i<psList.size();i++) {
			if(pvo.equals("bottom")) {
				sizeGap1=msvo.getWaist()-psList.get(i).getSize1();
				sizeGap2=msvo.getCrotch()-psList.get(i).getSize2();
				sizeGap3=msvo.getThigh()-psList.get(i).getSize3();
				sizeGap4=msvo.getHem()-psList.get(i).getSize4();
				sizeGap5=msvo.getBottomlength()-psList.get(i).getSize5();
				if(sizeGap1<=2&&sizeGap1>=-2) {
					colorGap1="#ffffff";
				}else if(sizeGap1<=4&&sizeGap1>=-4) {
					colorGap1="#ffffb3";
				}else if(sizeGap1<=6&&sizeGap1>=-6) {
					colorGap1="#ffcc99";
				}else if(sizeGap1<=8&&sizeGap1>=-8) {
					colorGap1="#ff471a";
				}
				if(sizeGap2<=2&&sizeGap2>=-2) {
					colorGap2="#ffffff";
				}else if(sizeGap2<=4&&sizeGap2>=-4) {
					colorGap2="#ffffb3";
				}else if(sizeGap2<=6&&sizeGap2>=-6) {
					colorGap2="#ffcc99";
				}else if(sizeGap2<=8&&sizeGap2>=-8) {
					colorGap2="#ff471a";
				}
				if(sizeGap3<=2&&sizeGap3>=-2) {
					colorGap3="#ffffff";
				}else if(sizeGap3<=4&&sizeGap3>=-4) {
					colorGap3="#ffffb3";
				}else if(sizeGap3<=6&&sizeGap3>=-6) {
					colorGap3="#ffcc99";
				}else if(sizeGap3<=8&&sizeGap3>=-8) {
					colorGap3="#ff471a";
				}
				if(sizeGap4<=2&&sizeGap4>=-2) {
					colorGap4="#ffffff";
				}else if(sizeGap4<=4&&sizeGap4>=-4) {
					colorGap4="#ffffb3";
				}else if(sizeGap4<=6&&sizeGap4>=-6) {
					colorGap4="#ffcc99";
				}else if(sizeGap4<=8&&sizeGap4>=-8) {
					colorGap4="#ff471a";
				}
				if(sizeGap5<=2&&sizeGap5>=-2) {
					colorGap5="#ffffff";
				}else if(sizeGap5<=4&&sizeGap5>=-4) {
					colorGap5="#ffffb3";
				}else if(sizeGap5<=6&&sizeGap5>=-6) {
					colorGap5="#ffcc99";
				}else if(sizeGap5<=8&&sizeGap5>=-8) {
					colorGap5="#ff471a";
				}
			}
			////////////////상의,아우터
			else {
				sizeGap1=msvo.getShoulder()-psList.get(i).getSize1();
				sizeGap2=msvo.getChest()-psList.get(i).getSize2();
				sizeGap3=msvo.getSleeve()-psList.get(i).getSize3();
				sizeGap4=msvo.getArmhole()-psList.get(i).getSize4();
				sizeGap5=msvo.getToplength()-psList.get(i).getSize5();
				if(sizeGap1<=2&&sizeGap1>=-2) {
					colorGap1="#ffffff";
				}else if(sizeGap1<=4&&sizeGap1>=-4) {
					colorGap1="#ffffb3";
				}else if(sizeGap1<=6&&sizeGap1>=-6) {
					colorGap1="#ffcc99";
				}else if(sizeGap1<=8&&sizeGap1>=-8) {
					colorGap1="#ff471a";
				}
				if(sizeGap2<=2&&sizeGap2>=-2) {
					colorGap2="#ffffff";
				}else if(sizeGap2<=4&&sizeGap2>=-4) {
					colorGap2="#ffffb3";
				}else if(sizeGap2<=6&&sizeGap2>=-6) {
					colorGap2="#ffcc99";
				}else if(sizeGap2<=8&&sizeGap2>=-8) {
					colorGap2="#ff471a";
				}
				if(sizeGap3<=2&&sizeGap3>=-2) {
					colorGap3="#ffffff";
				}else if(sizeGap3<=4&&sizeGap3>=-4) {
					colorGap3="#ffffb3";
				}else if(sizeGap3<=6&&sizeGap3>=-6) {
					colorGap3="#ffcc99";
				}else if(sizeGap3<=8&&sizeGap3>=-8) {
					colorGap3="#ff471a";
				}
				if(sizeGap4<=2&&sizeGap4>=-2) {
					colorGap4="#ffffff";
				}else if(sizeGap4<=4&&sizeGap4>=-4) {
					colorGap4="#ffffb3";
				}else if(sizeGap4<=6&&sizeGap4>=-6) {
					colorGap4="#ffcc99";
				}else if(sizeGap4<=8&&sizeGap4>=-8) {
					colorGap4="#ff471a";
				}
				if(sizeGap5<=2&&sizeGap5>=-2) {
					colorGap5="#ffffff";
				}else if(sizeGap5<=4&&sizeGap5>=-4) {
					colorGap5="#ffffb3";
				}else if(sizeGap5<=6&&sizeGap5>=-6) {
					colorGap5="#ffcc99";
				}else if(sizeGap5<=8&&sizeGap5>=-8) {
					colorGap5="#ff471a";
				}
			}
			psgList.add(new ProductSizeGapVO(colorGap1,colorGap2,colorGap3,colorGap4,colorGap5));
		}
		return psgList;
	}
	

	@Override
	public void uploadImages(UploadVO vo) {
		// TODO Auto-generated method stub
		
	}
	//[재현][이미지 등록]
	@Transactional
	@Override
	public void registerImage(ImageVO ivo) {
		productDAO.registerImage(ivo);
	}
	
	//[재현][상품 등록]	
	@Transactional
	@Override
	public void registerProduct(ProductVO productVO) {
		productDAO.registerProduct(productVO);
		
	}
	
	//[재현][상품 치수 등록]
	@Transactional
	@Override
	public void registerProductSize(ProductSizeVO psvo) {
		productDAO.registerProductSize(psvo);
		
	}
	
	//[재현][상품 색상 등록]
	@Transactional
	@Override
	public void registerColor(ProductDetailVO pdvo) {
		productDAO.registerColor(pdvo);
		
	}
	
	//[재현][상품 상세 등록]
	@Transactional
	@Override
	public void registerProductDetail(ProductDetailVO pdvo) {
		productDAO.registerProductDetail(pdvo);
		
	}
	
	@Override
	public String findColorByName(ProductDetailVO pdvo) {
		// TODO Auto-generated method stub
		return productDAO.findColorByName(pdvo);
	}
	@Override
	public int productTotalCount(String keyword) {
		return productDAO.productTotalCount(keyword);
	}
	
	//[영훈][11/29][상품리뷰 총 개수]
	@Override
	public int getTotalProductReviewCount(String pno) {
		return productDAO.getTotalProductReviewCount(pno);
	}
	@Override
	public void hitUpByPno(String pno) {
		productDAO.hitUpByPno(pno);
		
	}
	@Override
	public List<ProductVO> productListByHit(PagingBean pb) {
		System.out.println("            ProductServiceImpl/productListByHit()/시작");
		List<ProductVO> ProductList=productDAO.productListByHit(pb);
		System.out.println("      		ProductServiceImpl/productListByHit()/종료 - ProductList:"+ProductList);
		return ProductList;
	}
	//[석환][11/30][상품문의 총 개수]
	@Override
	public int getTotalProductQnaCountByPno(String pno) {
		return productDAO.getTotalProductQnaCountByPno(pno);
	}
	//[석환][11/30][상품문의 페이징 처리]
	@Override
	public List<ProductQnaVO> findProductQnaByPno(Map<String, Object> map){
		System.out.println("            ProductServiceImpl/findProductQnaByPno()/문의처리 pno:"+map.get("pno"));
		return productDAO.findProductQnaByPno(map);
	}
	//[영훈][12/1][리뷰수정]
	@Override
	public void reviewUpdateAjax(ProductReviewVO prvo) {
		productDAO.reviewUpdateAjax(prvo);
	}
		
}
