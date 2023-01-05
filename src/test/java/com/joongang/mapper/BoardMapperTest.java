package com.joongang.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.joongang.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		List<BoardVO> list =mapper.getList();
		for(int i=0; i<list.size(); i++) {
			log.info(list.get(i));
		}
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("InsertTest");
		board.setContent("InsertTest");
		board.setWriter("Writer1");
		mapper.insert(board);
		log.info(board);
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setTitle("updateTest");
		board.setContent("update date?");
		board.setWriter("Writer1-2");
		board.setBno(1L);
		mapper.update(board);
		log.info(board);
	}
	
	
	@Test
	public void testDelete() {
		int count = mapper.delete(2L);
		log.info("DELETE COUNT : " + count);
	}
	
	
}
