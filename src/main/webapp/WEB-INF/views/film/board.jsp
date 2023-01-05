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

            <!-- 게시판 테이블-->
            <table class="board_table">
                <thead>
                    <tr class="table_title">
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                </thead>
            <tbody class="board_content">
                    
                <tr class="tr_list">

                    <!--글 번호-->
                    <td>bno</td>
                    <!-- 글 제목 -->
                    <td>
                    <a class="content_title" href="#">title
                        <span class="comment_cnt">[15]</span>
                    </a>
                    </td>
                    <!-- 작성자-->
                    <td>
                    userId
                    </td>
                    <!-- 글 작성 시간 -->
                    <td>2022-01-01</td>
            </tbody>
            </table>	
            
            <!-- 글쓰기 박스 -->
            <div class="board_bottom">
                <button class="write_btn" onclick="location.href='/film/register'">글쓰기</button>
            </div>

            <!-- 검색 박스 -->
            <form name="searchForm" method="get" action="?" class="wrapper_search" >
                <select name="type" class="search">    	
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