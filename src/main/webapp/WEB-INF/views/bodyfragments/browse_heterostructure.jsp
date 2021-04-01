<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsf/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<c:url value="/resources/css/design-edit-styles.css"/>">
</head>
<body>
<header class="section-header">
    <p><spring:message code="browse.title"/></p>
</header>
<section style="overflow: hidden;">
    <div style="width: 1000%;">
        <div class="main-frame">
            <div class="main-buttons">
                <div id="search-form">
                    <input class="name" type="text" name="sampleName" placeholder="<spring:message code="browse.search"/>"
                           autocomplete="off">
                    <input class="main-button1" id="closeFilter" type="submit" name="search" value="x">
                </div>
                <div id="new-heterostructure">
                    <form action="createNewHeterostructure">
                        <input class="main-button1" type="submit" name="create" value="<spring:message code="browse.create"/>">
                    </form>
                </div>
                <div class="end-div"></div>
            </div>

            <table class="tableHead" border="0" align="center">
                <tbody>
                <tr align="center">
                    <th style="width:10em"><spring:message code="browse.data"/></th>
                    <th style="width:10em"><spring:message code="browse.heterostructure"/></th>
                    <th style="width:30em"><spring:message code="browse.description"/></th>
                </tr>
                </tbody>
            </table>

            <div class="main-window-table">
                <form>
                    <table id="tableOfHeterostructures" border="0" align="center">
                        <tbody>

                        <c:forEach items="${listOfAllHeterostructures}" var="heterostructure">
                            <tr>
                                <td align="center" style="width:10em"><input readonly type="date"
                                                                             value="${heterostructure[0]}"/></td>
                                <td align="center" style="width:10em">${heterostructure[1]}</td>
                                <td align="center" style="width:30em">${heterostructure[2]}</td>
                                <td id="buttonsCells" align="center">
                                    <div style="display: block; margin: 0 auto; /*width: 8em;*/">
                                        <button type="submit" id="openButton"
                                                formaction="viewHeterostructure/${heterostructure[1]}.svg"><spring:message code="browse.open"/>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</section>
</body>
<script src="<c:url value="/resources/js/scrollListOfHeterostructures.js"/>"></script>
</html>

