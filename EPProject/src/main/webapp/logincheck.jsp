<%@page import="java.sql.*"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

try
{
	Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contact_management", "root", "root");
    System.out.println("Connection Established");
    
      String qry = "select * from users where email=? and password=?";
	  PreparedStatement pstmt = con.prepareStatement(qry);
	  pstmt.setString(1, email);
	  pstmt.setString(2, password);
	  ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		  String username = rs.getString("username");
		  String uid = rs.getString("id");
		 
		  session.setAttribute("username", username);
		  session.setAttribute("email", email); 
		  session.setAttribute("uid", uid);
		    
		  response.sendRedirect("userhome.jsp");
	  }
	  else
	  {
		  response.sendRedirect("loginfail.html");
	  }
}
catch(Exception e)
{
	out.println(e);
}
%>