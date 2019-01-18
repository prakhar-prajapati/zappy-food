<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader ("Expires", 0);
%>

<%
session.invalidate();//destroy all session attribute from server
response.sendRedirect("index.jsp");
%>