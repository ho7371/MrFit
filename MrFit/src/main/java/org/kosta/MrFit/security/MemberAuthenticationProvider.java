package org.kosta.MrFit.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.MrFit.model.Authority;
import org.kosta.MrFit.model.MemberService;
import org.kosta.MrFit.model.MemberVO;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class MemberAuthenticationProvider implements AuthenticationProvider{
	@Resource
	private MemberService memberService;
	
	@Resource
    private BCryptPasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		if(!supports(authentication.getClass())){
			return null;
		}
		//2.사용자 정보 디비로 부터 조회
		String id = authentication.getName();
		System.out.println(id);
		MemberVO member = memberService.findMemberById(id);
		System.out.println(member);
		if(member == null){
			throw new UsernameNotFoundException("회원 아이디가 존재하지 않습니다");
		}
		String password=(String)authentication.getCredentials();//사용자가 입력한 패스워드 반환 
		//3.패스워드 비교
		/* 비밀번호 암호화를 이용할 경우 
		 이용자가 로그인 폼에서 입력한 비밀번호와 DB로부터 가져온 암호화된 비밀번호를 비교한다 */
        if (!passwordEncoder.matches(password, member.getPassword())) 
                throw new BadCredentialsException("비밀번호 불일치~~~");
		//4.사용자 권한 조회
		List<Authority> list = memberService.selectAuthorityById(id);
		if(list.size() == 0){
			throw new UsernameNotFoundException("아무 권한이 없습니다.");
		}
		
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		for(Authority au : list){
			authorities.add(new SimpleGrantedAuthority(au.getAuth()));
		}
		/****************************************
		 * 여기까지 왔으면 인증 완료 - Authentication객체 생성해서 리턴
		 ***************************************/
		
		Authentication auth = new UsernamePasswordAuthenticationToken(member, password, authorities);
		System.out.println("로그인 OK~"+auth);
		return auth;		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
}
