package com.joongang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joongang.domain.AuthVO;
import com.joongang.domain.MemberVO;
import com.joongang.service.BoardService;
import com.joongang.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/film/")
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService board;
	private final MemberService member;
	
	@GetMapping("/main")
	public void main() {
		log.info("main page.....");
	}

	@GetMapping("/register")
	public void register() {
		log.info("register page.....");
	}
	
	@GetMapping("/signup")
	public void signup() {
		log.info("signup page.....");
	}
	
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute MemberVO memVO) {
		log.info("signup complete");
		member.memberJoin(memVO);
		return "redirect:/film/main";
	}
	
	
	
	@GetMapping("/login")
	public void login() {
		log.info("login page.....");
	}
	
	@GetMapping("/board")
	public void board() {
		log.info("board page.....");
	}
	
	@GetMapping("/list-picture")
	public void picture() {
		log.info("list-picutre page.....");
	}
	
	@GetMapping("/board/id")
	public String read() {
		log.info("read page......");
		return "film/read";
	}
	
	@GetMapping("/board/modify")
	public String modify() {
		log.info("modify page......");
		return "film/modify";
	}

}
