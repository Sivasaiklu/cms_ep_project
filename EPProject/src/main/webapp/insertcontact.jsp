<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String uid = request.getParameter("user_id");
%>

<%
try
{
	Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contact_management", "root", "root");
    System.out.println("Connection Established");
    
    PreparedStatement pstmt = con.prepareStatement("insert into contacts(user_id, name, phone, email, address) values(?,?,?,?,?)");
    pstmt.setString(1, uid);
    pstmt.setString(2, name);
    pstmt.setString(3, phone);
    pstmt.setString(4, email);
    pstmt.setString(5, address);
    pstmt.executeUpdate();
    
    response.sendRedirect("contactsuccess.html");
    
}
catch(Exception e)
{
	out.println(e);
}
%>
