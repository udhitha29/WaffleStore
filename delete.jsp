<%@ page import="java.sql.*" %>

<%
String dbUrl = "jdbc:mysql://localhost:3306/waffyland";
String dbUser = "root";
String dbPass = "";

if("delete".equals(action)){

    PreparedStatement ps = con.prepareStatement(
        "DELETE FROM users WHERE username=? AND password=?"
    );

    ps.setString(1, username);
    ps.setString(2, password);

    int rows = ps.executeUpdate();

    if(rows > 0){
        session.invalidate();
        response.sendRedirect("signup.jsp");
        return;
    }else{
        error = "invalid username or password 😢";
    }
}
        
%>

<form method="post">
    <input type="hidden" name="action" value="delete">
    Enter Username to Delete:<br>
    <input type="text" name="username" required><br><br>
    <button type="submit" onclick="return confirm('Are you sure?')">
        Delete Account
    </button>
</form>

<br>
<a href="login.jsp">Back to Login</a>