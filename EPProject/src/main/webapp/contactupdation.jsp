<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
%>

<%
try
{
	Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contact_management", "root", "root");
    System.out.println("Connection Established");
    
    PreparedStatement pstmt = con.prepareStatement("update contacts set email=?, phone=?, address=? where id=?");
    pstmt.setString(1, email);
    pstmt.setString(2, phone);
    pstmt.setString(3, address);
    pstmt.setString(4, id);
    pstmt.executeUpdate();
    
    response.sendRedirect("updatesuccess.html");
    
}
catch(Exception e)
{
	out.println(e);
}
%>
