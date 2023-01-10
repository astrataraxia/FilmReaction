<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page
session="false" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8"/>
        <link rel="stylesheet" href="./resources/css/index.css"/>
        <title>Film Reaction - index</title>
    </head>
    <body>
        <div class="container">
            <div class="wrapper">
                <div class="wrapper_main_title">
                    <sec:authorize access="isAuthenticated()">
                        <button class="wrapper_login" onclick="location.href='film/logout'">
                            <span>Logout</span>
                        </button>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                        <button class="wrapper_login" onclick="location.href='film/login'">
                            <span>Login</span>
                        </button>
                    </sec:authorize>

                    <h1>Film Reaction</h1>
                    <p>
                        Movie reaction, review site.<br/>
                        if you want visit our site, please enter button
                    </p>
                    <button class="wrapper_enter" onclick="location.href='film/main'">
                        <span>ENTER</span>
                    </button>
                </div>
            </div>
        </div>
    </body>
</html>
