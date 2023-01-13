package com.joongang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joongang.domain.BoardVO;
import com.joongang.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList();

	public int getTotalCount(Criteria criteria);
	
	public List<BoardVO> getListWithPaging(Criteria criteria);
	
	public BoardVO read(Long bno);
	
	public void insert(BoardVO board);
	
	public int update(BoardVO board);
	
	public int delete(Long bno);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

	
}
