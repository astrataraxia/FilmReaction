<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@include file="../includes/header.jsp"%>

       <div class="wrapped_login">
	       <form action="/login" class="loin_form" method="post">
	            <div class="form_id">
	           		<label for="username">E-mail</label>
	                <input type="email" class="id_control" id="login_id" name="username" placeholder="E-mail을 입력하세요">
	            </div>
	            <div class="form_pw">
	            	<label for="password">비밀번호</label>
	                <input type="password" class="pw_control" id="login_pw" name="password" placeholder="비밀번호를 입력하세요">
	            </div>
	            <div class="form_checkbox">
	                <input type="checkbox" name="remember-me" id="checkbox_rm"><label>자동 로그인</label>
	            </div>
	            <div class="form_login_button">
	                <button class="login_button" value="Login" type="submit">로그인</button>
	            </div>
	            <!-- post security -->
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	        </form>
    	</div>
    	
    	
    	
    	
    	<script>
    	$(".login_button").on("click", 
    		function(e) {
    			e.preventDefault();
    			$("form").submit();
    	});
    	</script>
    	
    	<!-- logout시 간단한 메시지 script  -->
    	<c:if test="${param.logout != null }">
		<script>
			$(function() {
				alert("로그아웃하였습니다");
			});
		</script>
		</c:if>
		<!-- login fail => message -->
		<c:if test="${param.error != null}">
	      <script>
	        alert("로그인에 실패하였습니다. 아이디와 비밀번호를 확인해주세요.");
	      </script>
		 </c:if>
			


<%@include file="../includes/footer.jsp" %>