<%
session.invalidate();//destroy all session attribute from server
response.sendRedirect("Aindex.jsp");
%>