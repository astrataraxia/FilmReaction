<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

  
    <div class="wrapper_board">
        
        <!-- 게시판 헤드 -->
        <div class="board_head">
            <h3>Film Reaction 게시판</h3>  
            <div class="board_tag">
	        	<button class="tablinks" onclick="location.href='board'"><i class="fa-solid fa-bars fa-2x"></i></button>
	        	<button class="tablinks" onclick="location.href='list-picture'"><i class="fa-solid fa-image fa-2x"></i></button>
        	</div>
        </div>
        
        <div class="board_line"></div>	
        
        <!-- 게시판 바디-->
        <div class="board_body">
     		<div class="picture_wrap">
               <div class="picture">
                 <div class="picture_box" onclick="location.href='/film/board/id'">
                   <img src="https://yts.mx/assets/images/movies/the_bohemian_life_1992/large-cover.jpg" alt="탁상용 조명">
                 </div>
                 <div class="board_textBox">
                   <p class="board__name">탁상용 조명</p>
                   <p class="board__price">260,000 원</p>
                 </div>
               </div>
               <div class="picture">
                 <div class="picture_box">
                   <img src="https://yts.mx/assets/images/movies/the_bohemian_life_1992/large-cover.jpg" alt="탁상용 조명">
                 </div>
                 <div class="board_textBox">
                   <p class="board__name">탁상용 조명</p>
                   <p class="board__price">260,000 원</p>
                 </div>
               </div>
               <div class="picture">
                 <div class="picture_box">
                   <img src="https://yts.mx/assets/images/movies/the_bohemian_life_1992/large-cover.jpg" alt="탁상용 조명">
                 </div>
                 <div class="board_textBox">
                   <p class="board__name">탁상용 조명</p>
                   <p class="board__price">260,000 원</p>
                 </div>
               </div>
               <div class="picture">
                 <div class="picture_box">
                   <img src="https://yts.mx/assets/images/movies/the_bohemian_life_1992/large-cover.jpg" alt="탁상용 조명">
                 </div>
                 <div class="board_textBox">
                   <p class="board__name">탁상용 조명</p>
                   <p class="board__price">260,000 원</p>
                 </div>
               </div>
             </div>
            
            <div class="board_bottom">
                <button class="write_btn" onclick="location.href='/film/register'">글쓰기</button>
            </div>

            <!-- 검색 박스 -->
            <form name="searchForm" method="get" action="?" class="wrapper_search" >
                <select name="search_" class="search">    	
                    <option>제목</option>
                    <option>제목 + 본문</option>
                    <option>작성자</option>
                </select>
                <input type="text" name="search_box" class="search_box" />
                <button type="submit" class="search_btn"> 검색</button>
            </form>
        </div>  
        
    </div>

<%@include file="../includes/footer.jsp" %>