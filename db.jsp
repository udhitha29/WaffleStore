<%@ page import="java.sql.*" %>

<%
Connection con = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/waffyland?useSSL=false&serverTimezone=UTC",
        "root",
        "udhi.udhu.1"
    );

}catch(Exception e){
    out.println("DB Error: "+e.getMessage());
}
%>