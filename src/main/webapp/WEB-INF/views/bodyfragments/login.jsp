<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="/resources/css/design-edit-styles.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/login-page-styles.css"/>">
</head>

<body>
<br>
<p style="color:red; font-weight:bold; font-size: larger" align="center">${message}</p>
<br>
<div class="login-container">
    <c:url value="/j_spring_security_check" var="loginUrl"/>
    <form class="password-form" action="${loginUrl}" method="post">
        <spring:message code="login.login"/>
        <input class="name" type="text" class="form-control" name="j_username" placeholder="Login" required
               autofocus value="superadmin">
        <spring:message code="login.pw"/>
        <input class="user-password" type="password" class="form-control" name="j_password" placeholder="Password"
               required value="1">
        <div>
            <spring:message code="login.remember"/>
            <input type="checkbox" name="remember-me">
        </div>
        <br>
        <input class="main-button1" type="submit" value="<spring:message code="login.signin"/>">
    </form>
    <h3 class="form-signin-heading"><spring:message code="login.or"/></h3>

    <div>
        <form action="/login/github">
        <button class="social-button-git" style="color: #ffffff" >
            <svg aria-hidden="true" class="social-button-icon" width="18" height="18" viewBox="0 0 18 18"><path d="M9 1a8 8 0 0 0-2.53 15.59c.4.07.55-.17.55-.38l-.01-1.49c-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82a7.42 7.42 0 0 1 4 0c1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48l-.01 2.2c0 .21.15.46.55.38A8.01 8.01 0 0 0 9 1z" fill="#ffff"></path></svg>    <spring:message code="login.viaGithub"/>
        </button>
        </form>
        <br>
        <form action="/login/google">
        <button class="social-button-google" >
            <svg aria-hidden="true" class="social-button-icon" width="18" height="18" viewBox="0 0 18 18"><path d="M16.51 8H8.98v3h4.3c-.18 1-.74 1.48-1.6 2.04v2.01h2.6a7.8 7.8 0 0 0 2.38-5.88c0-.57-.05-.66-.15-1.18z" fill="#4285F4"></path><path d="M8.98 17c2.16 0 3.97-.72 5.3-1.94l-2.6-2a4.8 4.8 0 0 1-7.18-2.54H1.83v2.07A8 8 0 0 0 8.98 17z" fill="#34A853"></path><path d="M4.5 10.52a4.8 4.8 0 0 1 0-3.04V5.41H1.83a8 8 0 0 0 0 7.18l2.67-2.07z" fill="#FBBC05"></path><path d="M8.98 4.18c1.17 0 2.23.4 3.06 1.2l2.3-2.3A8 8 0 0 0 1.83 5.4L4.5 7.49a4.77 4.77 0 0 1 4.48-3.3z" fill="#EA4335"></path></svg>    <spring:message code="login.viaGoogle"/>
        </button>
        </form>
    </div>

</div>

</body>
</html>
