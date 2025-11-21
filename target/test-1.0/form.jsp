<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 편집 여부 판단: prefill 이 있으면 수정 모드 --%>
<c:set var="isEdit" value="${not empty prefill}"/>

<%-- 페이지 제목 설정 (top.jsp에서 사용) --%>
<c:set var="pageTitle" value="${isEdit ? '종목 수정' : '종목 추가'}"/>
<jsp:include page="/WEB-INF/views/common/top.jsp"/>

<%-- 액션 URL: 수정이면 edit_ok.jsp, 아니면 write_ok.jsp --%>
<c:url var="formAction" value="${isEdit ? '/edit_ok.jsp' : '/write_ok.jsp'}"/>
<c:url var="listUrl"   value="/list.jsp"/>

<form method="post" action="${formAction}" class="form">
    <c:if test="${isEdit}">
        <input type="hidden" name="id" value="${prefill.id}"/>
    </c:if>

    <div class="row">
        <label>종목코드</label>

        <c:choose>
            <c:when test="${isEdit}">
                <%-- 수정 모드에서는 코드 read-only --%>
                <input name="stockCode"
                       value="${prefill.stockCode}"
                       readonly />
            </c:when>
            <c:otherwise>
                <input name="stockCode" required />
            </c:otherwise>
        </c:choose>
    </div>

    <div class="row">
        <label>종목명</label>
        <input name="stockName"
               value="${isEdit ? prefill.stockName : ''}"
               placeholder="${isEdit ? '비워두면 기존 유지' : ''}" />
    </div>

    <div class="row">
        <label>PBR</label>
        <input name="pbr" type="number" step="0.0001"
               value="${isEdit ? prefill.pbr : ''}"/>
    </div>

    <div class="row">
        <label>PER</label>
        <input name="per" type="number" step="0.0001"
               value="${isEdit ? prefill.per : ''}"/>
    </div>

    <div class="actions">
        <button type="submit">${isEdit ? '수정' : '추가'}</button>
        <a class="button" href="${listUrl}">목록</a>
    </div>
</form>

<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
