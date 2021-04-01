<!DOCTYPE html>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<html lang="ru" encoding="UTF-8">
<head>
    <meta charset=utf-8>
    <tiles:importAttribute name="title" />
    <title><spring:message code="${title}"/></title>
    <link rel="shortcut icon" href="<c:url value="/resources/img/favicon.png"/>" type="image/png">
    <link rel="stylesheet" href="<c:url value="/resources/css/styles.css"/>">
</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="<c:url value="/resources/js/locale.js"/>"></script>
<div class="inner-body">
    <tiles:insertAttribute name="header"/>
    <div id="main-section">
        <tiles:insertAttribute name="menu"/>
        <section id="content">
            <tiles:insertAttribute name="body"/>
        </section>
    </div>
    <tiles:insertAttribute name="footer"/>
</div>
</body>
</html>