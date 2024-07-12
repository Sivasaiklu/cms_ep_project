<%@page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String password = request.getParameter("password");

try
{
	Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contact_management", "root", "root");
    System.out.println("Connection Established");
    
      String qry = "select * from admin where name=? and pwd=?";
	  PreparedStatement pstmt = con.prepareStatement(qry);
	  pstmt.setString(1, name);
	  pstmt.setString(2, password);
	  ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		  String username = rs.getString("name");
		 
		  session.setAttribute("name", name);
		    
		  response.sendRedirect("adminhome.jsp");
	  }
	  else
	  {
		  System.out.println("admin not found");
		  //response.sendRedirect("loginfail.html");
	  }
}
catch(Exception e)
{
	out.println(e);
}
%>