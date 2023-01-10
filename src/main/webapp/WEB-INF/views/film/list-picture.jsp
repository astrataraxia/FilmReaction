<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div
    class="wrapper_board">
    <!-- 게시판 헤드 -->
    <div class="board_head">
        <h3>Film Reaction 게시판</h3>
        <div class="board_tag">
            <button class="tablinks" onclick="location.href='board'">
                <i class="fa-solid fa-bars fa-2x"></i>
            </button>
            <button class="tablinks" onclick="location.href='list-picture'">
                <i class="fa-solid fa-image fa-2x"></i>
            </button>
        </div>
    </div>

    <div class="board_line"></div>

    <!-- 게시판 바디-->
    <div class="board_body">
    
        <div class="picture_wrap">
            <c:forEach items="${board}" var="film">
                <div class="picture">
                    <div class="picture_box" onclick="location.href='/film/board/${film.bno}'">
                        <img src="https://yts.mx/assets/images/movies/the_bohemian_life_1992/large-cover.jpg" alt=""/>
                    </div>
                    <div class="board_textBox">
                    	<a class="move" href='/film/board/<c:out value="${film.bno}"/>'>
	                        <p class="board__name">제목 : <c:out value="${film.title}"/></p>
	                        <p class="board__writer">작성자 : <c:out value="${film.writer}"/></p>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>


        <!-- page -->
        <div class="board_page">
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="paginate_button_picture previous">
                        <a href="${pageMaker.startPage-1 }">Previous</a>
                    </li>
                </c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="paginate_button_picture ${pageMaker.criteria.pageNum==num ? 'active_list' :'' }">
                        <a href="${num}">${num}</a>
                    </li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                    <li class="paginate_button_picture next">
                        <a href="${pageMaker.endPage+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>


        <div class="board_bottom">
            <button class="write_btn" onclick="location.href='/film/register'">
                글쓰기
            </button>
        </div>


        <!-- 검색 박스 -->
        <form name="searchForm" method="get" action="?" class="wrapper_search">
            <select name="search_" class="search">
                <option>제목</option>
                <option>제목 + 본문</option>
                <option>작성자</option>
            </select>
            <input type="text" name="search_box" class="search_box"/>
            <button type="submit" class="search_btn">검색</button>
        </form>

            
        <form id="actionForm_picture" action="/film/list-picture" method="get">
            <input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}"/>
            <input type="hidden" name="amount" value="${pageMaker.criteria.amount}"/>
            <input type="hidden" name="type" value='<c:out value="${pageMaker.criteria.type}"/>'/>
            <input type="hidden" name="keyword" value='<c:out value="${pageMaker.criteria.keyword}"/>'/>
        </form>

    </div>
</div>

<%@include file="../includes/footer.jsp" %>
