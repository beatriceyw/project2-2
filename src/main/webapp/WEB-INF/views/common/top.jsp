<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>

    <title>
        <c:choose>
            <c:when test="${not empty pageTitle}">
                ${pageTitle}
            </c:when>
            <c:otherwise>주식 마스터</c:otherwise>
        </c:choose>
    </title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<%-- 상단 헤더 + 정렬 버튼 --%>
<header>
    <div>
        <h1>주식 마스터</h1>
        <p style="margin:4px 0 0; font-size:13px; color:#6b7280;">
            <c:out value="${pageTitle}" default="종목 관리"/>
        </p>
    </div>

    <nav>

        <%-- ID순(= 등록순) --%>
        <c:url var="idUrl" value="/list.jsp">
            <c:param name="mode" value="inserted"/>
        </c:url>

        <%-- 이름순 --%>
        <c:url var="nameUrl" value="/list.jsp">
            <c:param name="mode" value="name"/>
        </c:url>

        <a href="${idUrl}">ID순</a>
        <a href="${nameUrl}">이름순</a>
    </nav>
</header>
