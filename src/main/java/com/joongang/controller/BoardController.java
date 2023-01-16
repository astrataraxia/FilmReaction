package com.joongang.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joongang.domain.BoardVO;
import com.joongang.domain.Criteria;
import com.joongang.domain.Movie;
import com.joongang.domain.PageDTO;
import com.joongang.service.BoardService;
import com.joongang.service.MovieApiService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/film/")
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService boardService;
	private final MovieApiService movie;
	
    @GetMapping("/main")
    public String main(Model model) {
        log.info("main page.....");
        List<Movie> movies = movie.getMovies();
        model.addAttribute("movies", movies);
        return "film/main";
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
	public void board(Criteria criteria, Model model) {
		log.info("board page.....");
		model.addAttribute("board", boardService.getList(criteria));

		PageDTO pagemake = new PageDTO(boardService.getTotalCount(criteria), criteria);
		
		model.addAttribute("pageMaker", pagemake);
	}
	
	@GetMapping("/list-picture")
	public void picture(Criteria criteria, Model model) {
		log.info("list-picutre page.....");
		model.addAttribute("board", boardService.getList(criteria));

		PageDTO pagemake = new PageDTO(boardService.getTotalCount(criteria), criteria);
		
		model.addAttribute("pageMaker", pagemake);
	}
	
	@GetMapping({"/read", "/modify"})
	public void read(@RequestParam Long bno, 
			@ModelAttribute Criteria criteria, Model model) {
		log.info("read page......");
		model.addAttribute("board",boardService.get(bno));
	}
	
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria criteria ,RedirectAttributes rttr) {
		log.info("modify......."+board);
		
		if(boardService.update(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/film/board" +criteria.getListLink();
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria criteria, RedirectAttributes rttr,
			@RequestParam("writer") String writer) {
		log.info("remove" + bno);
		
		if(boardService.delete(bno)) {
			rttr.addFlashAttribute("result", "success");
	}
		
		return "redirect:/film/board" + criteria.getListLink();
	}
}
