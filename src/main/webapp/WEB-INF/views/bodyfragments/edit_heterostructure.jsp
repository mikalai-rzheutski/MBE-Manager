<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<%@ page import="by.ifanbel.data.database.entities.Material" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<c:url value="/resources/css/design-edit-styles.css"/>">
</head>

<body>
<sf:form modelAttribute="jspBeanHeterostructure" action="saveHeterostructure">
    <div class=content1>
        <header class="section-header">
            <p><spring:message code="edit.title"/></p>
        </header>
        <div class=general-parameters-section>
            <div class=parameters>
                <div class=row1>
                    <p><b><spring:message code="edit.samplename"/></b>
                        <sf:input type="text" autocomplete="off" path="sampleNumber" required="true"/></p>
                    <p><b><spring:message code="edit.description"/></b>
                        <sf:input class="growers" type="text" autocomplete="off" path="description" required="true"/>
                    </p>
                    <p><b><spring:message code="edit.date"/></b>
                        <sf:input type="date" path="date" class="unstyled" name="date" required="true"/></p>
                    <p><b><spring:message code="edit.growers"/></b><sf:input class="growers" type="text" path="growers"/></p>
                </div>
                <div class=row1>
                    <p><b><spring:message code="edit.wafernumber"/></b><sf:input type="text"  autocomplete="off" path="waferNumber"/></p>
                    <p><b><spring:message code="edit.waferdiameter"/></b>
                        <sf:input path="waferSize" autocomplete="off" list="waferSizeOptions"/>
                        <datalist id="waferSizeOptions">
                            <option value="2&quot;">
                            <option value="3&quot;">
                            <option value="4&quot;">
                        </datalist>
                    </p>
                    <p><b><spring:message code="edit.substrate"/></b><sf:input path="substrate" autocomplete="off"
                                                         list="substrateTypeOptions"/>
                        <datalist id="substrateTypeOptions">
                            <option value="Al2O3(0001)">
                            <option value="Si(111)">
                            <option value="6H-SiC">
                            <option value="4H-SiC">
                        </datalist>
                    </p>
                </div>
            </div>
            <div class=commentSection>
                <p><b><spring:message code="edit.comments"/></b><br>
                    <sf:textarea class="comments" autocomplete="off" path="comments"></sf:textarea>
                </p>
            </div>
        </div>
        <div id="error">
            <c:forEach items="${jspBeanHeterostructure.errorMessages}" var="errorMessage" varStatus="loop">
                <br>
                <i>${jspBeanHeterostructure.errorMessages[loop.index]}</i>
            </c:forEach>
        </div>


        <table id="editTab" class="sortable" border="0" align="center" onclick="rowNumbering(this.id)">
            <tbody>
            <tr>
                <td class=table-caption colspan="10"><spring:message code="edit.layers"/></td>
            </tr>

            <tr align="center">
                <th><spring:message code="edit.layernumber"/></th>
                <th><spring:message code="edit.mode"/></th>
                <th><spring:message code="edit.thickness"/></th>
                <th><i><spring:message code="edit.x"/></i></th>
                <th><i><spring:message code="edit.y"/></i></th>
                <th><spring:message code="edit.temperature"/></th>
                <th><spring:message code="edit.heat"/></th>
                <th><spring:message code="edit.nitrflow"/></th>
                <th><spring:message code="edit.doping"/></th>
                <th><spring:message code="edit.comment"/></th>
            </tr>


            <c:forEach items="${jspBeanHeterostructure.layerId}" var="id" varStatus="loop">

                <tr id="layerRow">
                    <td align="center"><input id="inputAsLabel" readonly type="text" name="layerId" value="${id}"/></td>
                    <td align="center">
                        <select id="mode" name="growthMode" value="${jspBeanHeterostructure.growthMode[loop.index]}"
                                width="5em">
                            <option value=${Material.AMMONIA}
                                    <c:if test="${jspBeanHeterostructure.growthMode[loop.index] == Material.AMMONIA}">
                                        <c:out value="selected"/></c:if>
                            >NH<sub>3</sub></option>
                            <option value=${Material.N_PLASMA}
                                    <c:if test="${jspBeanHeterostructure.growthMode[loop.index] == Material.N_PLASMA}">
                                        <c:out value="selected"/></c:if>
                            >N*
                            </option>
                        </select>
                    </td>
                    <td align="center"><input type="number" name="thickness" autocomplete="off"
                                              value="${jspBeanHeterostructure.thickness[loop.index]}" size="7"/></td>
                    <td align="center"><input type="text" name="x" autocomplete="off"
                                              value="${jspBeanHeterostructure.x[loop.index]}" size="7"/></td>
                    <td align="center"><input type="text" name="y" autocomplete="off"
                                              value="${jspBeanHeterostructure.y[loop.index]}" size="7"/></td>
                    <td align="center"><input type="text" name="temperature" autocomplete="off"
                                              value="${jspBeanHeterostructure.temperature[loop.index]}" size="7"/></td>
                    <td align="center"><input type="text" name="heat" autocomplete="off"
                                              value="${jspBeanHeterostructure.heat[loop.index]}" size="7"/></td>
                    <td align="center"><input type="text" name="nflow" autocomplete="off"
                                              value="${jspBeanHeterostructure.nflow[loop.index]}" size="7"/></td>
                    <td align="center">
                        <select id="dopant" name="dopant" value="${jspBeanHeterostructure.dopant[loop.index]}">
                            <option value=${Material.NO_DOPANT}
                                    <c:if test="${jspBeanHeterostructure.dopant[loop.index] == Material.NO_DOPANT}">
                                        <c:out value="selected"/></c:if>
                            >нет
                            </option>
                            <option value=${Material.Si_DOPANT}
                                    <c:if test="${jspBeanHeterostructure.dopant[loop.index] == Material.Si_DOPANT}">
                                        <c:out value="selected"/></c:if>
                            >Si
                            </option>
                            <option value=${Material.Mg_DOPANT}
                                    <c:if test="${jspBeanHeterostructure.dopant[loop.index] == Material.Mg_DOPANT}">
                                        <c:out value="selected"/></c:if>
                            >Mg
                            </option>
                        </select>
                    </td>
                    <td align="center"><input type="text" name="layerComment" autocomplete="off"
                                              value="${jspBeanHeterostructure.layerComment[loop.index]}" size="7"/></td>


                    <td id="buttonsCells" align="center">
                        <div style="display: block; margin: 0 auto; width: 4.5em;">
                            <input type="button" name="addButton" id="addLayerButton" value="+" style="color:#008000"
                                   onclick="addLayer(this.parentNode.parentNode.parentNode.rowIndex)">
                            <input type="button" name="modifyButton" id="addLayerButton" value="—" style="color:#800000"
                                   onclick="deleteLayer(this.parentNode.parentNode.parentNode.rowIndex)">
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class=submit>
            <div>
            <input class="main-button1" type="submit" value="<spring:message code="edit.save"/>"
                   formaction="saveHeterostructure">
            <input class="main-button1" type="submit" value="<spring:message code="edit.open"/>"
                   formaction="openHeterostructure">
            </div>
            <input class="main-button1" type="submit" value="<spring:message code="edit.delete"/>" style="color:#990000;"
                   formaction="deleteHeterostructure">
        </div>
    </div>
</sf:form>
</body>
<script src="<c:url value="/resources/js/tab.js"/>"></script>
</html>