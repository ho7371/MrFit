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
import org.kosta.MrFit.model.BoardService;
import org.kosta.MrFit.model.BoardVO;
import org.kosta.MrFit.model.ImageVO;
import org.kosta.MrFit.model.ListVO;
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.NoteVO;
import org.kosta.MrFit.model.OrderProductVO;
import org.kosta.MrFit.model.OrderVO;
import org.kosta.MrFit.model.PagingBean;
import org.kosta.MrFit.model.ProductDetailVO;
import org.kosta.MrFit.model.ProductService;
import org.kosta.MrFit.model.ProductSizeVO;
import org.kosta.MrFit.model.ProductVO;
import org.kosta.MrFit.model.UploadVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
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
	@Resource 
	private BoardService boardService;
	private PagingBean pb;

	@Secured("ROLE_ADMIN")
	@RequestMapping("adminPage.do")
	public String adminPage() {
		System.out.println("   	AdminController/adminPage()/시작 및 종료");
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
		int totalCount = productService.getTotalProductCount();			// 보여줄 상품 총 개수
		int postCountPerPage = 10;										// 한 페이지에 보여줄 상품 개수
		int postCountPerPageGroup = 5;									// 한 페이지 그룹에 들어갈 페이지 개수
		int nowPage = 1;	
		String pageNo = request.getParameter("pageNo");					// 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
		if(pageNo != null) {
			nowPage = Integer.parseInt(pageNo);
		}
			
		pb = new PagingBean(totalCount,nowPage, postCountPerPage, postCountPerPageGroup);
			
		ModelAndView mv = new ModelAndView();
		List<ProductVO> productList=productService.ProductList(pb);		// 페이징빈을 던져서 받아온 상품목록
		ListVO<ProductVO> lvo = new ListVO<ProductVO>();
		System.out.println("      AdminController/adminProductList()/진행 - productList : "+productList);
		
		if(productList!=null&&!productList.isEmpty()) {					// 보여줄 상품 목록이 있는 경우
			lvo.setList(productList);									// 상품목록 세팅
			lvo.setPagingBean(pb);
			mv.addObject("lvo",lvo);
		}
		
		mv.setViewName("admin/adminProductList.tiles");
		System.out.println("      AdminController/adminProductList()/종료");
		return mv;
	}
	
	/**[재현][11/25][상품등록폼 보기]
	 * 
	 * @param 
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/registerProductForm.do")
	public String registerProductForm() {
		System.out.println("   	AdminController/registerProductForm()/시작 및 종료");
		return "admin/registerProductForm.tiles";
	}
	
	/** [진호][관리자 상품 검색]
	 * 
	 * @param keyword
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/FindProductByName.do")
	public ModelAndView findProductByName(String keyword, HttpServletRequest request){
		System.out.println("   	AdminController/findProductByName()/시작");
		ModelAndView mv = new ModelAndView();
		
		/* 페이징 처리 공통 영역 */
		int totalOrderCount = productService.productTotalCount(keyword);
		int postCountPerPage = 4;
		int postCountPerPageGroup = 2;
		int nowPage = 1;
		String pageNo = request.getParameter("pageNo");
			if(pageNo != null) {
				nowPage = Integer.parseInt(pageNo);
			}
		pb = new PagingBean(totalOrderCount,nowPage, postCountPerPage, postCountPerPageGroup);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("pagingBean", pb);
		List<ProductVO> list = productService.findProductByName(map);
		ListVO<ProductVO> lvo = new ListVO<ProductVO>(list,pb);
		System.out.println("   	AdminController/findProductByName()/진행 - 검색한 리스트 : "+list);
		if(list!= null) {
			/*mv.addObject("list", list);*/
			mv.addObject("lvo",lvo);
			mv.setViewName("admin/adminProductSearchList.tiles");
		}else {
			mv.setViewName("main/product/findProductByName_fail");
		}
		
		System.out.println("    AdminController/findProductByName()/종료");
		return mv;
		
	}
	

	/**
	 * [진호, 재현, 석환][상품등록]
	 * Tomcat /conf/context.xml 
	 * 이클립스 Servers/Tomcat config / context.xml 두 곳에 다음 설정을 추가해야 합니다.
	 * <Context reloadable="true" allowCasualMultipartParsing="true">
	 * @param uploadVO
	 * @param productVO
	 * @param request
	 * @return
	 */
	@Transactional
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/registerProduct.do")
	public ModelAndView registerProduct(UploadVO uploadVO, ProductVO productVO, HttpServletRequest request) {
		System.out.println("   	AdminController/registerProduct()/시작 - productVO : "+productVO +", uploadVO:"+uploadVO);
		
		productService.registerProduct(productVO);		// 하나의 상품이 가지는 공통정보 등록 (상품번호, 상품명, 가격, 상품설명, 카테고리)
		
		// 상품 치수정보 등록
		ArrayList<String> psnoList=new ArrayList<String>(); 		// 상품치수 번호들을 저장할 ArrayList
		ProductSizeVO psvo=new ProductSizeVO();						// 상품 상세 하나의 모든 정보를 담을 psvo 객체
		String[] size_name=request.getParameterValues("size_name");	// 상품 상세 하나의 사이즈명 정보를 담은 배열
		String[] size1=request.getParameterValues("size1");		
		String[] size2=request.getParameterValues("size2");
		String[] size3=request.getParameterValues("size3");
		String[] size4=request.getParameterValues("size4");
		String[] size5=request.getParameterValues("size5");

		for (int i=0;i<size_name.length;i++) {		
			psvo.setSize_name(size_name[i]);
			psvo.setSize1(Integer.parseInt(size1[i]));
			psvo.setSize2(Integer.parseInt(size2[i]));
			psvo.setSize3(Integer.parseInt(size3[i]));
			psvo.setSize4(Integer.parseInt(size4[i]));
			psvo.setSize5(Integer.parseInt(size5[i]));				// 하나의 psvo에 각 치수정보를 담아
			productService.registerProductSize(psvo);				// 하나의 상품에 상품 상세 정보로 저장
			psnoList.add(psvo.getPsno());
		}
		System.out.println("   	AdminController/registerProduct()/진행1 - 상품 치수 등록 완료");
		
		// 상품 색상정보 등록
		ArrayList<String> pcnolist=new ArrayList<String>(); 		
		String[] color=request.getParameterValues("color");			// 색상 등록 후 반환되는 색상 고유번호를 담을 ArrayList객체 
		
		ProductDetailVO pdvo=new ProductDetailVO();
		for(int i=0;i<color.length;i++) {
			pdvo.setColor_name(color[i]);
			
			String pcno=productService.findColorByName(pdvo);		// 등록할 색상이 이미 DB에 존재하는지 중복확인
				if(pcno!=null) {									// 중복될 경우 객체에만 세팅
					pdvo.setPcno(pcno);
				}else {												// 중복되지 않을 경우 색상을 DB에 등록
					productService.registerColor(pdvo);				 
				}
			pcnolist.add(pdvo.getPcno());
		}
		
		// 재고량과 색상개수
		String[] inventory=request.getParameterValues("inventory");
		String[] colleng=request.getParameterValues("colleng");
		int startNumber=0;
		int endNumber=0;
		int middleNumber=0;
		pdvo.setPno(productVO.getPno());
		for (int i=0;i<psnoList.size();i++) {
			pdvo.setPsno(psnoList.get(i));
			endNumber=Integer.parseInt(colleng[i]);
			//5,3,4
			middleNumber=startNumber+endNumber;
			for (int j=startNumber;j<(middleNumber);j++) {
					//1,2,3,4,5,6,7,8,9,10,11,12		
					pdvo.setPcno(pcnolist.get(j));
					pdvo.setInventory(Integer.parseInt(inventory[j]));
					productService.registerProductDetail(pdvo);
			}
			startNumber=middleNumber;
		}
		System.out.println("   	AdminController/registerProduct()/진행2 - 상품 색상 및 재고량 등록 완료");
		
		
		// 이미지 저장 경로
		//String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");		// 서버 경로
		String uploadPath="C:\\Users\\kosta\\git\\MrFit\\MrFit\\src\\main\\webapp\\resources\\upload\\";	// 워크스페이스 경로
		
		File uploadDir=new File(uploadPath);
		if(uploadDir.exists()==false) {
			uploadDir.mkdirs();
		}
		
		List<MultipartFile> uploadImglist=uploadVO.getFile();
		
		String fileName = productVO.getName();	
		String realName=uploadImglist.get(0).getOriginalFilename();
		System.out.println("   	AdminController/registerProduct()/진행4 - 업로드 준비 - uploadPath:"+uploadPath+", realName:"+realName);
		
		// 이미지 업로드
		try {
			// 대표이미지 업로드
			if(!realName.equals("")){	
				uploadImglist.get(0).transferTo(new File(uploadPath+"thumb/"+fileName+realName));
				ImageVO ivo=new ImageVO(productVO.getPno(),"thumb/"+fileName+realName);
				productService.registerImage(ivo);
				System.out.println("   	AdminController/registerProduct()/진행5 - 대표이미지 업로드 완료");
			}
			// 일반 이미지들 업로드
			for(int i=1; i<uploadImglist.size(); i++){
				fileName =  productVO.getName()+i;		
				realName=uploadImglist.get(i).getOriginalFilename();
				System.out.println("   	AdminController/registerProduct()/진행6 - realName:"+realName);
				if(!realName.equals("")){		//만약 업로드 파일이 없으면 파일명은 공란처리된다.
					try {
						uploadImglist.get(i).transferTo(new File(uploadPath+productVO.getCategory()+"/"+fileName+realName)); 	//업로드 파일이 있으면 파일을 특정경로로 업로드한다
						ImageVO ivo=new ImageVO(productVO.getPno(),productVO.getCategory()+"/"+fileName+realName);
						productService.registerImage(ivo);
						System.out.println("   	AdminController/registerProduct()/진행7"+"."+i+" - 업로드 완료");
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
		System.out.println("   	AdminController/registerProduct()/종료 - 상품 등록 & 업로드 완료");
		return mv;
	}

	
	/**
	 * [재현][11/27][상품삭제]
	 * @param pno
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("admin/deleteProduct.do")
	public String deleteProduct(String pno) {
		System.out.println("   	AdminController/deleteProduct()/시작");
		adminService.deleteProduct(pno);
		return "admin/deleteProductResult.tiles";
	}
	
	
	/**
	 * [영훈] [관리자 회원리스트 공통메서드(회원/탈퇴회원) ]
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
		int totalCount = adminService.getTotalCommonMemberCount(status);	// 보여줄 상품 총 개수
		int postCountPerPage = 10;											// 한 페이지에 보여줄 상품 개수
		int postCountPerPageGroup = 5;										// 한 페이지 그룹에 들어갈 페이지 개수
		int nowPage = 1;
		String pageNo = request.getParameter("pageNo");						// 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
			if(pageNo != null) {
				nowPage = Integer.parseInt(pageNo);
			}
		pb = new PagingBean(totalCount,nowPage, postCountPerPage, postCountPerPageGroup);
		
		Map<String, Object> map = new HashMap<String, Object>();			// 페이징빈과 status를 함께 던지기 위한 map
		map.put("status", status);											// 회원의 status값에 따라 분류하기 위한 값
		map.put("pagingBean", pb);
		List<MemberVO> memberList = adminService.commonMemberList(map);
		System.out.println("   	AdminController/commonMemberList()/진행 - 회원목록 :"+memberList);
		
		ListVO<MemberVO> lvo = new ListVO<MemberVO>(memberList,pb);
		mv.addObject("lvo",lvo);
		
		if(status==1) {														// 현재 활성상태인 회원을 검색한 경우
			mv.setViewName("admin/memberList.tiles");						
		}else {																// 현재 비활성상태인 회원을 검색한 경우
			mv.setViewName("admin/unregisterMemberList.tiles");
		}
		
		System.out.println("   	AdminController/commonMemberList()/종료");
		return mv;
	}
	
	/**
	 * [영훈][회원강제탈퇴]
	 * 회원의 ROLE을 삭제하고, 회원의 상태를 비활성 상태로 처리한다.
	 * @param id
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminUnregisterMember.do")
	public ModelAndView adminUnregisterMember(String id) {
		System.out.println("   	AdminController/adminUnregisterMember()/시작");
		adminService.adminDeleteMemberAuthority(id);
		adminService.adminUpdateMemberStatus(id);
		System.out.println("   	AdminController/adminUnregisterMember()/종료");
		return new ModelAndView("admin/adminUnregisterMember.tiles");
	}
	
	/** 
	 * [영훈][관리자 회원검색 기능]
	 * 관리자가 회원의 아이디로 회원을 검색한다.
	 * @param request
	 * @param model
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminSearchMember.do")
	public ModelAndView adminSearchMember(String id) {
		System.out.println("   	AdminController/adminSearchMember()/시작");
		MemberVO mvo = adminService.adminSearchMember(id);	
		ModelAndView mv = null;
		if(mvo==null) {		//검색한 회원이 없을 경우
			mv = new ModelAndView("admin/adminSearchMember_fail.tiles");
		}else {				//검색한 회원이 있을 경우
			mv = new ModelAndView("admin/adminSearchMember_ok.tiles","member",mvo);
		}
		System.out.println("   	AdminController/adminSearchMember()/종료");
		return mv;
	}
	
	/** 
	 * [영훈][관리자 회원 포인트지급 폼 페이지 기능]
	 * @param request
	 * @param model
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="adminGivePointToMemberForm.do", method=RequestMethod.POST)
	public ModelAndView adminGivePointToMemberForm(String id) {
		System.out.println("   	AdminController/adminGivePointToMemberForm()/시작");
		MemberVO mvo = adminService.adminSearchMember(id);
		System.out.println("   	AdminController/adminGivePointToMemberForm()/종료 - 포인트 지급할 회원 :"+mvo);
		return new ModelAndView("admin/adminGivePointToMemberForm.tiles","member",mvo);
	}
	
	/** @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 얼마의 포인트를 지급할 것인지?
	 * [영훈][관리자 포인트지급 기능]
	 * @param mvo
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="adminGivePointToMember.do", method=RequestMethod.POST)
	public String adminGivePointToMember(MemberVO mvo) {
		System.out.println("   	AdminController/adminGivePointToMember()/시작 - 포인트 지급할 회원 :"+mvo);
		adminService.adminGivePointToMember(mvo);
		return "redirect:adminSearchMember.do?id="+mvo.getId();
	}
	
	
	/**
	 * [현민][11/23][관리자 전체 주문 내역]
	 * @param request
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminAllOrderList.do")
	public ModelAndView adminAllOrderList(HttpServletRequest request) {
		System.out.println("   	AdminController/adminAllOrderList()/시작");
		ModelAndView mv = new ModelAndView();
		
		/* 페이징 처리 공통 영역 */
		int totalOrderCount = adminService.adminTotalOrderCount();			// 보여줄 주문 총 개수
		int postCountPerPage = 4;											// 한 페이지에 보여줄 상품 개수
		int postCountPerPageGroup = 2;										// 한 페이지 그룹에 들어갈 페이지 개수
		int nowPage = 1;
		String pageNo = request.getParameter("pageNo");						// 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
			if(pageNo != null) {
				nowPage = Integer.parseInt(pageNo);
			}
		pb = new PagingBean(totalOrderCount,nowPage, postCountPerPage, postCountPerPageGroup);
		
		
		List<OrderVO> orderList = adminService.adminAllOrderList(pb);
		System.out.println("	AdminController/adminAllOrderList()/진행 - 보여줄 주문목록 : "+orderList);
		
		ListVO<OrderVO> lvo = new ListVO<OrderVO>(orderList,pb);
		mv.setViewName("admin/adminAllOrderList.tiles");
		mv.addObject("lvo", lvo);
		System.out.println("   	AdminController/adminAllOrderList()/종료");
		return mv;
	}

	
	/**
	 * [진호][키워드별 주문 검색]
	 * @param request
	 * @param searchType
	 * @param searchKeyword
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminSearchOrder.do")
	public ModelAndView adminSearchOrderByKeyword(HttpServletRequest request, String searchType, String searchKeyword) {
		System.out.println("   	AdminController/adminSearchOrderByKeyword()/시작");
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		
		/* 페이징 처리 공통 영역*/ 
		int totalOrderCount = 0;							// 보여줄 주문의 총 개수 : 키워드에 따라 다르기에 초기값으로 설정
		int postCountPerPage = 10;							// 한 페이지에 보여줄 주문 개수
		int postCountPerPageGroup = 5;						// 한 페이지 그룹에 들어갈 페이지 개수
		int nowPage = 1;
		String pageNo = request.getParameter("pageNo");				
		if(pageNo != null) {								// 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
			nowPage = Integer.parseInt(pageNo);
		}
		
		// 회원 아이디로 검색할 경우
		if(searchType.equals("memberId")) {
			System.out.println("   	AdminController/adminSearchOrderByKeyword()/ 회원아이디로 주문검색1 - 회원아이디 : "+searchKeyword);
			totalOrderCount = adminService.adminSearchMemberOrderCount(searchKeyword);
			pb = new PagingBean(totalOrderCount,nowPage, postCountPerPage, postCountPerPageGroup);
			map.put("memberId", searchKeyword);
			map.put("pagingBean", pb);
			List<OrderVO> orderList = adminService.adminSearchOrder(map);
			
			if(!orderList.isEmpty()) {	// 보여줄 주문이 있는 경우
				System.out.println("   	AdminController/adminSearchOrderByKeyword()/ 회원아이디로 주문검색3 - 보여줄 주문 있음 :"+orderList);
				ListVO<OrderVO> lvo = new ListVO<OrderVO>(orderList,pb);
				mv.addObject("lvo", lvo);
				mv.addObject("searchType","memberId");
				mv.setViewName("admin/adminAllOrderList.tiles");
			}else {		// 보여줄 주문이 없는 경우
				System.out.println("   	AdminController/adminSearchOrderByKeyword()/ 회원아이디로 주문검색3 - 보여줄 주문 없음");
				mv.setViewName("admin/adminSearchMemberOrder_fail.tiles");
			}
			
		}else { 	
		// 주문번호로 검색할 경우
			System.out.println("   	AdminController/adminSearchOrderByKeyword()/ 주문번호로 주문검색1 - 주문번호 :"+searchKeyword);
			totalOrderCount = adminService.adminSearchOrderCountByOrderNumber(searchKeyword);
			
			if(totalOrderCount != 0) {
				System.out.println("   	AdminController/adminSearchOrderByKeyword()/ 주문번호로 주문검색2 - 검색결과 있음");
				pb = new PagingBean(totalOrderCount,nowPage, postCountPerPage, postCountPerPageGroup);
				OrderVO ovo = adminService.adminSearchOrderByOno(searchKeyword);
				mv.addObject("orderVO", ovo);
				mv.addObject("searchType","orderNo");
				mv.setViewName("admin/adminSearchOrderList.tiles");
			}else {
				System.out.println("   	AdminController/adminSearchOrderByKeyword()/ 주문번호로 주문검색3 - 검색 결과 없음");
				mv.setViewName("admin/adminsearchOrder_fail.tiles");
			}
		}
		System.out.println("   	AdminController/adminSearchOrderByKeyword()/ 종료");
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
	
	//[정현][11/25][ 공지사항 리스트 ]
	@RequestMapping("notice.do")	
	public ModelAndView notice(HttpServletRequest  request){
		ModelAndView mv = new ModelAndView();
		ListVO<BoardVO> lvo = new ListVO<BoardVO>();
		System.out.println("      AdminController/notice()/시작");		
		
		/* 페이징 처리 공통 영역 */
		int totalCount = boardService.getTotalNoticeCount();							// 보여줄 공지사항 총 개수				 
		int postCountPerPage = 10;												 		// 한 페이지에 보여줄 공지사항 개수
		int postCountPerPageGroup = 5;													// 한 페이지 그룹에 들어갈 페이지 개수
		int nowPage = 1;
		String pageNo = request.getParameter("pageNo");									// 요청 페이지 넘버가 있는 경우, 그 페이지로 세팅함
			if(pageNo != null) {
				nowPage = Integer.parseInt(pageNo);
			}		
		pb = new PagingBean(totalCount,nowPage, postCountPerPage, postCountPerPageGroup);
		System.out.println("      AdminController/notice()/진행1 - nowpage : "+nowPage);
		System.out.println("      AdminController/notice()/진행2 - endnumber : "+pb.getEndRowNumber());
		List<BoardVO> nlist= boardService.noticeList(pb);
		System.out.println("      AdminController/notice()/진행3 - nlist :"+nlist);
		if(nlist!=null&&!nlist.isEmpty()) {												 // 공지사항이 있거나 비어있지 않을 때
			lvo.setList(nlist);															 // list와 pagingBean을 ListVO에 셋팅
			lvo.setPagingBean(pb);
			System.out.println("      AdminController/notice()/진행4 - lvo :"+lvo);
		}			
		mv.addObject("lvo", lvo);		
		mv.setViewName("board/notice.tiles");		
		System.out.println("      AdminController/notice()/종료");
		return mv;
	}
	
	//[정현][11/25][ 공지사항 상세보기 ]
	@RequestMapping(value="noticeDetail.do", method=RequestMethod.GET)	
	public ModelAndView noticeDetail(HttpServletRequest  request){
		System.out.println("   	AdminController/noticeDetail()/시작");	
		ModelAndView mv = new ModelAndView();
		String bno=request.getParameter("bno");
		BoardVO bvo=boardService.noticeDetail(bno);
		System.out.println("   	AdminController/noticeDetail()/진행");	
		mv.addObject("bvo",bvo);
		mv.setViewName("board/noticeDetail.tiles");
		System.out.println("   	AdminController/noticeDetail()/종료");	
		return mv;
	}
	
	//[정현][11/25][ 공지사항 삭제 ]
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="deleteNotice.do", method=RequestMethod.GET)	
	public String deleteNotice(HttpServletRequest  request){	
		System.out.println("   	AdminController/deleteNotice()/시작");		
		String bno=request.getParameter("bno");
		System.out.println("   	AdminController/deleteNotice()/진행");		
		boardService.deleteNotice(bno);		
		System.out.println("   	AdminController/deleteNotice()/종료");
		
		return "redirect:notice.do";
	}
	
	//[정현][11/25][ 공지사항 등록 폼으로 넘기기 ]	
	@RequestMapping("registerNoticeForm.do")			
	public String registerNoticeForm(HttpServletRequest  request){		
	System.out.println("   	AdminController/registerNoticeForm()/시작");
	System.out.println("   	AdminController/registerNoticeForm()/종료");		
		return "board/registerNoticeForm.tiles";
	}
		
	//[정현][11/25][ 공지사항 등록 후 공지사항 리스트로 ]
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="registerNotice.do", method=RequestMethod.GET)	
	public String registerNotice(HttpServletRequest  request){
		System.out.println("   	AdminController/registerNotice()/시작");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BoardVO bvo=new BoardVO();
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		bvo.setId(mvo.getId());											
		bvo.setTitle(title);											
		bvo.setContent(content);										
		System.out.println("   	AdminController/registerNotice()/진행");
		boardService.registerNotice(bvo);								
		System.out.println("   	AdminController/registerNotice()/종료");
		return "redirect:notice.do";
	}
	
	
	//[정현][11/27][공지사항 수정폼] 
	@RequestMapping("updateNoticeForm.do")
	public ModelAndView updateNoteForm(HttpServletRequest request) {
		System.out.println("   	AdminController/updateNoteForm()/시작");
		ModelAndView mv = new ModelAndView();
		String bno=request.getParameter("bno");
		BoardVO bvo=boardService.noticeDetail(bno);
		System.out.println("   	AdminController/updateNoteForm()/진행");
		mv.addObject("bvo",bvo);
		mv.setViewName("admin/updateNoticeForm.tiles");
		System.out.println("   	AdminController/updateNoteForm()/종료");
		return mv;
	}
	
	//[정현][11/27][공지사항 수정]
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="updateNotice.do", method=RequestMethod.GET)
	public String updateNotice(HttpServletRequest request) {
		System.out.println("   	AdminController/updateNotice()/시작");
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BoardVO bvo=new BoardVO();
		String bno=request.getParameter("bno");							
		String title=request.getParameter("title");						
		String content=request.getParameter("content");					
		System.out.println("   	AdminController/updateNotice()/진행");
		bvo.setId(mvo.getId());											
		bvo.setBno(bno);
		bvo.setTitle(title);
		bvo.setContent(content);		
		boardService.updateNotice(bvo);									
		System.out.println("   	AdminController/updateNotice()/종료");
		return "redirect:notice.do";
	}
	
	/**[현민][11/24][쪽지함]
	 * 관리자가 보낸 쪽지 리스트를 불러온다.
	 * @return
	 */
	@RequestMapping("adminNoteList.do")
	public ModelAndView adminNoteList() {
		System.out.println("   	AdminController/adminNoteList()/시작");
		ModelAndView mv = new ModelAndView();
		List<NoteVO> list = adminService.getNoteList();
		System.out.println("   	AdminController/adminNoteList()/진행 list : "+ list);
		mv.setViewName("board/note.tiles");
		mv.addObject("list", list);
		System.out.println("   	AdminController/adminNoteList()/종료");
		return mv;
	}
	

	@RequestMapping("adminNoticeList.do")
	public String adminNoticeList() {
		System.out.println("   	AdminController/adminNoticeList()/시작");
		return "board/notice.tiles";
	}
	
	/**[현민][11/24][쪽지 보내기]
	 * 회원 관리 페이지에서 각각의 회원에게 쪽지를 보낼수 있다.
	 * @param message
	 * @param id
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("sendMessage.do")
	public ModelAndView sendMessage(String message,String id) {
		System.out.println("   	AdminController/message()/시작 ");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", message);
		map.put("id", id);
		System.out.println("   	AdminController/message()/진행 message : "+message+" id : "+id);
		adminService.sendMessage(map);
		System.out.println("   	AdminController/message()/종료 ");
		return new ModelAndView("admin/message_ok.tiles","id",id);
	}
	
	/**[현민][11/25][주문 상품 상세보기]
	 * 
	 * @param ono
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("orderProductInfo.do")
	public ModelAndView orderProductInfo(String ono) {
		System.out.println("   	AdminController/orderProductInfo()/시작 ");
		ModelAndView mv = new ModelAndView();
		List<OrderProductVO> list = adminService.orderProductInfo(ono);					// 주문번호로 주문 상품 정보 찾기
		System.out.println("   	AdminController/orderProductInfo()/진행 list : "+list);
		mv.setViewName("admin/orderProductInfo.tiles");
		mv.addObject("list", list);
		System.out.println("   	AdminController/orderProductInfo()/종료 ");
		return mv;
	}
}














