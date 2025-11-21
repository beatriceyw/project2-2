<%@ page import="org.example.project4.dao.StockDao" %>
<%@ page import="org.example.project4.bean.StockVO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String code = request.getParameter("stockCode");
    String name = request.getParameter("stockName");
    String pbrStr = request.getParameter("pbr");
    String perStr = request.getParameter("per");

    Double pbr = (pbrStr != null && !pbrStr.trim().isEmpty()) ? Double.valueOf(pbrStr) : null;
    Double per = (perStr != null && !perStr.trim().isEmpty()) ? Double.valueOf(perStr) : null;

    StockDao dao = new StockDao();
    dao.insert(new StockVO(null, code, name, pbr, per, null));

    response.sendRedirect("list.jsp?toast=" + java.net.URLEncoder.encode("추가 완료", "UTF-8"));
%>
