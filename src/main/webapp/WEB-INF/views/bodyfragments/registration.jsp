<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsf/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>

<link rel="stylesheet" href="<c:url value="/resources/css/design-edit-styles.css"/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="<c:url value="/resources/js/scrollListOfHeterostructures.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function($){
        var $inputs = $('input[name="password"], input[name="email"]');
        $inputs.on('input', function () {
            $inputs.not(this).prop('required', !$(this).val().length);
        });
    });
</script>

<header class="section-header">
    <p><spring:message code="registration"/></p>
</header>
<section style="overflow: hidden;">
    <div>
        <div class="main-frame">
            <div class="col">
                <form action="registerNewUser">
                    <div class="col">
                        <spring:message code="registration.name"/>
                        <input class="name" type="text" name="userLogin" required="true"
                               autocomplete="off">
                        <br>
                        <div class="passwordOrEmail">
                            <div class="pw">
                                <spring:message code="registration.pw"/>
                                <input class="user-password" type="text" name="password" required
                                autocomplete="off">

                            </div>
                            <b><spring:message code="registration.andOr"/></b>
                            <div class="pw">
                                <spring:message code="registration.email"/>
                                <input class="email" type="text" name="email" required
                                       autocomplete="off">
                            </div>
                        </div>
                        <br>
                        <spring:message code="registration.role"/>
                        <%--<input class="user-role" type="text" name="role" &lt;%&ndash;placeholder="Имя пользователя"&ndash;%&gt;
                               autocomplete="off">--%>
                        <select class="user-role" name="userRole">
                            <option value="role_user">user</option>
                            <option value="role_admin">admin</option>
                            <option value="role_superadmin">superadmin</option>
                            <option value="role_banned">banned</option>
                        </select>
                        <br>
                        <br>
                        <input class="main-button1" type="submit" name="create" value="<spring:message code="registration.create"/>">
                        <br>
                        <br>
                    </div>
                    <%--<input class="main-button1" id="closeFilter" type="submit" name="search" value="x">--%>
                </form>


                <div id="tables">
                    <table class="tableHead" border="0" align="center">
                        <tbody>
                        <tr align="center">
                            <th style="width:3em"><spring:message code="registration.no"/></th>
                            <th style="width:10em"><spring:message code="registration.name"/></th>
                            <th style="width:15em">e-mail</th>
                            <th style="width:10em"><spring:message code="registration.pwEncrypted"/></th>
                            <th style="width:10em"><spring:message code="registration.role"/></th>
                        </tr>
                        </tbody>
                    </table>

                    <div class="main-window-table" style="max-height: 20em">
                        <table id="tableOfHeterostructures" border="0" align="center"
                        <%--width="43em--%>">
                        <tbody>
                        <col width="3em">
                        <col width="10em">
                        <col width="15em">
                        <col width="15em">
                        <c:forEach items="${listOfUsers}" var="aUser" varStatus="loop">
                            <tr>
                                <td align="center" style="width:3em">${loop.index+1}</td>
                                <td align="center" style="width:10em">${aUser[0]}</td>
                                <td align="center" style="width:15em">${aUser[1]}</td>
                                <td align="center" style="width:10em"><input type="text" value="${aUser[2]}" readonly>
                                </td>
                                <td align="center" style="width:10em">${aUser[3]}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

