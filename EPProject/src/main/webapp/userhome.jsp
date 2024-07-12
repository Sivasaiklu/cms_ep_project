<%
String username = (String) session.getAttribute("username");
String email = (String) session.getAttribute("email");
String uid = (String) session.getAttribute("uid");

if(username == null || email == null || uid == null){
	response.sendRedirect("sessionexpiry.html");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>User Home</title>
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

    a {
        display: inline-block;
        margin: 10px;
        padding: 10px 20px;
        font-size: 1em;
        color: #fff;
        background-color: #4CAF50;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    a:hover {
        background-color: #45a049;
    }

    h3 {
        color: #333;
        font-size: 24px;
        margin-top: 20px;
    }

    .info {
        margin: 20px 0;
        font-size: 1.2em;
    }

    .info span {
        font-weight: bold;
    }
</style>
</head>
<body>


<h3> Welcome,<%=username %> </h3>

<div class="info">
    UID: <span><%=uid %></span> <br/>
    Email: <span><%=email %></span> <br/>
</div>

<a href="userlogout.jsp">Logout</a>
<a href="addcontact.jsp?uid=<%= uid %>">Add Contacts</a>
<a href="viewcontacts.jsp?uid=<%=uid %>">View Contacts</a>
<%-- <a href="deletecontacts.jsp?uid=<%=uid %>">Delete Contacts</a> --%>
<a href="updatecontact.html?uid=<%=uid %>">Update Contacts</a>

</body>
</html>
