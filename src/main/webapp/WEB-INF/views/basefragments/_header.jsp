<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<header class="main-header">
    <div class="mbe-header">
        <h1><i>MBE Manager (demo)</i></h1>
        <div>
            <select id="locales">
                <option value="ru"
                        <c:if test="${pageContext.response.locale == 'ru'}">
                            <c:out value="selected"/></c:if>
                >Ru</option>
                <option value="en" value="selected"
                        <c:if test="${pageContext.response.locale == 'en'}">
                            <c:out value="selected"/></c:if>
                >En</option>
            </select>
        </div>
        <div class="header-picture-and-current-user">
            <div style="padding-right: 20px;" class="current-user">
               <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.username" var="username"/>
                    <i>${username}</i>
                    <form action="<c:url value="/logout"/>">
                        <input type="submit" value=<spring:message code="logout" text="exit"/>></button>
                    </form>

                </sec:authorize>
            </div>
            <%--<h2><spring:message code="logout" text="проверка"/></h2>--%>
            <img style="border: 2px solid #aaaaaa;" src="<c:url value="/resources/img/images.jpg"/>" height=96px
                 align=right>
        </div>
    </div>
</header>