<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.project4.dao.StockDao" %>
<%@ page import="org.example.project4.bean.StockVO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");

    String q = request.getParameter("q");
    String mode = request.getParameter("mode");

    StockDao dao = new StockDao();
    List<StockVO> stocks;

    if (q != null && !q.trim().isEmpty()) {
        stocks = dao.search(q);
    } else if ("inserted".equalsIgnoreCase(mode)) {
        stocks = dao.findAllOrderByInserted();
    } else {
        stocks = dao.findAllOrderByName();
    }

    request.setAttribute("stocks", stocks);
%>

<c:set var="pageTitle" value="종목 목록"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>

<%-- 공통으로 쓸 URL 미리 생성 --%>
<c:url var="listUrl"   value="/list.jsp"/>
<c:url var="writeUrl"  value="/write.jsp"/>
<c:url var="viewUrl"   value="/view.jsp"/>
<c:url var="editUrl"   value="/edit.jsp"/>
<c:url var="deleteUrl" value="/delete_ok.jsp"/>

<div class="search-bar">
    <form method="get" action="${listUrl}" class="search-form">
        <input type="text" name="q" value="${param.q}" placeholder="코드 또는 이름 검색"/>
        <button type="submit">검색</button>
    </form>

    <a href="${writeUrl}" class="button add-button">종목 추가</a>
</div>

<table class="list">
    <thead>
    <tr>
        <th>ID</th>
        <th>코드</th>
        <th>이름</th>
        <th>PBR</th>
        <th>PER</th>
        <th>관리</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="s" items="${stocks}">
        <tr>
            <td>${s.id}</td>
            <td>${s.stockCode}</td>
            <td>
                <a href="${viewUrl}?id=${s.id}">${s.stockName}</a>
            </td>
            <td>${s.pbr}</td>
            <td>${s.per}</td>
            <td class="actions">
                <a href="${editUrl}?id=${s.id}">수정</a>
                <a href="${deleteUrl}?code=${s.stockCode}">삭제</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
