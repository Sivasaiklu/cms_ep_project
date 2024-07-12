<%
String name = (String) session.getAttribute("name");
if(name == null){
    response.sendRedirect("adminsessionexpiry.html");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Home</title>
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
<h3>Welcome, Admin</h3>
<a href="viewallcontacts.jsp">View All Contacts</a>
<a href="viewallusers.jsp">View All Users</a>
<a href="index.html">Logout</a>


</body>
</html>
