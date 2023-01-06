package com.joongang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.joongang.domain.BoardVO;
import com.joongang.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;



@Service
@Log4j
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList() {
		log.info("service - getList");
		return mapper.getList();
	}

	@Override
	public void insert(BoardVO board) {
		log.info("service - insert" + board);
		mapper.insert(board);
	}

	@Override
	public boolean update(BoardVO board) {
		log.info("service - update : "+board);
		int result = mapper.update(board);
		
		return result ==1;
	}

	@Override
	public boolean delete(Long bno) {
		log.info("service - remove : "+bno);
		int result = mapper.delete(bno);
		
		return result==1;
	}


}
