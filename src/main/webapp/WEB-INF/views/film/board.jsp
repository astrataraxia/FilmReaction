<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
    <div
        class="board_body">
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
                <c:forEach items="${board}" var="board">
                    <tr class="tr_list">
                        <!--글 번호-->
                        <td><c:out value="${board.bno}"/></td>
                        <!-- 글 제목 -->
                        <td>
                            <a class="move" href='<c:out value="${board.bno}"/>'>
                                <c:out value="${board.title}"/>
                                <b>[<c:out value="${board.replyCnt}"/>]</b>
                            </a>
                        </td>
                        <!-- 작성자-->
                        <td>
                            <c:out value="${board.writer}"/>
                        </td>
                        <!-- 글 작성 시간 -->
                        <td>
                            <c:choose>
                                <c:when test="${board.regdate } == ${board.updateDate }">
                                    <fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.regdate}"/>
                                </c:when>
                                <c:otherwise>
                                    <fmt:formatDate pattern="YY-MM-dd hh:mm" value="${board.updateDate}"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- page -->
        <div class="board_page">
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="paginate_button previous">
                        <a href="${pageMaker.startPage-1 }">Prev</a>
                    </li>
                </c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="paginate_button ${pageMaker.criteria.pageNum==num ? 'active_list' :'' }">
                        <a href="${num}">${num}</a>
                    </li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                    <li class="paginate_button next">
                        <a href="${pageMaker.endPage+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>

        <!-- 글쓰기 박스 -->
        <div class="board_bottom">
            <button class="write_btn" onclick="location.href='/film/register'">
                글쓰기
            </button>
        </div>

        <!-- 검색 박스 -->
        <form id="searchForm" method="get" action="/film/board" class="wrapper_search">
            <select name="type" class="search">
                <option value="T" <c:out value="${pageMaker.criteria.type eq 'T'?'selected':''}"/>>제목</option>
                <option value="TC" <c:out value="${pageMaker.criteria.type eq 'TC'?'selected':''}"/>>제목 + 본문</option>
                <option value="W" <c:out value="${pageMaker.criteria.type eq 'W'?'selected':''}"/>>작성자</option>
            </select>
            <input type="text" name="keyword" class="search_box" value='<c:out value="${pageMaker.criteria.keyword}"/>'/>
            <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.criteria.pageNum}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${pageMaker.criteria.amount}"/>'>
            <button class="search_btn">검색</button>
        </form>
    </div>

    <form id="actionForm" action="/film/board" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum}"/>
        <input type="hidden" name="amount" value="${pageMaker.criteria.amount}"/>
        <input type="hidden" name="type" value='<c:out value="${pageMaker.criteria.type}"/>'/>
        <input type="hidden" name="keyword" value='<c:out value="${pageMaker.criteria.keyword}"/>'/>
    </form>
</div>

<script src="/resources/js/board.js" defer></script>
<%@include file="../includes/footer.jsp" %>
