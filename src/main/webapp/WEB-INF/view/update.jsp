<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>
<head>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <title>Parts Page</title>
</head>

<body>
<div class="container theme-showcase" style="max-width: 40%">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h1 align="center">Изменить деталь </h1>
        </div>
        <div class="panel-body">
            <c:url var="addAction" value="/parts/update"></c:url>
            <form:form action="${addAction}" commandName="update">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Поле</th>
                        <th>Значение</th>
                    </tr>
                    </thead>
                    <tr>
                        <td>
                            <form:label path="id">
                                <spring:message text="ID"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="id" readonly="true" size="8" disabled="true"/>
                            <form:hidden path="id"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="name">
                                <spring:message text="Наименование"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input class="form-control" path="name" />
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <form:label path="needed">
                                <spring:message text="Необходимость"/>
                            </form:label>
                        </td>
                        <td>
                            <form:select class="form-control" path="needed">
                                <option>false</option>
                                <option>true</option>
                            </form:select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="amount">
                                <spring:message text="Количество"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input class="form-control" path="amount"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="well well-sm text-center">
                            <input class="btn btn-primary btn-lg " type="submit" value="<spring:message text="Изменить"/>"/>
                        </td>
                    </tr>
                </table>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>
