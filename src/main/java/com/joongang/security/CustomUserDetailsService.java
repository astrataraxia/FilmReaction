package com.joongang.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.joongang.domain.MemberVO;
import com.joongang.mapper.MemberMapper;
import com.joongang.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;

	
	@Override
	public UserDetails loadUserByUsername(String userId) 
			throws UsernameNotFoundException {
		MemberVO vo = mapper.read(userId);
		log.warn("Load User By UserName : " + userId);
		log.warn("queried by member mapper: " + vo);

		return vo == null? null: new CustomUser(vo);
	}

}
