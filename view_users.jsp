<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String userRole = (String)session.getAttribute("userRole");
if(userRole == null || !"admin".equals(userRole)){
    response.sendRedirect("login.jsp");
    return;
}

ResultSet rs = null;
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/waffyland?useSSL=false&serverTimezone=UTC",
        "root",
        "your_password_here"
    );
    Statement st = con.createStatement();
    rs = st.executeQuery("SELECT id, username, role FROM users ORDER BY id ASC");
}catch(Exception e){
    out.println("Error: "+e.getMessage());
}
%>
<!DOCTYPE html>
<html>
<head>
<title>View Users</title>
<style>
body{font-family:Arial; background:#fff0f5;}
.container{max-width:700px;margin:30px auto;padding:20px;background:#fff;border-radius:10px;box-shadow:0 0 10px rgba(0,0,0,0.1);}
table{width:100%;border-collapse:collapse;}
th, td{border:1px solid #ccc;padding:8px;text-align:center;}
th{background:#ff8c00;color:white;}
a{display:block;margin-top:10px;color:white;background:#ff8c00;padding:10px;text-decoration:none;text-align:center;border-radius:5px;}
a:hover{background:#ff4500;}
</style>
</head>
<body>
<div class="container">
<h2>Users List</h2>
<table>
<tr>
<th>ID</th>
<th>Username</th>
<th>Role</th>
</tr>
<%
while(rs != null && rs.next()){
%>
<tr>
<td><%= rs.getInt("id") %></td>
<td><%= rs.getString("username") %></td>
<td><%= rs.getString("role") %></td>
</tr>
<%
}
%>
</table>
<a href="admin_home.jsp">⬅ Back to Dashboard</a>
</div>
</body>
</html>