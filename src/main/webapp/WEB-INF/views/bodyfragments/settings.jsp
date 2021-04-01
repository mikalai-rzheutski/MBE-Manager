<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Настройки</title>
</head>
<body>
<header class="section-header">
    <p><spring:message code="settings"/></p>
</header>
<br> <br> <br>
<form>
    <p align="center">
        <button class="main-button1" formaction="settings/registration/"><spring:message code="settings.registerUser"/></button>
    </p>
    <br>
    <br>
    <br>
    <p align="center">
        <button class="main-button1" formaction="<c:url value = "/noSuchPage"/>"><spring:message code="settings.colors"/></button>
    </p>
    <br>
    <br>
    <br>
    <p align="center">
        <button class="main-button1" formaction="settings/exportDump/"><spring:message code="settings.exportData"/></button>
    </p>
    <br>
</form>
<br> <br> <br>
<form class="import-json" method="POST" enctype="multipart/form-data">
    <p align="center">
    <p><input name="file" type="file" accept="application/JSON"/></p>
    <br>
    <button class="main-button1" formaction="/settings/importDump/"><spring:message code="settings.importData"/></button>
    </p>
</form>
<br>
<div class="info-message">
    <p class="info-message">
        ${message}
    </p>
</div>
</body>
</html>
