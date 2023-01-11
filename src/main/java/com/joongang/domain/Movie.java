package com.joongang.domain;

import lombok.Getter;

@Getter
public class Movie {

	private String titleLong;
	
	private double rating;
	
	private String coverImage;

	public Movie(String titleLong, double rating, String coverImage) {
		this.titleLong = titleLong;
		this.rating = rating;
		this.coverImage = coverImage;
	}
	
	
}
