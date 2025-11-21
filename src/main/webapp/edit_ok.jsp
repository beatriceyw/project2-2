<%@ page import="org.example.project4.dao.StockDao" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    Long id     = Long.valueOf(request.getParameter("id"));
    String code = request.getParameter("stockCode");
    String name = request.getParameter("stockName");
    String pbrStr = request.getParameter("pbr");
    String perStr = request.getParameter("per");

    Double pbr = (pbrStr != null && !pbrStr.trim().isEmpty()) ? Double.valueOf(pbrStr) : null;
    Double per = (perStr != null && !perStr.trim().isEmpty()) ? Double.valueOf(perStr) : null;

    StockDao dao = new StockDao();
    dao.updateById(id, code, name, pbr, per);

    String redirectUrl = request.getContextPath() + "/list.jsp?toast=" +
            java.net.URLEncoder.encode("수정 완료", "UTF-8");

    response.sendRedirect(redirectUrl);
%>
