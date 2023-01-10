package com.joongang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joongang.domain.MemberVO;
import com.joongang.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/film/")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService member;
	
	
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
	public void login(String error, String logout, Model model) {
		log.info("login page");	
		log.info("error: " +error);
		log.info("logout: "+logout);
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
	
	@GetMapping("/logout")
	public void logoutGET() {
		log.info("logout page");
	}
	
	@PostMapping("/logout")
	public String logoutPost() {
		log.info("post logout");
		return "redirect:/film/login";
	}
}

