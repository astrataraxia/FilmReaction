package com.joongang.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

/**
 * 페이징 12 - 1p
 * 검색 type, Keyword
 */
@Data
public class Criteria {
	private int pageNum;
	private int amount;
	private int offset;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1, 12);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public void calOffset() {
		if(pageNum<0) pageNum = 1;
		offset = (pageNum - 1)*12;
	}
	
	public String[]	getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
}
