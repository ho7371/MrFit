package org.kosta.MrFit.controller;

import javax.annotation.Resource;

import org.kosta.MrFit.model.MemberService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	@Secured("")
	@RequestMapping("login_fail.do")
	public String loginFail() {
		return "member/login_fail";
	}
}
