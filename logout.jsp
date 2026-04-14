<%@ page import="java.sql.*" %>

<%
String username = (String) session.getAttribute("user");

if(username != null){

    Connection con = null;
    PreparedStatement ps = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/waffyland?useSSL=false&serverTimezone=UTC",
            "root",
            "udhi.udhu.1"
        );

        ps = con.prepareStatement(
            "DELETE FROM users WHERE username=?"
        );

        ps.setString(1, username);
        ps.executeUpdate();

    }catch(Exception e){
        out.println(e.getMessage());
    }
    finally{
        if(ps != null) try { ps.close(); } catch(Exception e){}
        if(con != null) try { con.close(); } catch(Exception e){}
    }
}

session.invalidate();
response.sendRedirect("login.jsp");
return;
%>