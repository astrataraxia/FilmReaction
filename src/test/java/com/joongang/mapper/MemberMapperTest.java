package com.joongang.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.joongang.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTest {

	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Autowired
	private DataSource ds;
	
	
	@Test
	public void insertMember() {
		MemberVO vo = new MemberVO();
		vo.setUserId("kim@naver.com");
		vo.setUserPw("abcd");
		vo.setUserName("김승용");
		vo.setLocation("대구");
		vo.setGender("남자");
		log.info(vo);
		memberMapper.signup(vo);
		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		try {
//			con = ds.getConnection();
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(2, pwencoder.encode("pw"+i));
//			if(i<8) {
//				pstmt.setString(1, "user"+i);
//				pstmt.setString(3, "일반유저"+i);
//			} else if (i<9) {
//				pstmt.setString(1, "manager"+i);
//				pstmt.setString(3, "매니저"+i);
//			} else {
//				pstmt.setString(1, "admin"+i);
//				pstmt.setString(3, "관리자"+i);
//			}
//			pstmt.executeUpdate();
//		} catch(Exception e) {
//			e.printStackTrace();
//		} finally {
//			if(pstmt != null) {try {pstmt.close(); } catch(Exception e) {} }
//			if(con != null) {try {con.close(); } catch(Exception e) {} }
//		}
	}
	
//	@Test
//	public void readMember() {
//		memberMapper.read("kim@naver.com");
//	}
}
