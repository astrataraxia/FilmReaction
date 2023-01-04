<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>

     <div class="wrapper_signup">
     	<div class="main_body">
            <header class="wrap__title">Film Reaction 회원가입</header>
            <main class="wrap__main">
                <input class="main__input" id="email" type="email" placeholder="이메일을 입력해주세요.">
                <div class="error" id="error__email"></div>
                <input class="main__input" id="name" type="text" placeholder="닉네임을 입력해 주세요">
                <div class="error" id="error__name"></div>
                <input class="main__input" id="pw1" type="password" placeholder="비밀번호를 입력해 주세요">
                <div class="error" id="error__password1"></div>
                <input class="main__input" id="pw2" type="password" placeholder="비밀번호를 다시 입력해 주세요">
                <div class="error" id="error__password2"></div>

                <div class="wrap__phone">
                    <input class="phone__input" id="phone1" type="text" maxlength="3" oninput="changeFocus1()">
                    <span>-</span>
                    <input class="phone__input" id="phone2" type="text"  maxlength="4" oninput="changeFocus2()">
                    <span>-</span>
                    <input class="phone__input" id="phone3" type="text"  maxlength="4" oninput="changeFocus3()">
                </div>

                <div class="wrap__auth">
                    <div id="auth__target">
                        <span id="token" >000000</span>
                        <button class="auth_button" id="send" type="button" disabled onclick="getToken()">인증번호 전송</button>
                    </div>
                </div>
                <div class="wrap__auth">
                    <div id="auth__timer">
                        <span id="timer">3:00</span>
                        <button class="auth_button" id="finished" type="button" disabled  onclick="getTimerIntervalConfirm()" >인증완료</button>
                    </div>
                </div>
                <select class="select__box" id="location">
                    <option disabled selected="true">지역을 선택하세요</option>
                    <option>서울</option>
                    <option>인천</option>
                    <option>대전</option>
                    <option>광주</option> 
                    <option>대구</option>
                    <option>부산</option> 
                    <option>울산</option> 
                    <option>경기도</option> 
                    <option>충청도</option> 
                    <option>강원도</option> 
                    <option>전라도</option> 
                    <option>경상도</option> 
                    <option>제주도</option> 
                </select>
                <div class="error" id="error__location"></div>

                <div class="wrap__radio">
                    <div>
                        <input class="radio1" type="radio" name="gender" id="gender__woman">
                        <span class="gender">여성</span>
                    </div>
                    <div>
                        <input class="radio2" type="radio" name="gender" id="gender__man">
                        <span class="gender">남성</span>
                    </div>
                </div>
                <div class="error" id="error__gender"></div>
            </main>
            <hr />

            <div class="wrap__confirm">
                <button class="confirm__button" id="signup__button" type="submit" disabled onclick="signup()" >가입하기</button>
            </div>

        </div>
     </div>


<%@include file="../includes/footer.jsp" %>