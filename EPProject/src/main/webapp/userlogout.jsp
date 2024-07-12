<%
session.removeAttribute("name");
session.removeAttribute("email");
session.removeAttribute("contact");

response.sendRedirect("userlogin.html");
%>