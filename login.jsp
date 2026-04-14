<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>

<%
String error = "";
String action = request.getParameter("action");

if("POST".equalsIgnoreCase(request.getMethod())){

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role = request.getParameter("role");   // ✅ Added

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");

       Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/waffyland?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
    "root",
    "udhi.udhu.1"
);

        // LOGIN ACTION
        if("login".equals(action)){

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM users WHERE username=? AND password=? AND role=?"
    );

    ps.setString(1, username);
    ps.setString(2, password);
ps.setString(3,role);
    ResultSet rs = ps.executeQuery();

if(rs.next()){

    if("admin".equals(role)){
        session.setAttribute("admin", username);
        response.sendRedirect("admin.jsp");
        return;
    }

    if("customer".equals(role)){
        session.setAttribute("user", username);
        response.sendRedirect("home.jsp");
        return;
    }

}else{
    error = "Invalid username or password 💔";
}
}

        // DELETE ACCOUNT ACTION (unchanged)
        if("delete".equals(action)){

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM users WHERE username=?"
            );

            ps.setString(1, username);
            int rows = ps.executeUpdate();

            if(rows > 0){
                session.invalidate();
                response.sendRedirect("signup.jsp");
                return;
            }else{
                error = "account not found 😢";
            }
        }

        con.close();

    }catch(Exception e){
        error = e.getMessage();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🧇 waffyland 🧇</title>

<style>
/* YOUR ORIGINAL DESIGN — NOT CHANGED */
body {
    margin: 0;
    font-family: 'Comic Sans MS', 'Segoe UI', cursive;
    background: linear-gradient(rgba(255,228,225,0.8), rgba(255,240,245,0.8)),
                url("images/panake.jpg");
    background-size: cover;
    background-position: center;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-box {
    background: rgba(255,255,255,0.95);
    padding: 45px;
    width: 360px;
    border-radius: 25px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.2);
    text-align: center;
    animation: floatUp 0.8s ease-in-out;
}

@keyframes floatUp {
    from { opacity: 0; transform: translateY(-40px); }
    to { opacity: 1; transform: translateY(0); }
}

.login-image {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 15px;
    border: 3px solid #ffb347;
}

h2 {
    color: #ff8c00;
    margin-bottom: 5px;
}

.tagline {
    font-size: 13px;
    color: #a0522d;
    margin-bottom: 25px;
}

input {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border-radius: 15px;
    border: 1px solid #ffd699;
    outline: none;
    font-size: 14px;
    background: #fff8f0;
}

input:focus {
    border-color: #ff8c00;
}

button {
    width: 100%;
    padding: 12px;
    margin-top: 10px;
    background: linear-gradient(to right, #ffb347, #ffcc80);
    border: none;
    border-radius: 20px;
    font-weight: bold;
    cursor: pointer;
    font-size: 14px;
    transition: 0.3s;
}

button:hover {
    transform: scale(1.05);
    background: linear-gradient(to right, #ff8c00, #ffa500);
}

.error{
    margin-top: 10px;
    font-size: 13px;
    color: crimson;
}

.signup {
    margin-top: 18px;
    font-size: 13px;
}

.signup a {
    text-decoration: none;
    color: #ff8c00;
    font-weight: bold;
}

.signup a:hover {
    text-decoration: underline;
}

.link-small{
    margin-top:10px;
    font-size:13px;
}
.link-small a{
    color:#a0522d;
    text-decoration:none;
}
.link-small a:hover{
    text-decoration:underline;
}
</style>
</head>

<body>

<div class="login-box">

    <img src="images/loginpage.jpg" class="login-image" alt="Login Image">

    <h2>🧇 waffyland 🧇</h2>
    <div class="tagline">fluffy bites & syrup smiles 🍯</div>

    <!-- LOGIN FORM -->
   <form method="post" action="login.jsp">
    <input type="hidden" name="action" value="login">

    <!-- ✅ DROPDOWN ADDED -->
    <select name="role" required>
        <option value="">Select Login Type</option>
        <option value="customer">Customer</option>
        <option value="admin">Admin</option>
    </select>

    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">login 💖</button>
</form>

    <!-- FORGOT PASSWORD -->
    <div class="link-small">
        <a href="updatepassword.jsp">forgot password?</a>
    </div>

    <!-- DELETE ACCOUNT -->
    <!-- DELETE BUTTON TO SHOW FORM -->
<button type="button" onclick="showDelete()">delete account 💔</button>

<!-- HIDDEN DELETE FORM -->
<div id="deleteBox" style="display:none;">
    <form method="post" action="login.jsp">
        <input type="hidden" name="action" value="delete">
        <input type="text" name="username" placeholder="username" required>
        <input type="password" name="password" placeholder="password" required>
        <button type="submit">confirm delete 💔</button>
    </form>
</div>

<script>
function showDelete(){
    document.getElementById("deleteBox").style.display="block";
}
</script>

    <div class="error"><%= error %></div>

    <div class="signup">
        new to waffyland? <a href="signup.jsp">signup ✨</a>
    </div>

</div>

</body>
</html>