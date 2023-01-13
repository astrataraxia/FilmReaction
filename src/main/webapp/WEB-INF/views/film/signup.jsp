<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="wrapper_signup">
    <div class="main_body">
        <header class="wrap__title">Film Reaction 회원가입</header>
        <form action="/film/signup" method="post">
            <main class="wrap__main">
                <input class="main__input" id="email" type="email" name="userId" placeholder="이메일을 입력해주세요."/>
                <div class="error" id="error__email"></div>
                <input class="main__input" id="name" type="text" name="userName" maxlength="8" placeholder="닉네임을 입력해 주세요"/>
                <div class="error" id="error__name"></div>
                <input class="main__input" id="pw1" type="password" name="userPw" maxlength="20" placeholder="비밀번호를 입력해 주세요"/>
                <div class="error" id="error__password1"></div>
                <input class="main__input" id="pw2" type="password" maxlength="20" placeholder="비밀번호를 다시 입력해 주세요"/>
                <div class="error" id="error__password2"></div>

                <div class="wrap__phone">
                    <input class="phone__input" id="phone1" type="text" maxlength="3" oninput="changeFocus1()"/>
                    <span>-</span>
                    <input class="phone__input" id="phone2" type="text" maxlength="4" oninput="changeFocus2()"/>
                    <span>-</span>
                    <input class="phone__input" id="phone3" type="text" maxlength="4" oninput="changeFocus3()"/>
                </div>

                <div class="wrap__auth">
                    <div id="auth__target">
                        <span id="token">000000</span>
                        <button class="auth_button" id="send" type="button" disabled="disabled" onclick="getToken()">
                            인증번호 전송
                        </button>
                    </div>
                </div>
                <div class="wrap__auth">
                    <div id="auth__timer">
                        <span id="timer">3:00</span>
                        <button class="auth_button" id="finished" type="button" disabled="disabled" onclick="getTimerIntervalConfirm()">
                            인증완료
                        </button>
                    </div>
                </div>
                <select class="select__box" id="location" name="location">
                    <option disabled="disabled" selected="true">지역을 선택하세요</option>
                    <option value="서울">서울</option>
                    <option value="인천">인천</option>
                    <option value="대전">대전</option>
                    <option value="광주">광주</option>
                    <option value="대구">대구</option>
                    <option value="부산">부산</option>
                    <option value="울산">울산</option>
                    <option value="경기도">경기도</option>
                    <option value="충청도">충청도</option>
                    <option value="강원도">강원도</option>
                    <option value="전라도">전라도</option>
                    <option value="경상도">경상도</option>
                    <option value="제주도">제주도</option>
                </select>
                <div class="error" id="error__location"></div>

                <div class="wrap__radio">
                    <div>
                        <input class="radio1" type="radio" name="gender" value="woman" id="gender__woman"/>
                        <span class="gender">여성</span>
                    </div>
                    <div>
                        <input class="radio2" type="radio" name="gender" value="man" id="gender__man"/>
                        <span class="gender">남성</span>
                    </div>
                </div>
                <div class="error" id="error__gender"></div>
            </main>
            <hr/>

            <div class="wrap__confirm">
                <button class="confirm__button" id="signup__button" type="submit" disabled="disabled" onclick="signup()">
                    가입하기
                </button>
            </div>
            <!-- post security -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
</div>

<script src="/resources/js/singup.js" defer></script>
<%@include file="../includes/footer.jsp" %>
