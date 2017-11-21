package org.kosta.MrFit;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.List;

=======
>>>>>>> branch 'master' of https://github.com/ho7371/MrFit.git
import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.MrFit.model.MemberDAO;
import org.kosta.MrFit.model.MemberService;
<<<<<<< HEAD
import org.kosta.MrFit.model.MemberVO;
import org.kosta.MrFit.model.OrderProductVO;
=======
>>>>>>> branch 'master' of https://github.com/ho7371/MrFit.git
import org.kosta.MrFit.model.OrderService;
<<<<<<< HEAD
import org.kosta.MrFit.model.OrderVO;
//github.com/ho7371/MrFit.git
=======
>>>>>>> branch 'master' of https://github.com/ho7371/MrFit.git
import org.kosta.MrFit.model.ProductService;
<<<<<<< HEAD
//github.com/ho7371/MrFit.git
=======
>>>>>>> branch 'master' of https://github.com/ho7371/MrFit.git
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
		 System.out.println(memberService.findMemberById("mrfit"));*/
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/ho7371/MrFit.git
		 // System.out.println(pservice.findProductDtailByPno("1"));
		 //System.out.println(pservice.findProductByName("청바지"));
<<<<<<< HEAD
		 
		/* System.out.println("OrderService : "+oservice);
		 Map<String,Object> map =  oservice.findMyCart("java3");
		 System.out.println("map : "+map);*/
		 //System.out.println("test1 : "+oservice.findMyCart("java3").get("cart"));
	
		// Map<String,Object> map;
=======
>>>>>>> branch 'master' of https://github.com/ho7371/MrFit.git
		//  System.out.println(pservice.findProductColorBypno("1"));
<<<<<<< HEAD
		 System.out.println(pservice.findProductDetailByColorAjax("1"));	

=======
		// System.out.println(pservice.findProductDetailByColorAjax("1"));
		 
		 System.out.println(oservice.findMyCart("java3"));
>>>>>>> branch 'master' of https://github.com/ho7371/MrFit.git
	 }
	 

}
