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
    <div class="container theme-showcase" style="max-width: 70%">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h1 class="text-center">Список компьютерных запчастей</h1>
            </div>

            <div class="panel-body">

                <div class="well well-sm">
                    <form action="/parts">
                        <input class="form-control pull-left" style="max-width: 300px;" type="text" placeholder="наименование" name="param"/>
                        <span style="padding-left: 10px;"></span>
                        <input class="btn btn-primary" type="submit" value="Найти" />
                    </form>
                    <div id="edit" class="pull-right" style="max-width: 250px; margin-top:-48px">
                        <a href="/edit/0" class="btn btn-success btn-lg btn-block center-block">Добавить деталь</a>
                    </div>
                </div>

                <form action="/parts" class="well well-sm text-center">
                    <button class="btn btn-primary" name="param" type="submit" value="all">Все детали</button>
                    <button class="btn btn-primary" name="param" type="submit" value="needOnly">Обязательные</button>
                    <button class="btn btn-primary" name="param" type="submit" value="optionOnly">Опциональные</button>
                </form>

                <c:if test="${!empty listParts}">
                    <table class="table table-striped text-center">
                        <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Наименование</th>
                            <th class="text-center">Необходимость</th>
                            <th class="text-center">Количество</th>
                            <th class="text-center">Изменение</th>
                            <th class="text-center">Удаление</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listParts}" var="part">
                            <tr>
                                <td>${part.id}</td>
                                <td>${part.name}</td>
                                <c:choose>
                                    <c:when test = "${part.needed}">
                                        <td>да</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>нет</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${part.amount}</td>
                                <td><a class="btn btn-info" href="<c:url value='/edit/${part.id}'/>">Изменить</a></td>
                                <td><a class="btn btn-danger" href="<c:url value='/remove/${part.id}'/>">Удалить</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="panel panel-success text-center">
                        <div class="panel-heading">
                            <h3 class="panel-title">Количество компьютеров которое можно собрать</h3>
                            <p class="text-info lead" style="padding-top: 10px;"><strong>${availableComputers}</strong></p>
                        </div>
                    </div>
                </c:if>
                <div class="well well-sm text-center">
                    <c:url value="/parts" var="prev">
                        <c:param name="page" value="${page-1}"/>
                    </c:url>
                    <c:if test="${page > 1}">
                        <a class="btn btn-default" href="<c:out value="${prev}" />">Prev</a>
                    </c:if>

                    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                        <c:choose>
                            <c:when test="${page == i.index}">
                                <span class="btn btn-info">${i.index}</span>
                            </c:when>
                            <c:otherwise>
                                <c:url value="/parts" var="url">
                                    <c:param name="page" value="${i.index}"/>
                                </c:url>
                                <a class="btn btn-default" href='<c:out value="${url}" />'>${i.index}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:url value="parts" var="next">
                        <c:param name="page" value="${page + 1}"/>
                    </c:url>
                    <c:if test="${page + 1 <= maxPages}">
                        <a class="btn btn-default" href='<c:out value="${next}" />'>Next</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
