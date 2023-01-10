<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@include file="../includes/header.jsp"%>

<div class="wrapped_logout">
    <form action="/film/logout" class="logout_form" method="post">
        <div class="form_logout_button">
            <button class="logout_button" type="submit">로그아웃</button>
        </div>
        <!-- post security -->
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</div>

<%@include file="../includes/footer.jsp" %>
