<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.project4.dao.StockDao" %>
<%@ page import="org.example.project4.bean.StockVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    request.setCharacterEncoding("UTF-8");

    Long id = Long.valueOf(request.getParameter("id"));
    StockDao dao = new StockDao();
    StockVO vo = dao.findById(id);

    request.setAttribute("prefill", vo);
%>

<c:set var="pageTitle" value="종목 수정"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>

<%-- URL 미리 생성 --%>
<c:url var="editOkUrl" value="/edit_ok.jsp"/>
<c:url var="listUrl"   value="/list.jsp"/>

<form method="post" action="${editOkUrl}" class="form">
    <input type="hidden" name="id" value="${prefill.id}"/>

    <div class="row">
        <label>종목코드</label>
        <input name="stockCode"
               value="${prefill.stockCode}"
               required />
    </div>

    <div class="row">
        <label>종목명</label>
        <input name="stockName"
               value="${prefill.stockName}" />
    </div>

    <div class="row">
        <label>PBR</label>
        <input name="pbr" type="number" step="0.0001"
               value="${prefill.pbr}"/>
    </div>

    <div class="row">
        <label>PER</label>
        <input name="per" type="number" step="0.0001"
               value="${prefill.per}"/>
    </div>

    <div class="actions">
        <button type="submit">수정</button>
        <a class="button" href="${listUrl}">목록</a>
    </div>
</form>

<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
