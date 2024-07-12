<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String username = request.getParameter("name");
String password = request.getParameter("password");
%>

<%
try
{
	Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contact_management", "root", "root");
    System.out.println("Connection Established");
    
    PreparedStatement pstmt = con.prepareStatement("insert into users(username, password, email) values(?,?,?)");
    pstmt.setString(1, username);
    pstmt.setString(2, password);
    pstmt.setString(3, email);
    pstmt.executeUpdate();
    
    response.sendRedirect("usersuccess.html");
    
}
catch(Exception e)
{
	out.println(e);
}
%>
