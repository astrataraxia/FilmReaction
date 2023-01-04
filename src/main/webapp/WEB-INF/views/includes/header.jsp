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
    <link rel="stylesheet" href="/resources/css/signup.css">
    <link rel="stylesheet" href="/resources/css/board.css">
    <link rel="stylesheet" href="/resources/css/listPicture.css">
    <link rel="stylesheet" href="/resources/css/read.css">

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
                    <a href="/film/board"><span class="menu-item">목록</span></a>
                    <a href="/film/login"><span class="menu-item">로그인</span></a>
                    <a href="/film/signup"><span class="menu-item">회원가입</span></a>
                  </nav>
            </div>
