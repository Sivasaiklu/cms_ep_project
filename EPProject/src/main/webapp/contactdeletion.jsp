<%@ page import="java.sql.*" %>
<%

int uid = Integer.parseInt(request.getParameter("id")); 

try
{
	Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contact_management", "root", "root");
    System.out.println("Connection Established"); 
    
    String qry = "delete from contacts where user_id=?";
    PreparedStatement pstmt = con.prepareStatement(qry);
    pstmt.setInt(1, uid);
    int n = pstmt.executeUpdate();
    
    response.sendRedirect("deletecontacts.jsp");
    
}
catch(Exception e)
{
	out.println(e);
}
%>