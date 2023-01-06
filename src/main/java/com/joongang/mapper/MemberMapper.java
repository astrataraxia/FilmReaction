package com.joongang.mapper;

import com.joongang.domain.AuthVO;
import com.joongang.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userId);
	
	public int signup(MemberVO membervo);
	
	public int insertAuth(AuthVO auth);
}
