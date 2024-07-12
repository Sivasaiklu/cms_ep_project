<%@ page import="java.sql.*"%>
<%

String uid = (String)request.getParameter("uid");
%>

<%
try
{
    Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/contact_management", "root", "root");
    System.out.println("Connection Established"); 
    
    PreparedStatement pstmt = con.prepareStatement("select * from contacts where user_id=?");
    pstmt.setString(1, uid);
    ResultSet rs = pstmt.executeQuery();
    %>
    <body >
    <h2 align="center"><u>View All Contacts</u></h2>
    <table align="center" border="2">
    <tr>
    <td>ID</td>
    <td>Name</td>
    <td>Phone</td>
    <td>Email ID</td>
    <td>Address</td>
    <td>Action</td>
    </tr>
    </body>
    
    <%
    while(rs.next())
    {
      %>
      <tr>
      <td><%=rs.getInt(2)%></td>
      <td><%=rs.getString(3)%></td>
      <td><%=rs.getString(4)%></td>
      <td><%=rs.getString(5)%></td>
      <td><%=rs.getString(6)%></td>
      <td><a href="contactdeletion.jsp?id=<%=rs.getInt(2)%>">Delete</a></td>
      </tr>
      <%
    }
    %>
    
    </table>
    <%
}
catch(Exception e)
{
  out.println(e);
}
%>