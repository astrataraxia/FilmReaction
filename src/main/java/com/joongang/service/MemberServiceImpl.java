package com.joongang.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joongang.domain.AuthVO;
import com.joongang.domain.Authority;
import com.joongang.domain.MemberVO;
import com.joongang.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper mapper;
	private final PasswordEncoder pwencoder;	
	
	
	@Transactional
	@Override
	public void memberJoin(MemberVO membervo) {
		log.info("service - insert" + membervo);
		membervo.setUserPw(pwencoder.encode(membervo.getUserPw()));
		mapper.signup(membervo);
		mapper.insertAuth(makeAuth(membervo));
	}
	
	
	private AuthVO makeAuth (MemberVO member) {
		Authority authority = Authority.ROLE_USER;
		String role = String.valueOf(authority);
		
		AuthVO auth = new AuthVO();	
		auth.setUserId(member.getUserId());
		auth.setAuth(role);
		return auth;
	}

	
	

}
