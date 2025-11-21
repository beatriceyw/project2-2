<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="종목 추가"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>

<%-- URL 미리 생성 --%>
<c:url var="listUrl"   value="/list.jsp"/>
<c:url var="writeOkUrl" value="/write_ok.jsp"/>

<form method="post" action="${writeOkUrl}" class="form">

    <div class="row">
        <label>종목코드</label>
        <input name="stockCode" required />
    </div>

    <div class="row">
        <label>종목명</label>
        <input name="stockName"/>
    </div>

    <div class="row">
        <label>PBR</label>
        <input name="pbr" type="number" step="0.0001"/>
    </div>

    <div class="row">
        <label>PER</label>
        <input name="per" type="number" step="0.0001"/>
    </div>

    <div class="actions">
        <button type="submit">추가</button>
        <a class="button" href="${listUrl}">목록</a>
    </div>

</form>

<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
