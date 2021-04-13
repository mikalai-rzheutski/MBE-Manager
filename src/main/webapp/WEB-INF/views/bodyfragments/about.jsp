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
<br>
<p class="aboutText" style="color: #111166">
    <b>Tech. stack: </b> <i>Spring Boot, Spring MVC, Spring JPA, Spring Security + OAuth 2.0, JSP, Docker, etc.</i>
</p>
<p class="aboutText" style="color: #111166">
    The <b>source code</b> for the project can be found over on <a href="https://github.com/mikalai-rzheutski/MBE-Manager-docker">GitHub</a>
</p>
<br>
<p class="aboutText" align="justify">
    The <b>MBE Manager</b> is used as a tool for documentation of production process of multi-layer GaN-based heterostructures using the <i>Molecular Beam Epitaxy (MBE)</i> technology. The system provides logging, storage and retrieving of all technological process details as well as automatic generation of drawings and reports.
</p>
<div class=mbe-setup>
    <p><img src="<c:url value="/resources/img/mbe-setup.jpg"/>" height="300"></p>
    <figcaption>MBE setup located in a research Lab</figcaption>
</div>
<div class=mbe-setup>
    <p><img src="<c:url value="/resources/img/GaN-applications.jpg"/>" width="600"></p>
</div>

</body>
</html>