<header>
    <h1>주식 마스터</h1>
    <nav>
        <a href="<c:url value='../list.jsp'/>">목록</a>
        <a href="<c:url value='../write.jsp'/>">추가</a>
    </nav>
</header>

<c:if test="${not empty param.toast}">
    <div class="toast">
        <c:out value="${param.toast}"/>
    </div>
</c:if>
<hr/>
