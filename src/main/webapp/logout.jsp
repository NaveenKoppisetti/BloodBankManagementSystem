<%
session.removeAttribute("username");
out.println("logout successfully");
response.sendRedirect("login.html");
%>