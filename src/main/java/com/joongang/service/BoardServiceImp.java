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
public class BoardServiceImp implements BoardService {

	private final BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList() {
		log.info("service - getList......");
		return mapper.getList();
	}

	@Override
	public void insert(BoardVO board) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean update(BoardVO board) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Long bno) {
		// TODO Auto-generated method stub
		return false;
	}

}
