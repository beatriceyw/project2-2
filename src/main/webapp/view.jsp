<%@ page import="org.example.project4.dao.StockDao" %>
<%@ page import="org.example.project4.bean.StockVO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");

    Long id = Long.valueOf(request.getParameter("id"));
    StockDao dao = new StockDao();
    StockVO vo = dao.findById(id);

    request.setAttribute("vo", vo);
%>

<c:set var="pageTitle" value="종목 상세"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>

<%-- URL 미리 생성 --%>
<c:url var="listUrl" value="/list.jsp"/>
<c:url var="editUrl" value="/edit.jsp"/>

<div class="form" style="margin-top: 18px;">
    <div class="row">
        <label>ID</label>
        <div>${vo.id}</div>
    </div>

    <div class="row">
        <label>코드</label>
        <div>${vo.stockCode}</div>
    </div>

    <div class="row">
        <label>이름</label>
        <div>${vo.stockName}</div>
    </div>

    <div class="row">
        <label>PBR</label>
        <div>${vo.pbr}</div>
    </div>

    <div class="row">
        <label>PER</label>
        <div>${vo.per}</div>
    </div>

    <div class="row">
        <label>등록일</label>
        <div>${vo.createDateText}</div>
    </div>

    <div class="actions" style="margin-top: 16px;">
        <a class="button" href="${editUrl}?id=${vo.id}">수정</a>
        <a class="button" href="${listUrl}">목록</a>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
