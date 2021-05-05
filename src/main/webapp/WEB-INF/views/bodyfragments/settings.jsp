<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<ul class="nav nav-tabs">
    <li class="nav-item  ">
        <a class="nav-link active" data-toggle="tab" href="#data"><spring:message code="settings.DB.page"/></a>
    </li>
    <li class="nav-item">
        <a class="nav-link " data-toggle="tab" href="#graphic"><spring:message code="settings.graphics.page"/></a>
    </li>
    <li class="nav-item">
        <a class="nav-link " href="settings/registration/"><spring:message code="settings.user.page"/></a>
    </li>
</ul>
<div class="tab-content border border-top-0 bg-white flex-grow-1">

    <div class="tab-pane show active " id="data">
        <form>
        <div>
            <p class="mt-5 ml-5 text-info"><spring:message code="settings.exportDB"/></p>
            <button class="btn btn-info ml-5" formaction="/settings/data/export/"><spring:message code="settings.exportData"/></button>
        </div>
        </form>
        <hr class="m-5" color=>
        <form method="POST" enctype="multipart/form-data">
        <p class="mt-5 ml-5 text-info"><spring:message code="settings.importDB"/></p>
        <div class="ml-5 d-flex align-items-center">
            <div class="custom-file" style="width: 30em">
                <input type="file" name="file" class="custom-file-input" id="customFile" accept="application/JSON">
                <label class="custom-file-label" for="customFile" style="width: 30em"><spring:message code="settings.selectFile"/></label>
            </div>
            <button class="btn btn-info ml-5" formaction="/settings/data/import/"><spring:message code="settings.importData"/></button>
        </div>
        </form>
        <div class="m-5">
            <p class="text-success">
                ${message}
            </p>
        </div>
        <script>
            $(".custom-file-input").on("change", function() {
                var fileName = $(this).val().split("\\").pop();
                $(this).siblings(".custom-file-label").addClass("selected").html(fileName);});
        </script>
    </div>

    <div class="tab-pane" id="graphic">
        <p class="text-danger p-5">
            No page yet, sorry...
        </p>
    </div>

    <div class="tab-pane" id="userRegistration" class="border border-danger">
    </div>

</div>

