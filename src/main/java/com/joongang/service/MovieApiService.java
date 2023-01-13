package com.joongang.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.joongang.domain.Movie;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MovieApiService {

	 private final Gson gson = new Gson();
	 private final String API_URL = "https://yts.mx/api/v2/list_movies.json";
	
	 public List<Movie> getMovies() {
		 	try {
		        JsonArray moviesJson = gson.fromJson(
		                new InputStreamReader(
		                		new URL(API_URL).openStream()), JsonObject.class)
		                .get("data").getAsJsonObject()
		                .get("movies").getAsJsonArray();
		        
		
		         List<Movie> movies = StreamSupport.stream(moviesJson.spliterator(), false)
						                .map(movieJson -> movieJson.getAsJsonObject())
						                .map(movieJson -> new Movie(
						                        movieJson.get("title_long").getAsString(),
						                        movieJson.get("rating").getAsDouble(),
						                        movieJson.get("large_cover_image").getAsString())
						                	)
						                .limit(12)
						                .collect(Collectors.toList());
		         
		         return movies;
		 	} catch (IOException e) {
		 		log.error("error occurered fetching the movies",e);
		 		throw new RuntimeException();
		 	}
	 }
}
