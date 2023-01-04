<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

       <div class="wrapped_login">
	       <form action="" class="loin_form">
	            <div class="form_id">
	           		<label for="username">E-mail</label>
	                <input type="text" class="id_control" id="login_id" name="username" placeholder="E-mail을 입력하세요">
	            </div>
	            <div class="form_pw">
	            	<label for="password">비밀번호</label>
	                <input type="password" class="pw_control" id="login_pw" name="password" placeholder="비밀번호를 입력하세요">
	                
	            </div>
	            <div class="form_checkbox">
	                <input type="checkbox" name="" id="checkbox_rm"><label>자동 로그인</label>
	            </div>
	            <div class="form_login_button">
	                <button class="login_button" type="submit">로그인</button>
	            </div>
	        </form>
    	</div>


<%@include file="../includes/footer.jsp" %>