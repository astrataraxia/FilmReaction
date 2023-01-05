package com.joongang.service;

import java.util.List;

import com.joongang.domain.BoardVO;

public interface BoardService {

	public List<BoardVO> getList();
	
	public void insert(BoardVO board);
	
	public boolean update(BoardVO board);
	
	public boolean delete(Long bno);
}
