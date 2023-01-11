<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="wrapper_main">
    <div class="itemWrap">
    	<c:forEach items="${movies}" var="movie">
	        <div class="item">
	            <div class="imgBox">
	                <img src="${movie.coverImage}" alt="movie"/>
	            </div>
	            <div class="textBox">
	                <p class="textBox__name">타이틀 : ${movie.titleLong}</p>
	                <p class="textBox__rank">평점 : ${movie.rating}</p>
	            </div>
	        </div>
     	</c:forEach>
    </div>
</div>

<%@include file="../includes/footer.jsp" %>
