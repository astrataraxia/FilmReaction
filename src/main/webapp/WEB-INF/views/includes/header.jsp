<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/headfoot.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/register.css">
    <link rel="stylesheet" href="/resources/css/login.css">
    <link rel="stylesheet" href="/resources/css/logout.css">
    <link rel="stylesheet" href="/resources/css/signup.css">
    <link rel="stylesheet" href="/resources/css/board.css">
    <link rel="stylesheet" href="/resources/css/listPicture.css">
    <link rel="stylesheet" href="/resources/css/read.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" type="text/css" rel="stylesheet">
    <script src="/resources/jquery/jquery.min.js"></script>

    <script src="/resources/js/singup.js"></script>
    <title>Film Reaction</title>
</head>
<body>
    <div class="container">
        <div class="wrapper">

            <div class="wrapper_head">       
                <div class="wrapper_title">
                    <a href="/film/main">
                    <span>Film Reaction</span>
                    </a>
                </div>
                
                <nav class="wrapper_menu">
                    <a href="/film/register"><span class="menu-item">글쓰기</span></a>
                    <a href="/film/board"><span class="menu-item">게시판</span></a>
                    <sec:authorize access="isAuthenticated()">
                   	<a href="/film/logout">로그아웃</a>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                    <a href="/film/login"">로그인</a>
                    </sec:authorize>       
                    <a href="/film/signup"><span class="menu-item">회원가입</span></a>
                  </nav>
            </div>
