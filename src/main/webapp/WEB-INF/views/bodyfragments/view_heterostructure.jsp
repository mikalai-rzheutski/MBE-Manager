<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Browse heterostructure</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/view-heterostructures-style.css"/>">
    <script type="text/javascript">
        function checkAddress(checkbox)
        {
            if (!checkbox.checked)
            {
                return '-' + checkbox.value;
            }
            return checkbox.value;
        }
    </script>
</head>
<body>
<header class="section-header">
    <p><spring:message code="view.heterostructure"/>:   ${jspBeanHeterostructure.sampleNumber} - ${jspBeanHeterostructure.description}</p>
</header>
<div class="sect">
    <div class="sect1">
        <div class="main-frame">
            <div <%--style="overflow: hidden;"--%>>
                <div class="main-buttons">
                    <div id="search-form">
                        <form>
                            <button class="main-button1" type="submit" name="sampleName"
                                    value="${jspBeanHeterostructure.sampleNumber}${showConditionsChar}" formaction="openPrevious">&#60;
                            </button>
                        </form>
                        <form id="data" action="openCurrent"><input class="heterostructure-name" type="text"
                                                                    name="sampleName"
                                                                    value="${jspBeanHeterostructure.sampleNumber}">
                        </form>
                        <form>
                            <button class="main-button1" type="submit" name="sampleName"
                                    value="${jspBeanHeterostructure.sampleNumber}${showConditionsChar}" formaction="openNext">&#62;
                            </button>
                        </form>
                        <form>
                            <button class="main-button1" type="submit" name="sampleName"
                                    value="${jspBeanHeterostructure.sampleNumber}" formaction="editHeterostructure">
                                <spring:message code="view.edit"/>
                            </button>
                        </form>
                    </div>
                    <div>
                        <form>
                            <button class="main-button1" type="submit" name="sampleName"
                                    value="${jspBeanHeterostructure.sampleNumber}" formaction="exportToMSWord">
                                <spring:message code="view.export"/>
                                <img src="<c:url value="/resources/img/MSWord.svg"/>" alt="MS Word"
                                     style="vertical-align: middle" height="18px">
                            </button>
                        </form>
                    </div>
                    <div id="new-heterostructure">
                        <form>
                            <button class="main-button1" type="submit" name="sampleName"
                                    value="${jspBeanHeterostructure.sampleNumber}"
                                    formaction="createNewHeterostructure"><spring:message code="view.create"/>
                            </button>
                        </form>
                    </div>
                    <div class="end-div"></div>
                </div>
            </div>
            <div class="main-window">
                <div class="svg-structure">
                    <div class="options-on-top">
                        <select id="type-selector" onChange="window.location.href=this.value">
                            <option value="${jspBeanHeterostructure.sampleNumber}${showConditionsChar}.svg"
                                <c:if test="${image_type == 'svg'}">
                                    <c:out value="selected"/></c:if>
                            ><spring:message code="view.format.svg"/>
                            </option>
                            <option value="${jspBeanHeterostructure.sampleNumber}${showConditionsChar}.png"
                                <c:if test="${image_type == 'png'}">
                                    <c:out value="selected"/></c:if>
                            ><spring:message code="view.format.png"/>
                            </option>
                        </select>
                        <div class="show-conditions">
                            <input type="checkbox" name="showConditions" onChange="window.location.href = checkAddress(this)"
                                <c:if test="${showConditionsChar == '-'}">
                                    <c:out value="unchecked"/></c:if>
                                <c:if test="${showConditionsChar ne '-'}">
                                    <c:out value="checked"/></c:if>
                                   value="${jspBeanHeterostructure.sampleNumber}.${image_type}"
                                   style="margin-right: 0.5em;"><spring:message code="view.showconditions"/>
                        </div>
                </div>
                    <img src="get_image/${jspBeanHeterostructure.sampleNumber}${showConditionsChar}.${image_type}" width="500px"
                         height="707px" style="overflow: hidden;">
                </div>
                <div class="text-info">
                    <p class="head-info">${jspBeanHeterostructure.sampleNumber}</p>
                    <p align="center">${jspBeanHeterostructure.description}</p>
                    <br>
                    <p><b><spring:message code="view.date"/>: </b> ${jspBeanHeterostructure.date}<br>
                        <b><spring:message code="view.growers"/>: </b>${jspBeanHeterostructure.growers}<br>
                        <b><spring:message code="view.substrate"/>: </b>${jspBeanHeterostructure.substrate}, ${jspBeanHeterostructure.waferSize}<br>
                        <b><spring:message code="view.wafernumber"/>: </b>${jspBeanHeterostructure.waferNumber}<br><br>
                    </p>
                    <p class="comments">${jspBeanHeterostructure.comments}</p>
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>
