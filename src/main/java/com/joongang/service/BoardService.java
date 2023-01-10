package com.joongang.service;

import java.util.List;

import com.joongang.domain.BoardVO;
import com.joongang.domain.Criteria;

public interface BoardService {

	public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria criteria);
	
	public int getTotalCount(Criteria criteria);
	
	public BoardVO get(Long bno);
	
	public void insert(BoardVO board);
	
	public boolean update(BoardVO board);
	
	public boolean delete(Long bno);
}
