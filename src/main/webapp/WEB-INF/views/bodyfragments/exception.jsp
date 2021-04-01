<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<html>
<head>
</head>
<body>
<header class="section-header">
</header>
<p style="color:red; font-weight:bold; font-size: larger" align="center">${message}</p>
<br> <br> <br>
<p align="center">
    <button class="main-button1" onclick="goBack()"><spring:message code="exception.goBack"/></button>
</p>
<script>
    function goBack() {
        window.history.back();
    }
</script>

</body>
</html>
