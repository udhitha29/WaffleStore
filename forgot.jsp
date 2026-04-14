<%@ page import="java.sql.*" %>

<%
String dbUrl = "jdbc:mysql://localhost:3306/waffyland";
String dbUser = "root";
String dbPass = "";

if("update".equals(request.getParameter("action"))){

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

        PreparedStatement ps = con.prepareStatement(
            "UPDATE users SET password=? WHERE username=?"
        );

        ps.setString(1, password);
        ps.setString(2, username);
        ps.executeUpdate();

        ps.close();
        con.close();

        response.sendRedirect("login.jsp"); // ✅ back to login
        return;

    } catch(Exception e){
        out.println(e);
    }
}
%>

<form method="post">
    <input type="hidden" name="action" value="update">
    Username:<br>
    <input type="text" name="username" required><br>
    New Password:<br>
    <input type="password" name="password" required><br><br>
    <button type="submit">Update Password</button>
</form>

<br>
<a href="login.jsp">Back to Login</a>