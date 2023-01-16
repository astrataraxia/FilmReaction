<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div
    class="wrapper_register">
    <!-- head-->
    <div class="register_head">
        <h3>영화 리뷰 작성 게시판 입니다</h3>
    </div>
    <div class="register_line"></div>

    <div class="register_body">
        <form class="register_form" method="post" action="/film/register">
            <!-- 보안토큰  -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="register_title">
                <input class="title_area" maxlength="50" placeholder="제목" name="title" required="required"/>
                <input class="title_area" maxlength="50" readonly="readonly" name="writer" 
                value='<sec:authentication property="principal.username"/>'/>
            </div>
            <!--별점-->
            <fieldset class="score">
                <input type="radio" name="reviewStar" value="5" id="rate1"/><label for="rate1">★</label>
                <input type="radio" name="reviewStar" value="4" id="rate2"/><label for="rate2">★</label>
                <input type="radio" name="reviewStar" value="3" id="rate3"/><label for="rate3">★</label>
                <input type="radio" name="reviewStar" value="2" id="rate4"/><label for="rate4">★</label>
                <input type="radio" name="reviewStar" value="1" id="rate5"/><label for="rate5">★</label>
                <span class="text-bold">평점</span>
            </fieldset>

            <div class="register_written">
                <textarea type="text" class="written_area" placeholder="내용" name="content" required="required"></textarea>
            </div>
            <!--제출 버튼-->
            <div class="register_submit">
                <button class="register_submit_button" type="submit">작성</button>
                <button class="register_submit_button" type="reset">취소</button>
            </div>
        </form>
    </div>
</div>

<%@include file="../includes/footer.jsp" %>
