package com.joongang.mapper;

import java.util.List;

import com.joongang.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public int insert(BoardVO board);
	
	public int update(BoardVO board);
	
	public int delete(Long bno);
}
