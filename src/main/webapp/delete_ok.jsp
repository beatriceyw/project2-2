<%@ page import="org.example.project4.dao.StockDao" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String code = request.getParameter("code");

    StockDao dao = new StockDao();
    dao.delete(code);

    String redirectUrl = request.getContextPath() + "/list.jsp?toast=" +
            java.net.URLEncoder.encode("삭제 완료", "UTF-8");

    response.sendRedirect(redirectUrl);
%>
