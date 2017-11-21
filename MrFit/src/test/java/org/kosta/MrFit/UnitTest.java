package org.kosta.MrFit;

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
	 }
	 

}
