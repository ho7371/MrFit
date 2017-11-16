package org.kosta.MrFit.controller;

import javax.annotation.Resource;

import org.kosta.MrFit.model.MemberService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	
}
