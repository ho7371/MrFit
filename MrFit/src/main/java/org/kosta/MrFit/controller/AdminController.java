package org.kosta.MrFit.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.MrFit.model.AdminService;
import org.kosta.MrFit.model.ImageVO;
import org.kosta.MrFit.model.ListVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.OrderVO;
import org.kosta.MrFit.model.PagingBean;
import org.kosta.MrFit.model.ProductDetailVO;
import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductSizeVO;
import org.kosta.MrFit.model.ProductVO;
import org.kosta.MrFit.model.UploadVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	@Resource
	private ProductService productService;
	private PagingBean pb;

	@Secured("ROLE_ADMIN")
	@RequestMapping("adminPage.do")
	public String adminPage() {
		System.out.println("   	AdminController/adminPage()/시작");
		return "admin/adminPage.tiles";
	}
	
	/** [진호][관리자 상품 목록보기]
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminProductList.do")
	public ModelAndView adminProductList(HttpServletRequest request, Model model) {
		System.out.println("   	AdminController/adminProductList()/시작");
		
			/* 페이징 처리 공통 영역 */
			int totalCount = productService.getTotalProductCount();
			int postCountPerPage = 10;
			int postCountPerPageGroup = 5;
			int nowPage = 1;
			String pageNo = request.getParameter("pageNo");
				if(pageNo != null) {
					nowPage = Integer.parseInt(pageNo);
				}
			pb = new PagingBean(totalCount,nowPage, postCountPerPage, postCountPerPageGroup);
			
		ModelAndView mv = new ModelAndView();
		List<ProductVO> productList=productService.ProductList(pb);
		ListVO<ProductVO> lvo = new ListVO<ProductVO>();
		
		System.out.println("      AdminController/adminProductList()/진행 - productList : "+productList);
		
		if(productList!=null&&!productList.isEmpty()) {
			lvo.setList(productList);
			lvo.setPagingBean(pb);
			mv.addObject("lvo",lvo);
		}
		
		mv.setViewName("admin/adminProductList.tiles");
		System.out.println("      AdminController/adminProductList()/종료");
		return mv;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/registerProductForm.do")
	public String registerProductForm() {
		System.out.println("   	AdminController/registerProductForm()/시작");
		return "admin/registerProductForm.tiles";
	}
	
	/** [진호][관리자 상품 검색]
	 * 
	 * @param keyword
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminFindProductByName.do")
	public ModelAndView findProductByName(String keyword, HttpServletRequest request){
		System.out.println("   	AdminController/findProductByName()/시작");
		ModelAndView mv = new ModelAndView();
		List<ProductVO> list = productService.findProductByName(keyword);
		
		System.out.println("   	AdminController/findProductByName()/진행 - 검색한 리스트 : "+list);
		if(list!= null) {
			mv.addObject("list", list);
		}
		mv.setViewName("admin/adminProductList.tiles");
		System.out.println("    AdminController/findProductByName()/종료");
		return mv;
		
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
	 * Tomcat /conf/context.xml 
		이클립스 Servers/Tomcat config / context.xml 두 곳에 다음 설정을 추가해야 합니다. 
		<Context reloadable="true" allowCasualMultipartParsing="true">
	 */
	
	@Transactional
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/registerProduct.do")
	public ModelAndView registerProduct(UploadVO vo, ProductVO productVO, HttpServletRequest request) {
		System.out.println("   	AdminController/registerProduct()/시작");
			// 젤 처음 pno 등록 name, price, content, category
			//productService.registerProduct(productVO);
			System.out.println(productVO);
		
		
			ArrayList<String> psnolist=new ArrayList<String>(); // 등록한 사이즈 psno들
			String[] size_name=request.getParameterValues("size_name");
			String[] size1=request.getParameterValues("size1");
			String[] size2=request.getParameterValues("size2");
			String[] size3=request.getParameterValues("size3");
			String[] size4=request.getParameterValues("size4");
			String[] size5=request.getParameterValues("size5");
			ProductSizeVO psvo=new ProductSizeVO();
			System.out.println(size_name);
			System.out.println(size1);
			System.out.println(size2);
			for (int i=0;i<size_name.length;i++) {		
				psvo.setSize_name(size_name[i]);
				psvo.setSize1(Integer.parseInt(size1[i]));
				psvo.setSize2(Integer.parseInt(size2[i]));
				psvo.setSize3(Integer.parseInt(size3[i]));
				psvo.setSize4(Integer.parseInt(size4[i]));
				psvo.setSize5(Integer.parseInt(size5[i]));
				//productService.registerProductSize(psvo);
				psnolist.add(psvo.getPsno());
			}


			
			ArrayList<String> pcnolist=new ArrayList<String>(); // 등록한 색상 pcno들 
			String[] colleng=request.getParameterValues("colleng");
			String[] color=request.getParameterValues("colorS");
			ProductDetailVO pdvo=new ProductDetailVO();
			for (int i=0;i<color.length;i++) {
				pdvo.setColor_name(color[i]);
				//productService.registerColor(pdvo);
				pcnolist.add(pdvo.getPcno());
			}
			System.out.println(colleng);
			System.out.println(color);
			//if(size_name==size)
				
			//inventory
			String[] inventory=request.getParameterValues("inventory");
			

			System.out.println(inventory);
			
			for (int i=0;i<psnolist.size();i++) {
				
				pdvo.setColor_name(inventory[i]);
				//productService.registerProductDetail(pdvo);
			}
			
			String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
			File uploadDir=new File(uploadPath);
			if(uploadDir.exists()==false) {
				uploadDir.mkdirs();
			}
			
			List<MultipartFile> list=vo.getFile();
			ArrayList<String> nameList=new ArrayList<String>();		
			System.out.println("   	AdminController/registerProduct()/진행1");
			
			String thumbPath = uploadPath+"thumb/";
			String imagePath = uploadPath+productVO.getCategory()+"/";
			String fileName = productVO.getName();	
			String realName=list.get(0).getOriginalFilename();
			System.out.println(thumbPath);
			System.out.println(imagePath);
			System.out.println(realName);
			try {
				if(!fileName.equals("")){
					list.get(0).transferTo(new File(thumbPath+fileName+".jpg"));
				}
				
				System.out.println("   	AdminController/registerProduct()/진행2 - 대표이미지 업로드");
				
				for(int i=1; i<list.size(); i++){
					fileName =  productVO.getName()+i+".jpg";		
					if(!fileName.equals("")){	//만약 업로드 파일이 없으면 파일명은 공란처리된다.
						try {
							list.get(i).transferTo(new File(imagePath+fileName)); 	//업로드 파일이 있으면 파일을 특정경로로 업로드한다
							System.out.println("   	AdminController/registerProduct()/진행2"+"."+i+" - 업로드");
							nameList.add(fileName);
							ImageVO ivo=new ImageVO(vo.getPno(),fileName);
							//productService.registerImage(ivo);
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
	
	
	/** [영훈] [관리자 회원리스트 공통메서드(회원/탈퇴회원) ]
	 * @param request
	 * @param status
	 * @return
	 */
	@SuppressWarnings("null")
	@Secured("ROLE_ADMIN")
	@RequestMapping("commonMemberList.do")
	public ModelAndView commonMemberList(HttpServletRequest request, int status) {
		System.out.println("   	AdminController/commonMemberList()/시작");
		ModelAndView mv = new ModelAndView();
		
			/* 페이징 처리 공통 영역 */
			int totalCount = adminService.getTotalCommonMemberCount(status);
			int postCountPerPage = 10;
			int postCountPerPageGroup = 5;
			int nowPage = 1;
			String pageNo = request.getParameter("pageNo");
				if(pageNo != null) {
					nowPage = Integer.parseInt(pageNo);
				}
			pb = new PagingBean(totalCount,nowPage, postCountPerPage, postCountPerPageGroup);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("pagingBean", pb);
		
		List<MemberVO> list = adminService.commonMemberList(map);
		ListVO<MemberVO> lvo = new ListVO<MemberVO>(list,pb);
		mv.addObject("lvo",lvo);
		if(status==1) {
			mv.setViewName("admin/memberList.tiles");
		}else {
			mv.setViewName("admin/unregisterMemberList.tiles");
		}
		
		System.out.println("   	AdminController/commonMemberList()/종료");
		return mv;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminUnregisterMember.do")
	public ModelAndView adminUnregisterMember(String id) {
		adminService.adminDeleteMemberAuthority(id);
		adminService.adminUpdateMemberStatus(id);
		return new ModelAndView("admin/adminUnregisterMember.tiles");
	}
	
	/** [영훈][관리자 회원검색 기능]
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminSearchMember.do")
	public ModelAndView adminSearchMember(String id) {
		MemberVO mvo = adminService.adminSearchMember(id);
		ModelAndView mv = null;
		if(mvo==null) {
			mv = new ModelAndView("admin/adminSearchMember_fail.tiles");
			return mv;
		}else {
			mv = new ModelAndView("admin/adminSearchMember_ok.tiles","member",mvo);
			return mv;
		}
	}
	
	/** [영훈][관리자 회원 포인트지급 폼 페이지 기능]
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="adminGivePointToMemberForm.do", method=RequestMethod.POST)
	public ModelAndView adminGivePointToMemberForm(String id) {
		MemberVO mvo = adminService.adminSearchMember(id);
		return new ModelAndView("admin/adminGivePointToMemberForm.tiles","member",mvo);
	}
	
	/** [영훈][관리자 포인트지급 기능]
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="adminGivePointToMember.do", method=RequestMethod.POST)
	public String adminGivePointToMember(MemberVO mvo) {
		adminService.adminGivePointToMember(mvo);
		return "redirect:adminSearchMember.do?id="+mvo.getId();
	}
	
	
	/**[현민][11/23][관리자 전체 주문 내역]
	 * 
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminAllOrderList.do")
	public ModelAndView adminAllOrderList(HttpServletRequest request) {
		System.out.println("   	AdminController/adminAllOrderList()/시작");
		ModelAndView mv = new ModelAndView();
		
		/* 페이징 처리 공통 영역 */
		int totalOrderCount = adminService.adminTotalOrderCount();
		int postCountPerPage = 4;
		int postCountPerPageGroup = 2;
		int nowPage = 1;
		String pageNo = request.getParameter("pageNo");
			if(pageNo != null) {
				nowPage = Integer.parseInt(pageNo);
			}
		pb = new PagingBean(totalOrderCount,nowPage, postCountPerPage, postCountPerPageGroup);
		
		System.out.println("	AdminController/adminAllOrderList()/진행1 주문개수 : "+totalOrderCount);
		List<OrderVO> list = adminService.adminAllOrderList(pb);
		ListVO<OrderVO> lvo = new ListVO<OrderVO>(list,pb);
		System.out.println("   	AdminController/adminAllOrderList()/진행2 lvo : "+lvo);
		mv.setViewName("admin/adminAllOrderList.tiles");
		mv.addObject("lvo", lvo);
		System.out.println("   	AdminController/adminAllOrderList()/종료");
		return mv;
	}
	
	/**[현민][11/24][아이디 검색]
	 * 주문 내역에서 아이디를 검색 할 수 있다.
	 * @param request
	 * @param memberId
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminSearchOrder.do")
	public ModelAndView adminSearchOrder(HttpServletRequest request, String memberId) {
		System.out.println("   	AdminController/adminSearchOrder()/시작");
		ModelAndView mv = new ModelAndView();
		
		/* 페이징 처리 공통 영역*/ 
		int totalOrderCount = adminService.adminSearchMemberOrderCount(memberId);
		int postCountPerPage = 3;
		int postCountPerPageGroup = 2;
		int nowPage = 1;
		String pageNo = request.getParameter("pageNo");
			if(pageNo != null) {
				nowPage = Integer.parseInt(pageNo);
			}
		pb = new PagingBean(totalOrderCount,nowPage, postCountPerPage, postCountPerPageGroup);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("pagingBean", pb);
		
		//System.out.println("	AdminController/adminSearchOrder()/진행1 주문 개수 : "+totalOrderCount);
		List<OrderVO> list = adminService.adminSearchOrder(map);
		if(!list.isEmpty()) {
			
			ListVO<OrderVO> lvo = new ListVO<OrderVO>(list,pb);
			System.out.println("   	AdminController/adminSearchOrder()/진행2 lvo : "+lvo);
			mv.setViewName("admin/adminSearchMemberOrder.tiles");
			mv.addObject("lvo", lvo);
		}else {
			mv.setViewName("admin/adminSearchMemberOrder_fail.tiles");
		}
		System.out.println("   	AdminController/adminSearchOrder()/종료");
		return mv;
	}
	
	/**[현민][11/24][주문 상태 변경]
	 * 주문번호를 받아와 주문정보를 찾은 후 
	 * 주문상태를 
	 * 입금대기 -> 배송준비중 -> 배송중 -> 배송완료
	 * 이 순서대로 변경한다.
	 * @param ono
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("updateOrderStatus.do")
	public ModelAndView updateOrderStatus(String ono) {
		System.out.println("   	AdminController/updateOrderStatus()/시작 ono : "+ono);
		ModelAndView mv = new ModelAndView();
		OrderVO ovo = adminService.adminfindOrderByOno(ono);
		System.out.println("   	AdminController/updateOrderStatus()/진행1 ");
		Map<String, String> map = new HashMap<String, String>();
		if(ovo.getStatus().equals("입금대기")) {
			map.put("status", "배송준비중");
		}else if(ovo.getStatus().equals("배송준비중")) {
			map.put("status", "배송중");
		}else if(ovo.getStatus().equals("배송중")) {
			map.put("status", "배송완료");
		}
		map.put("ono", ono);
		adminService.updateOrderStatus(map);
		System.out.println("   	AdminController/updateOrderStatus()/진행2 ");
		mv.setViewName("admin/updateOrderStatus_ok.tiles");
		System.out.println("   	AdminController/updateOrderStatus()/종료");
		return mv;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="registerNoticeForm.do", method=RequestMethod.GET)
	public String noticeForm() {
		System.out.println("   	AdminController/noticeForm()/시작");
		return "admin/registerNoticeForm.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="registerNoteForm.do", method=RequestMethod.GET)
	public String registerNoteForm() {
		System.out.println("   	AdminController/registerNoteForm()/시작");
		return "admin/registerNoteForm.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="adminNoteList.do", method=RequestMethod.GET)
	public String adminNoteList() {
		System.out.println("   	AdminController/adminNoteList()/시작");
		return "board/note.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="adminNoticeList.do", method=RequestMethod.GET)
	public String adminNoticeList() {
		System.out.println("   	AdminController/adminNoticeList()/시작");
		return "board/notice.tiles";
	}
}














