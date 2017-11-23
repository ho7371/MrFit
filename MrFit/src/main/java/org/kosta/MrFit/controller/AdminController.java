package org.kosta.MrFit.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.PagingBean;
import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductVO;
import org.kosta.MrFit.model.UploadVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Resource
	private ProductService productService;
	private PagingBean pb;

	@RequestMapping("adminPage.do")
	public String adminPage() {
		System.out.println("   	AdminController/adminPage()/시작");
		return "admin/adminPage.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminProductList.do")
	public String adminProductList(HttpServletRequest request, Model model) {
		System.out.println("   	AdminController/adminProductList()/시작");
		
		int pbCount=productService.getTotalProductCount();
		String pno=request.getParameter("pageNo");
		System.out.println("      AdminController/adminProductList()/진행1");
		if(pno==null){
			pb = new PagingBean(pbCount);
		}else{
			pb = new PagingBean(pbCount,Integer.parseInt(pno));
		}
		List<ProductVO> ProductList=productService.ProductList(pb);
		System.out.println("      AdminController/adminProductList()/진행2 - pno:"+pno+", 상품목록:"+ProductList);		
		
		if(ProductList!=null&&!ProductList.isEmpty()) {
			model.addAttribute("ProductList",ProductList);
			model.addAttribute("pb",pb);
		}
		System.out.println("      AdminController/adminProductList()/종료");
		return "admin/adminProductList.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/registerProductForm.do")
	public String registerProductForm() {
		System.out.println("   	AdminController/registerProduct()/시작");
		return "admin/registerProductForm.tiles";
	}
	
	
	/** [진호][상품등록]
	 * 	nameList : view 화면에 업로드 된 파일 목록을 전달하기 위한 리스트 
	 * 	thumbPath : 상품의 대표이미지가 저장될 위치
	 * 	imagePath : 대표이미지를 제외한 이미지들이 저장될 위치
	 * 
	 * @param vo
	 * @param request
	 * @param productName
	 * @return
	 */
	@Transactional
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/registerProduct.do")
	public ModelAndView registerProduct(UploadVO vo, ProductVO productVO, HttpServletRequest request) {
		System.out.println("   	AdminController/registerProduct()/시작");
		
			String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
			File uploadDir=new File(uploadPath);
			if(uploadDir.exists()==false) {
				uploadDir.mkdirs();
			}
			
			List<MultipartFile> list=vo.getFiles();
			ArrayList<String> nameList=new ArrayList<String>();		
			System.out.println("   	AdminController/registerProduct()/진행1");
			
			String thumbPath = uploadPath+"thumb/";
			String imagePath = uploadPath+productVO.getCategory()+"/";
			String fileName = productVO.getName();	
			
			try {
				if(!fileName.equals("")){
					list.get(0).transferTo(new File(thumbPath+fileName));
				}
				
				System.out.println("   	AdminController/registerProduct()/진행2 - 대표이미지 업로드");
				
				for(int i=1; i<list.size(); i++){
					fileName =  productVO.getName()+i;		
					if(!fileName.equals("")){	//만약 업로드 파일이 없으면 파일명은 공란처리된다.
						try {
							list.get(i).transferTo(new File(imagePath+fileName)); 	//업로드 파일이 있으면 파일을 특정경로로 업로드한다
							System.out.println("   	AdminController/registerProduct()/진행2"+"."+i+" - 업로드");
							nameList.add(fileName);
						} catch (Exception e) {					
							e.printStackTrace();
						} 
					}
				}
			} catch (IllegalStateException | IOException e1) {
				e1.printStackTrace();
			}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/registerProductResult.tiles");
		mv.addObject("nameList", nameList);
		System.out.println("   	AdminController/registerProduct()/종료 - 업로드 완료");
		return mv;
	}
	
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/updateProductForm.do")
	public String updateProductForm() {
		System.out.println("   	AdminController/updateProductForm()/시작");
		return "admin/updateProductForm.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/deleteProduct.do")
	public String deleteProduct(String pno) {
		System.out.println("   	AdminController/deleteProduct()/시작");
		// 현재는 null
		return null;
	}
	
}
