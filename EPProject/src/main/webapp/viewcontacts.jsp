<%@ page import="java.sql.*"%>
<%
String uid = (String) request.getParameter("uid");
%>

<%
try {
    Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    System.out.println("Driver Class Loaded");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/contact_management", "root", "root");
    System.out.println("Connection Established");

    PreparedStatement pstmt = con.prepareStatement("select * from contacts where user_id=?");
    pstmt.setString(1, uid);
    ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Contacts</title>
<style>
    body {
        background-image: url('https://i.pinimg.com/736x/97/ce/9f/97ce9f2b8f355fd7001d568bcc10a92f.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 20px;
        text-align: center;
    }

    h2 {
        color: #333;
        text-decoration: underline;
    }

    table {
        margin: 20px auto;
        border-collapse: collapse;
        width: 80%;
    }

    table, th, td {
        border: 2px solid #4CAF50;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    tr{
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }
</style>
</head>
<body>
<h2>View All Contacts</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Email ID</th>
        <th>Address</th>
    </tr>
    <%
    while(rs.next()) {
    %>
    <tr>
        <td><%=rs.getInt(1)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
    </tr>
    <%
    }
    %>
</table>
</body>
</html>
<%
}
catch(Exception e) {
    out.println(e);
}
%>
