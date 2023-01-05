package com.joongang.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	/**
	 *게시판 요소
	 */
	private Long bno;
	private String title;
	private String content;
	private String writer;
	
	private Date regdate;
	private Date updateDate;
	
	private int replyCnt;
}
