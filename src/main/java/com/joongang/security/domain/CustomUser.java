package com.joongang.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.joongang.domain.MemberVO;

public class CustomUser extends User{
	
	private static final long serialVersionUIDD = 1L;
	private MemberVO member;
	
	
	public CustomUser(String userId, String userPw, 
			Collection<? extends GrantedAuthority> authorities) {
		super(userId, userPw, authorities);
	}
	
	/* UserDetailService의 리턴 타입에 맞춰주기위한 커스텀 User*/
	public CustomUser(MemberVO vo) {
		super(vo.getUserId(), vo.getUserPw(), vo.getAuthList().stream()
				.map(auth-> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.member = vo;
	}
	
}
