package org.kosta.MrFit;

//github.com/ho7371/MrFit.git
import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.MrFit.model.MemberDAO;
import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.OrderService;
import org.kosta.MrFit.model.ProductService;


import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class UnitTest {
	@Resource
	 private MemberDAO memberDAO;
	 @Resource
	 private MemberService memberService;
	@Resource
	private ProductService pservice;
	
	@Resource
	private OrderService oservice;
	
	 @Test
	 public void unitTest() {
	  //System.out.println(memberDAO.findMemberById("java"));
	  /*System.out.println(pservice.findProductDtailByPno("3"));
	  System.out.println("*******************************");
	  System.out.println(pservice.findProductDtailByPno("3").getProductDetailList());
	  System.out.println("*******************************");
	  System.out.println(pservice.findProductDtailByPno("3").getImageList());*/
	  //System.out.println(pservice.findProductByName("청바지"));
		 /*	MemberVO memberVO=new MemberVO();
		 	memberVO.setId("mrfit");
		 	memberVO.setPassword("hot6");
		   memberService.updatePasswordById(memberVO);


		 
		/* System.out.println("OrderService : "+oservice);
		 Map<String,Object> map =  oservice.findMyCart("java3");
		 System.out.println("map : "+map);*/
		 //System.out.println("test1 : "+oservice.findMyCart("java3").get("cart"));
	
		// Map<String,Object> map;

	 }
	 

}
