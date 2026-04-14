<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String message = "";

if("POST".equalsIgnoreCase(request.getMethod())){

    String username = request.getParameter("username");
    String newpassword = request.getParameter("newpassword");

    if(username != null && newpassword != null){

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/waffyland?useSSL=false&serverTimezone=UTC",
                "root",
                "udhi.udhu.1"
            );

            PreparedStatement ps = con.prepareStatement(
                "UPDATE users SET password=? WHERE username=?"
            );

            ps.setString(1, newpassword);
            ps.setString(2, username);

            int rows = ps.executeUpdate();

            if(rows > 0){
                response.sendRedirect("login.jsp");
                return;
            }else{
                message = "username not found 😢";
            }

            con.close();

        }catch(Exception e){
            message = e.getMessage();
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Password</title>

<style>
body {
    margin: 0;
    font-family: 'Comic Sans MS', cursive;
    background: linear-gradient(rgba(255,228,225,0.8), rgba(255,240,245,0.8)),
                url("images/panake.jpg");
    background-size: cover;
    height: 100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.box{
    background:white;
    padding:40px;
    width:350px;
    border-radius:25px;
    text-align:center;
    box-shadow:0 15px 35px rgba(0,0,0,0.2);
}

input{
    width:100%;
    padding:10px;
    margin:10px 0;
    border-radius:15px;
    border:1px solid #ffd699;
}

button{
    width:100%;
    padding:10px;
    background:#ffb347;
    border:none;
    border-radius:20px;
    font-weight:bold;
    cursor:pointer;
}

.msg{
    color:crimson;
    font-size:13px;
}
a{
    display:block;
    margin-top:10px;
    font-size:13px;
    text-decoration:none;
    color:#ff8c00;
}
</style>
</head>

<body>

<div class="box">

<h2>🔐 update password</h2>

<form method="post">
    <input type="text" name="username" placeholder="username" required>
    <input type="password" name="newpassword" placeholder="new password" required>
    <button type="submit">update 💛</button>
</form>

<div class="msg"><%= message %></div>

<a href="login.jsp">⬅ back to login</a>

</div>
</body>
</html>