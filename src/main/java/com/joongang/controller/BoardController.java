package com.joongang.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joongang.domain.BoardVO;
import com.joongang.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/film/")
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService boardService;
	
	@GetMapping("/main")
	public void main() {
		log.info("main page.....");
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		log.info("register page.....");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes redirect) {
		log.info("register : " + board.getBno());
		boardService.insert(board);
		redirect.addFlashAttribute("result", board.getBno());

		return "redirect:/film/board";
	}
	

	@GetMapping("/board")
	public void board() {
		log.info("board page.....");
		boardService.getList();
	}
	
	@GetMapping("/list-picture")
	public void picture() {
		log.info("list-picutre page.....");
	}
	
	@GetMapping("/board/{bno}")
	public String read(@PathVariable Long bno) {
		log.info("read page......");
		return "film/read";
	}
	
	@GetMapping("/board/modify")
	public String modify() {
		log.info("modify page......");
		return "film/modify";
	}

}
