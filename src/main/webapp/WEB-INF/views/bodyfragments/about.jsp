<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<html>
<head>
</head>
<body>
<header class="section-header">
    <p><spring:message code="about.title"/></p>
</header>
<br> <br>
<p class=aboutText align="justify">
    The <b>MBE Manager</b> is used as a tool for documentation of production process of multilayers semiconductor heterostructures using the <i>Molecular Beam Epitaxy (MBE)</i> technology (see the picture below). The system provides logging, storage and retrieving of all technological process details as well as automatic generation of drawings and reports.
</p>
<br>
<p class=aboutText align="justify">
    In turn, the semiconductor heterostructures nowadays are widely used as basic elements of the most nanoelectronic devices: ultra-high frequency amplifiers for mobile and space communications, lasers, light-emitting diodes, etc.
</p>
<div class=mbe-setup>
    <p><img src="<c:url value="/resources/img/mbe-setup.jpg"/>" height="300"></p>
    <figcaption>MBE setup located in a research lab.</figcaption>
</div>
<p class=aboutText>
    The <b>source code</b> for the project can be found over on <a href="https://github.com/mikalai-rzheutski/MBE-Manager">GitHub</a>
</p>
<br>
<p class=aboutText>
    <b>Tech. stack: </b> <i>Spring Boot, Spring MVC, Spring JPA, Spring Security + OAuth 2.0, JSP, Docker, etc.</i>
</p>
</body>
</html>